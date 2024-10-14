package java5.asm.controllers;

import jakarta.persistence.EntityManager;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java5.asm.dao.usersDAO;
import java5.asm.model.taikhoan;
import java5.asm.services.CookieService;
import java5.asm.services.EmailSenderService;
import java5.asm.services.NotificationService;
import java5.asm.services.SessionService;
import java5.asm.utils.AuthUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Random;

@Controller
public class LoginController {
    @Autowired
    SessionService sessionService;
    @Autowired
    CookieService cookieService;
    @Autowired
    usersDAO usersDAO;
    @Autowired
    EntityManager em;
    @Autowired
    HttpServletRequest req;
    @Autowired
    HttpServletResponse resp;
    @Autowired
    AuthUtils authUtils;
    @Autowired
    private EmailSenderService mailService;
    @Autowired
    NotificationService notificationService;
    String otp;

    @GetMapping("/login")
    public String loginIndex(@ModelAttribute("taikhoan") taikhoan taikhoan) {
        taikhoan user = authUtils.getCurrentUser();
        if (user != null) {
            return "redirect:/home";
        }
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam("tentaikhoan") String username,
                        @RequestParam("matkhau") String password,
                        @RequestParam(value = "remember", defaultValue = "false") boolean remember,
                        RedirectAttributes ra,
                        Model model) {
        taikhoan user = usersDAO.findById(username).orElse(null);
        if (user != null) {
            var token = authUtils.generateToken(username);
//            System.out.println(token);
//            var info = authUtils.getIdFormToken(token);
//            System.out.println(info);
            if (authUtils.checkPass(username, password)) {
                sessionService.set("token", token);
                if (remember) {
                    cookieService.add("token", token, 24);
                }
                notificationService.addNotiBox(ra, "Đăng nhập thành công");
                return "redirect:/home";
            } else {
                model.addAttribute("message", "Sai tên đăng nhập hoặc mật khẩu");
                return "login";
            }
        }
        model.addAttribute("message", "Sai tên đăng nhập hoặc mật khẩu");
        return "login";
    }

    @RequestMapping("/logout")
    public String logout() {
        sessionService.remove("token");
        cookieService.remove("token");
        return "redirect:/home";
    }

    @GetMapping("/signup")
    public String signupIndex(@ModelAttribute("taikhoan") taikhoan taikhoan, Model model) {

        return "signup";
    }

    @PostMapping("/signup")
    public String signup(@RequestParam("cpass") String cpass,
                         @ModelAttribute("taikhoan") @Validated taikhoan user,
                         Errors errors, Model model, RedirectAttributes ra) {
        if (errors.hasErrors()) {
            return "signup";
        }
        if (usersDAO.findById(user.getTentaikhoan()).isPresent()) {
            model.addAttribute("message", "Tên tài khoản đã tồn tại");
            return "signup";
        }
        if (!usersDAO.findByEmail(user.getEmail()).isEmpty()) {
            model.addAttribute("message", "Email đã tồn tại");
            return "signup";
        }
        if (!cpass.equals(user.getMatkhau())) {
            model.addAttribute("message", "Mật khẩu không khớp");
            return "signup";
        }
        model.addAttribute("message", "Đăng ký thành công");
        String pass = user.getMatkhau();
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder(10);
        user.setMatkhau(passwordEncoder.encode(pass));
        usersDAO.save(user);
        notificationService.addNotiBox(ra, "Đăng ký thành công");
        return "redirect:/login";
    }

    @RequestMapping("/forgot-password")
    public String forgotPassword() {
        return "forgot-password";
    }

    @RequestMapping("/forgot-password/sendOtp")
    public String sendMail(@RequestParam("email") String email,
                           RedirectAttributes redirectAttributes,
                           Model model)
            throws Exception {
        List<taikhoan> users = usersDAO.findByEmail(email);
        taikhoan user = users.isEmpty() ? null : users.getFirst();
        if (user == null) {
//            redirectAttributes.addFlashAttribute("message", "Email không tồn tại");
            notificationService.addNotiBox(redirectAttributes, "Email không tồn tại");
            return "redirect:/forgot-password";
        }
        sessionService.set("email", email);
        redirectAttributes.addFlashAttribute("email", email);
        otp = generateOTP();
//        System.out.println(otp);
        String emailContent = "<h2>Xác nhận email</h2>"
                + "<p>Xin chào " + user.getFirstname() + " " + user.getLastname() + ",</p>"
                + "<p>Vui lòng sử dụng mã xác nhận bên dưới để hoàn tất quên mật khẩu:</p>"
                + "<h3 style='color:blue;'>" + otp + "</h3>"
                + "<p>Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi.</p>";

        // Send email
        mailService.sendEmail(email, otp + " là mã xác thực của bạn. ", emailContent);
        redirectAttributes.addFlashAttribute("showOtp", true);
        redirectAttributes.addFlashAttribute("message", "Đã gửi mail xác nhận");
        return "redirect:/forgot-password";
    }

    @RequestMapping("/forgot-password/verifyOtp")
    public String verifyOtp(
            @RequestParam("otp") String inputOtp,
            RedirectAttributes redirectAttributes,
            Model model) {
        if (otp.equals(inputOtp)) {
            redirectAttributes.addFlashAttribute("showResetForm", true);
            return "redirect:/forgot-password";
        }

        sessionService.remove("email");
        redirectAttributes.addFlashAttribute("message", "Mã xác nhận không đúng");
        return "redirect:/forgot-password";
    }


    @RequestMapping("/forgot-password/reset-password")
    public String resetPassword(@RequestParam("password") String password,
                                @RequestParam("checkPassword") String cpassword,
                                RedirectAttributes redirectAttributes) {
        String email = sessionService.get("email");
        redirectAttributes.addFlashAttribute("email", email);
        List<taikhoan> users = usersDAO.findByEmail(email);
        taikhoan user = users.isEmpty() ? null : users.getFirst();
        if (user == null) {
            redirectAttributes.addFlashAttribute("message", "Email không tồn tại");
            sessionService.remove("email");
            return "redirect:/forgot-password";
        }
        if (!password.equals(cpassword)) {
            redirectAttributes.addFlashAttribute("message", "Mật khẩu không khớp");
            sessionService.remove("email");
            return "redirect:/forgot-password/reset-password";
        }
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder(10);
        user.setMatkhau(passwordEncoder.encode(password));
        usersDAO.save(user);
        sessionService.remove("email");
        return "redirect:/login";
    }

    private String generateOTP() {
        Random random = new Random();
        int otp = 100000 + random.nextInt(900000);
        return String.valueOf(otp);
    }
}

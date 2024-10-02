package java5.asm.controllers;

import jakarta.mail.MessagingException;
import jakarta.persistence.EntityManager;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java5.asm.dao.usersDAO;
import java5.asm.model.taikhoan;
import java5.asm.utils.CookieService;
import java5.asm.utils.EmailSenderService;
import java5.asm.utils.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Random;
import java.util.UUID;

@RequestMapping("/user")
@Controller
public class profileController {
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
    private EmailSenderService MailSender;
    String otp = generateOTP();
    @GetMapping
    public String user(Model model){
        taikhoan user = sessionService.get("user");
        if (user != null) {
            model.addAttribute("user", user);
        }
        return "user/user";
    }
    @RequestMapping("/settings/profile")
    public String profile(@ModelAttribute("taikhoan") taikhoan taikhoan,Model model){
        taikhoan user = sessionService.get("user");
        if (user != null) {
            model.addAttribute("user", user);
        }
        return "user/profile";
    }
    @RequestMapping("/settings/linking")
    public String linking(@ModelAttribute("taikhoan") taikhoan taikhoan,Model model){
        taikhoan user = sessionService.get("user");
        boolean emailVerified = checkIfEmailIsVerified(user);
        if (user != null) {
            model.addAttribute("user", user);
        }
        String otpIn = req.getParameter("otp");
        if (otpIn != null && otpIn.equals(otp)) {
            user.setEmailVerified(true);
            usersDAO.save(user);
            emailVerified = true;
        }
        model.addAttribute("emailVerified", emailVerified);
        return "user/linking";
    }
    @RequestMapping("/settings/payment-history")
    public String paymentHistory(@ModelAttribute("taikhoan") taikhoan taikhoan,Model model){
        taikhoan user = sessionService.get("user");
        if (user != null) {
            model.addAttribute("user", user);
        }
        return "user/payment-history";
    }
    @RequestMapping("settings/account-settings")
    public String accountSettings(@ModelAttribute("taikhoan") taikhoan taikhoan,Model model){
        taikhoan user = sessionService.get("user");
        if (user != null) {
            model.addAttribute("user", user);
        }
        return "user/account-settings";
    }
    @RequestMapping("/settings/update")
    public String update(@ModelAttribute("taikhoan") taikhoan taikhoan,Model model){
        taikhoan user = sessionService.get("user");
        if (user != null) {
            user.setTentaikhoan(taikhoan.getTentaikhoan());
            user.setFirstname(taikhoan.getFirstname());
            user.setLastname(taikhoan.getLastname());
            user.setEmail(taikhoan.getEmail());
            user.setSodienthoai(taikhoan.getSodienthoai());
            user.setNgaysinh(taikhoan.getNgaysinh());
            usersDAO.save(user);
            model.addAttribute("user", user);
            return "redirect:/user/settings/profile";
        }else{
            model.addAttribute("message", "Có lỗi xảy ra");
            return "user/settings/profile";
        }
    }
    @RequestMapping("/settings/changePassword")
    public String changePassword(
            @RequestParam("oldpassword") String oldPassword,
            @RequestParam("newPassword") String newPassword,
            @RequestParam("confirmNewPassword") String confirmNewPassword,
            Model model) {
        taikhoan user = sessionService.get("user");

        if (!oldPassword.equals(user.getMatkhau())) {
            model.addAttribute("message", "Mật khẩu cũ không đúng");
            return "user/account-settings";
        }
        if (oldPassword.equals(newPassword)) {
            model.addAttribute("message", "Mật khẩu mới không được trùng với mật khẩu cũ");
            return "user/account-settings";
        }
        if (!newPassword.equals(confirmNewPassword)) {
            model.addAttribute("message", "Mật khẩu mới không trùng khớp");
            return "user/account-settings";
        }
        user.setMatkhau(newPassword);
        model.addAttribute("message", "Đổi mật khẩu thành công");
        usersDAO.save(user);
        return "redirect:/user/settings/account-settings";
    }
    @RequestMapping("/settings/linking/update")
    public String updateLinking(@ModelAttribute("taikhoan") taikhoan taikhoan,Model model){
        taikhoan user = sessionService.get("user");
        if (user != null) {

            usersDAO.save(user);
            model.addAttribute("user", user);
            return "redirect:/user/settings/linking";
        }else{
            model.addAttribute("message", "Có lỗi xảy ra");
            return "user/settings/linking";
        }
    }
    //KIEM TRA XAC THUC EMAIL
    public boolean checkIfEmailIsVerified(taikhoan user) {
        // Check the status from the user object
        if (user != null) {
            Boolean isVerified = user.getEmailVerified();
            return isVerified != null && isVerified;
        }
        return false;  // Return false if user is null or not verified
    }
    @RequestMapping("settings/linking/verifyMail")
    public String verifyMail(@RequestParam("email") String email,Model model) throws MessagingException {
        taikhoan user = sessionService.get("user");
        if(user != null) {
            user.setEmail(email);
            usersDAO.save(user);

            //MAIL
            String emailContent = "<h2>Xác nhận email</h2>"
                    + "<p>Xin chào " + user.getFirstname() + " " + user.getLastname() + ",</p>"
                    + "<p>Vui lòng sử dụng mã xác nhận bên dưới để hoàn tất việc xác nhận email:</p>"
                    + "<h3 style='color:blue;'>" + otp + "</h3>"
                    + "<p>Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi.</p>";

            // Send email
            MailSender.sendEmail(email, otp + " là mã xác thực của bạn. ", emailContent);
            //xac thuc thanh cong
            model.addAttribute("message", "Đã gửi mail xác nhận");
        }
        return "redirect:/user/settings/linking";
    }
//OTP GENERATOR
    private String generateOTP() {
        Random random = new Random();
        int otp = 100000 + random.nextInt(900000);
        return String.valueOf(otp);
    }
}

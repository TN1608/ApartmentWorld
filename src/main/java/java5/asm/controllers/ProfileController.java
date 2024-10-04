package java5.asm.controllers;

import jakarta.mail.MessagingException;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java5.asm.dao.usersDAO;
import java5.asm.model.CCCD;
import java5.asm.model.taikhoan;
import java5.asm.services.CookieService;
import java5.asm.services.EmailSenderService;
import java5.asm.services.SessionService;
import java5.asm.utils.AuthUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Random;

@RequestMapping("/user")
@Controller
public class ProfileController {
    @Autowired
    SessionService sessionService;
    @Autowired
    CookieService cookieService;
    @Autowired
    usersDAO usersDAO;
    //    @Autowired
//    CCCDDao CCCDDao;
    @Autowired
    EntityManager em;
    @Autowired
    HttpServletRequest req;
    @Autowired
    HttpServletResponse resp;
    @Autowired
    ServletContext servletContext;
    @Autowired
    private EmailSenderService MailSender;
    @Autowired
    AuthUtils authUtils;
    String otpMail;

    @GetMapping
    public String user(Model model) {
        taikhoan user = authUtils.getCurrentUser();
        if (user != null) {
            model.addAttribute("user", user);
        }
        return "user/user";
    }

    @RequestMapping("/settings/profile")
    public String profile(@ModelAttribute("taikhoan") taikhoan taikhoan,
                          Model model) {
        taikhoan user = authUtils.getCurrentUser();
        if (user != null) {
            model.addAttribute("user", user);
        }

        return "user/profile";
    }

    @RequestMapping("/settings/linking")
    public String linking(@ModelAttribute("CCCD") CCCD CCCD, @ModelAttribute("taikhoan") taikhoan taikhoan, Model model) {
        taikhoan user = authUtils.getCurrentUser();
        boolean emailVerified = authUtils.isEmailVerified(user);
        boolean phoneVerified = authUtils.isPhoneVerified(user);
        if (user != null) {
            //user
            model.addAttribute("user", user);
            //CCCD
//            CCCD existedCCCD = CCCDDao.findByTentaikhoan(user.getTentaikhoan().toString());
//            if (existedCCCD != null) {
//                model.addAttribute("CCCD", existedCCCD);
//            }else{
//                model.addAttribute("CCCD", new CCCD());
//            }
        }
//        model.addAttribute("CCCD", new CCCD());
        model.addAttribute("emailVerified", emailVerified);
        model.addAttribute("phoneVerified", phoneVerified);
        return "user/linking";
    }

    @RequestMapping("/settings/payment-history")
    public String paymentHistory(@ModelAttribute("taikhoan") taikhoan taikhoan, Model model) {
        taikhoan user = authUtils.getCurrentUser();
        if (user != null) {
            model.addAttribute("user", user);
        }
        return "user/payment-history";
    }

    @RequestMapping("settings/account-settings")
    public String accountSettings(@ModelAttribute("taikhoan") taikhoan taikhoan, Model model) {
        taikhoan user = authUtils.getCurrentUser();
        if (user != null) {
            model.addAttribute("user", user);
        }
        return "user/account-settings";
    }

    @RequestMapping("/settings/update")
    public String update(@ModelAttribute("taikhoan") taikhoan taikhoan,
                         RedirectAttributes redirectAttributes,
                         Model model,
                         @RequestParam("avatar") MultipartFile avatar) {
        taikhoan user = authUtils.getCurrentUser();
        if (user != null) {
            user.setTentaikhoan(taikhoan.getTentaikhoan());
            user.setFirstname(taikhoan.getFirstname());
            user.setLastname(taikhoan.getLastname());
            user.setSodienthoai(taikhoan.getSodienthoai());
            user.setNgaysinh(taikhoan.getNgaysinh());
            user.setCccd(taikhoan.getCccd());
            if (!user.getEmail().equals(taikhoan.getEmail())) {
                user.setEmail(taikhoan.getEmail());
                user.setEmailVerified(false);
            }
            if (!avatar.isEmpty()) {
                try {
                    String uploadDirectory = servletContext.getRealPath("/images/avatar/");
                    String fileName = avatar.getOriginalFilename();
                    Path uploadPath = Paths.get(uploadDirectory);
                    if (!Files.exists(uploadPath)) {
                        Files.createDirectories(uploadPath);
                    }
                    Path filePath = uploadPath.resolve(fileName);
                    Files.copy(avatar.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
                    user.setAnhtaikhoan(fileName);
                } catch (Exception e) {
                    redirectAttributes.addFlashAttribute("error", "Có lỗi xảy ra khi tải ảnh lên");
                    return "redirect:/user/settings/profile";
                }
            } else {
                user.setAnhtaikhoan(user.getAnhtaikhoan());
            }
            usersDAO.save(user);
            model.addAttribute("user", user);
            redirectAttributes.addFlashAttribute("message", "Cập nhật thông tin thành công");
            return "redirect:/user/settings/profile";
        } else {
            redirectAttributes.addFlashAttribute("error", "Có lỗi xảy ra");
            return "redirect:/user/settings/profile";
        }
    }

    @RequestMapping("/settings/changePassword")
    public String changePassword(
            @RequestParam("oldpassword") String oldPassword,
            @RequestParam("newPassword") String newPassword,
            @RequestParam("confirmNewPassword") String confirmNewPassword,
            RedirectAttributes redirectAttributes,
            Model model) {
        taikhoan user = authUtils.getCurrentUser();

        if (!oldPassword.equals(user.getMatkhau())) {
            redirectAttributes.addFlashAttribute("error", "Mật khẩu cũ không đúng");
            return "redirect:/user/settings/account-settings";
        }
        if (oldPassword.equals(newPassword)) {
            redirectAttributes.addFlashAttribute("error", "Mật khẩu mới không được trùng với mật khẩu cũ");
            return "redirect:/user/settings/account-settings";
        }
        if (!newPassword.equals(confirmNewPassword)) {
            redirectAttributes.addFlashAttribute("error", "Mật khẩu mới không trùng khớp");
            return "redirect:/user/settings/account-settings";
        }
        user.setMatkhau(newPassword);
        redirectAttributes.addFlashAttribute("message", "Đổi mật khẩu thành công");
        usersDAO.save(user);
        return "redirect:/user/settings/account-settings";
    }

//    @RequestMapping("/settings/linking/update")
//    public String updateLinking(@ModelAttribute("taikhoan") taikhoan taikhoan,
//                                RedirectAttributes redirectAttributes,
//                                Model model) {
//        taikhoan user = authUtils.getCurrentUser();
//        if (user != null) {
//            usersDAO.save(user);
//            model.addAttribute("user", user);
//            redirectAttributes.addFlashAttribute("message", "Cập nhật thông tin thành công");
//            return "redirect:/user/settings/linking";
//        } else {
//            redirectAttributes.addFlashAttribute("error", "Có lỗi xảy ra");
//            return "user/settings/linking";
//        }
//    }

    @RequestMapping("/settings/linking/sendMail")
    public String sendMail(RedirectAttributes redirectAttributes,
                           @RequestParam("email") String email)
            throws MessagingException {
        taikhoan user = authUtils.getCurrentUser();
        if (user != null) {
            //OTP
            otpMail = generateOTP();

            //MAIL
            String emailContent = "<h2>Xác nhận email</h2>"
                    + "<p>Xin chào " + user.getFirstname() + " " + user.getLastname() + ",</p>"
                    + "<p>Vui lòng sử dụng mã xác nhận bên dưới để hoàn tất việc xác nhận email:</p>"
                    + "<h3 style='color:blue;'>" + otpMail + "</h3>"
                    + "<p>Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi.</p>";

            // Send email
            MailSender.sendEmail(email, otpMail + " là mã xác thực của bạn. ", emailContent);
            //xac thuc thanh cong
            redirectAttributes.addFlashAttribute("message", "Đã gửi mail xác nhận");
            redirectAttributes.addAttribute("showOtpField", "true");
        }
        return "redirect:/user/settings/linking";
    }

    @RequestMapping("settings/linking/verifyMail")
    public String verifyMail(RedirectAttributes redirectAttributes,
                             @RequestParam("otpMail") String otp)
            throws MessagingException {
        taikhoan user = authUtils.getCurrentUser();
        if (user != null) {
            if (otpMail != null && otpMail.equals(otp)) {
                user.setEmailVerified(true);
                usersDAO.save(user);
                redirectAttributes.addFlashAttribute("message", "Xác thực email thành công");
            } else {
                redirectAttributes.addFlashAttribute("message", "Mã xác thực không đúng");
            }
        }
        return "redirect:/user/settings/linking";
    }


    //OTP GENERATOR
    private String generateOTP() {
        Random random = new Random();
        int otp = 100000 + random.nextInt(900000);
        return String.valueOf(otp);
    }
    //CCCD
//    @RequestMapping("/settings/linking/updateCCCD")
//    public String updateCCCD(@ModelAttribute("CCCD") CCCD CCCD,
//                             RedirectAttributes redirectAttributes,
//                             Model model) {
//        taikhoan user = authUtils.getCurrentUser();
//        if (user != null) {
//            CCCD existingCCCD = CCCDDao.findById(user.getCccd().toString()).orElse(null);
//
//            // If CCCD already exists, update it
//            if (existingCCCD != null) {
//                existingCCCD.setMaCCCD(CCCD.getMaCCCD());
//                existingCCCD.setNgaycap(CCCD.getNgaycap());
//                existingCCCD.setNoicap(CCCD.getNoicap());
//                existingCCCD.setAnhCCCD(CCCD.getAnhCCCD());
//                CCCDDao.save(existingCCCD);
//            } else {
//                // Create a new CCCD entry if it doesn't exist
//                CCCD.setTentaikhoan(user);
//                CCCDDao.save(CCCD);
//            }
//
//            model.addAttribute("user", user);
//            redirectAttributes.addFlashAttribute("message", "Cập nhật thông tin CCCD thành công");
//            return "redirect:/user/settings/linking";
//        } else {
//            redirectAttributes.addFlashAttribute("error", "Có lỗi xảy ra");
//            return "user/settings/linking";
//        }
//    }

    @RequestMapping("/settings/verify")
    public String verify(Model model) {
        taikhoan user = authUtils.getCurrentUser();
        if (user != null) {
            model.addAttribute("CCCD", new CCCD());
            model.addAttribute("user", user);
        }
        return "user/verify";
    }
}

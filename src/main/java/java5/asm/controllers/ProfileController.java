package java5.asm.controllers;

import jakarta.mail.MessagingException;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java5.asm.dao.CCCDDao;
import java5.asm.dao.HDTDao;
import java5.asm.dao.LSTTDao;
import java5.asm.dao.usersDAO;
import java5.asm.model.CCCD;
import java5.asm.model.lichsuthanhtoan;
import java5.asm.model.taikhoan;
import java5.asm.services.CookieService;
import java5.asm.services.EmailSenderService;
import java5.asm.services.SessionService;
import java5.asm.utils.AuthUtils;
import java5.asm.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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
    @Autowired
    CCCDDao CCCDDao;
    //    @Autowired
//    LSTTDao LSTTDao;
    @Autowired
    HDTDao HDTDao;
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
        if (user == null) {
            return "redirect:/home";
        }
        model.addAttribute("user", user);
        Date date = DateUtils.convertToDate(user.getNgaysinh());
        model.addAttribute("dayJoin", date);
        return "user/user";
    }

    @RequestMapping("/settings/profile")
    public String profile(@ModelAttribute("taikhoan") taikhoan taikhoan,
                          Model model) {
        taikhoan user = authUtils.getCurrentUser();
        if (user == null) {
            return "redirect:/home";
        }
        model.addAttribute("user", user);
        return "user/profile";
    }

    @RequestMapping("/settings/linking")
    public String linking(@ModelAttribute("taikhoan") taikhoan taikhoan, Model model) {
        taikhoan user = authUtils.getCurrentUser();
        if (user == null) {
            return "redirect:/home";
        }
        boolean emailVerified = authUtils.isEmailVerified(user);
        boolean phoneVerified = authUtils.isPhoneVerified(user);
        //user
        model.addAttribute("user", user);
        model.addAttribute("emailVerified", emailVerified);
        model.addAttribute("phoneVerified", phoneVerified);
        return "user/linking";
    }

    @RequestMapping("/settings/payment-history")
    public String paymentHistory(Model model) {
        taikhoan user = authUtils.getCurrentUser();
//        if (user != null) {
//            List<lichsuthanhtoan> paymentHistory = LSTTDao.findByTentaikhoan(user.getTentaikhoan());
//            model.addAttribute("paymentHistory", paymentHistory != null ? paymentHistory : new ArrayList<>());
//        }else{
//            model.addAttribute("paymentHistory", new ArrayList<>());
//        }
        return "user/payment-history";
    }

    @RequestMapping("settings/account-settings")
    public String accountSettings(@ModelAttribute("taikhoan") taikhoan taikhoan, Model model) {
        taikhoan user = authUtils.getCurrentUser();
        if (user == null) {
            return "redirect:/home";
        }
        model.addAttribute("user", user);
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
            return "redirect:/home";
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
        if (user == null) {
            return "redirect:/home";
        }
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
        if (user == null) {
            return "redirect:/home";
        }
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
        return "redirect:/user/settings/linking";
    }

    @RequestMapping("settings/linking/verifyMail")
    public String verifyMail(RedirectAttributes redirectAttributes,
                             @RequestParam("otpMail") String otp)
            throws MessagingException {
        taikhoan user = authUtils.getCurrentUser();
        if (user == null) {
            return "redirect:/home";
        }
        if (otpMail != null && otpMail.equals(otp)) {
            user.setEmailVerified(true);
            usersDAO.save(user);
            redirectAttributes.addFlashAttribute("message", "Xác thực email thành công");
        } else {
            redirectAttributes.addFlashAttribute("message", "Mã xác thực không đúng");
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
    @RequestMapping("/settings/verify/updateCCCD")
    public String updateCCCD(@ModelAttribute("CCCD") CCCD cccd,
                             RedirectAttributes redirectAttributes,
                             Model model,
                             @RequestParam("anhTruoc") MultipartFile anhTruocCCCD,
                             @RequestParam("anhSau") MultipartFile anhSauCCCD) {
        taikhoan user = authUtils.getCurrentUser();
        String uploadDirectory = servletContext.getRealPath("/images/cccd/");
        if (user != null) {
            cccd.setTaikhoan(user);
            Path path = Paths.get(uploadDirectory);
            if (!anhTruocCCCD.isEmpty()) {
                try {
                    String fileNameT = anhTruocCCCD.getOriginalFilename();
                    Path uploadPathT = path;
                    if (!Files.exists(uploadPathT)) {
                        Files.createDirectories(uploadPathT);
                    }
                    Path filePath = uploadPathT.resolve(fileNameT);
                    Files.copy(anhTruocCCCD.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
                    cccd.setAnhTruocCCCD(fileNameT);
                } catch (Exception e) {
                    redirectAttributes.addFlashAttribute("error", "Có lỗi xảy ra khi tải ảnh lên");
                    return "redirect:/user/settings/verify";
                }
            } else {
                cccd.setAnhTruocCCCD(cccd.getAnhTruocCCCD());
            }
            if (!anhSauCCCD.isEmpty()) {
                try {
                    String fileNameS = anhSauCCCD.getOriginalFilename();
                    Path uploadPathS = path;
                    if (!Files.exists(uploadPathS)) {
                        Files.createDirectories(uploadPathS);
                    }
                    Path filePath = uploadPathS.resolve(fileNameS);
                    Files.copy(anhSauCCCD.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
                    cccd.setAnhSauCCCD(fileNameS);
                } catch (Exception e) {
                    redirectAttributes.addFlashAttribute("error", "Có lỗi xảy ra khi tải ảnh lên");
                    return "redirect:/user/settings/verify";
                }
            } else {
                cccd.setAnhSauCCCD(cccd.getAnhSauCCCD());
            }
            CCCDDao.save(cccd);
            model.addAttribute("CCCD", cccd);
            redirectAttributes.addFlashAttribute("message", "Cập nhật thông tin thành công");
            return "redirect:/user/settings/verify";
        } else {
            redirectAttributes.addFlashAttribute("error", "Có lỗi xảy ra");
            return "redirect:/home";
        }
    }


    @RequestMapping("/settings/verify")
    public String verify(Model model, @ModelAttribute("CCCD") CCCD CCCD) {
        taikhoan user = authUtils.getCurrentUser();
        if (user == null) {
            return "redirect:/home";
        }
        CCCD existedCCCD = CCCDDao.findByTentaikhoan(user.getTentaikhoan().toString());
        if (existedCCCD != null) {
            model.addAttribute("CCCD", existedCCCD);
        } else {
            model.addAttribute("CCCD", new CCCD());
        }
        model.addAttribute("user", user);
        return "user/verify";
    }
}

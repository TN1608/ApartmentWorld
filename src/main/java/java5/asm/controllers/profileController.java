package java5.asm.controllers;

import jakarta.persistence.EntityManager;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java5.asm.dao.usersDAO;
import java5.asm.model.taikhoan;
import java5.asm.utils.CookieService;
import java5.asm.utils.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
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
        if (user != null) {
            model.addAttribute("user", user);
        }
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
}

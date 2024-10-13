package java5.asm.controllers;

import java5.asm.dao.usersDAO;
import java5.asm.model.taikhoan;
import java5.asm.services.NotificationService;
import java5.asm.utils.AuthUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SellerController {
    @Autowired
    AuthUtils authUtils;
    @Autowired
    NotificationService notificationService;
    @Autowired
    private java5.asm.dao.usersDAO usersDAO;


    @RequestMapping("/register-seller")
    public String registerSeller(Model model) {
        taikhoan user = authUtils.getCurrentUser();
        if (user != null) {
            model.addAttribute("user", user);
            notificationService.addNotifications(model);
        }
        return "seller/seller";
    }

    @RequestMapping("/register-seller/free")
    public String registerSellerFree(Model model) {
        taikhoan user = authUtils.getCurrentUser();
        if (user != null) {
            model.addAttribute("user", user);
            notificationService.addNotifications(model);
        }
        return "seller/sellerForm";
    }

    @RequestMapping("/register-seller/premium")
    public String registerSellerPremium(Model model) {
        taikhoan user = authUtils.getCurrentUser();
        if (user != null) {
            model.addAttribute("user", user);
            notificationService.addNotifications(model);
        }
        return "seller/sellerForm";
    }

    @RequestMapping("/register-seller/send")
    public String registerSellerSend(Model model,
                                     @ModelAttribute("seller") taikhoan taikhoan,
                                     @RequestParam("package") String packageString) {
        taikhoan user = authUtils.getCurrentUser();
        if (user != null) {
            model.addAttribute("user", user);
            notificationService.addNotifications(model);
            user.setFirstname(taikhoan.getFirstname());
            user.setLastname(taikhoan.getLastname());
            user.setSodienthoai(taikhoan.getSodienthoai());
            user.setEmail(taikhoan.getEmail());
            if (packageString.equals("free")) {
                user.setSeller(java5.asm.model.taikhoan.UserSeller.WAITING_FREE);
            } else {
                user.setSeller(java5.asm.model.taikhoan.UserSeller.WAITING_PREMIUM);
            }
            usersDAO.save(user);
            notificationService.notifyUser(user, "Đăng ký bán hàng của bạn đã được gửi. Chúng tôi sẽ xem xét và thông báo kết quả cho bạn sau.");
        }
        return "redirect:/home";
    }
}

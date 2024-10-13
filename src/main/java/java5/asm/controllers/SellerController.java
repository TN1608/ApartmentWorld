package java5.asm.controllers;

import java5.asm.model.taikhoan;
import java5.asm.services.NotificationService;
import java5.asm.utils.AuthUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SellerController {
    @Autowired
    AuthUtils authUtils;
    @Autowired
    NotificationService notificationService;


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
                                     @RequestParam("package") String packageString) {
        taikhoan user = authUtils.getCurrentUser();
        if (user != null) {
            model.addAttribute("user", user);
            notificationService.addNotifications(model);
            System.out.println("Package: " + packageString);
        }
        return "redirect:/home";
    }
}

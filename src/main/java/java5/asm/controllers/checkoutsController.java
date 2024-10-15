package java5.asm.controllers;

import java5.asm.model.taikhoan;
import java5.asm.utils.AuthUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class checkoutsController {
    @Autowired
    AuthUtils authUtils;

    @GetMapping("/checkout")
    public String checkout(Model model){
        taikhoan user = authUtils.getCurrentUser();
        if(user == null){
            return "redirect:/login";
        }
        model.addAttribute("user", user);
        return "checkoutSub";
    }
}

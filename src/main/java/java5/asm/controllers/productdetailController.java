package java5.asm.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java5.asm.model.taikhoan;

@Controller
public class productdetailController {
	@RequestMapping("/productdetail")
    public String registerSeller(Model model) {
        return "/productdetail";
    }
}

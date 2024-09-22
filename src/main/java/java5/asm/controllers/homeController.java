package java5.asm.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class homeController {
    @RequestMapping("/home")
    public String home() {
        return "index";
    }
    @RequestMapping("/menu")
    public String menu(){
        return "menu";
    }
}

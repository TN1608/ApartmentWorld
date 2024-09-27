package java5.asm.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class homeController {
    @RequestMapping("/home")
    public String home() {
        return "index";
    }
    @GetMapping("/login")
    public String loginIndex(){
        return "login";
    }
    @PostMapping("/login")
    public String login(){

        return "redirect:/home";
    }
}

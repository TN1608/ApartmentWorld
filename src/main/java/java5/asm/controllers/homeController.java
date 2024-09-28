package java5.asm.controllers;

import java5.asm.utils.CookieService;
import java5.asm.utils.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@Controller
public class homeController {
    @Autowired
    SessionService sessionService;
    @Autowired
    CookieService cookieService;
    @RequestMapping("/home")
    public String home() {
        return "index";
    }
}

package java5.asm.controllers;

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

@Controller
public class HomeController {
    @Autowired
    HttpServletRequest req;
    @Autowired
    HttpServletResponse resp;
    @Autowired
    SessionService sessionService;
    @Autowired
    CookieService cookieService;
    @Autowired
    usersDAO usersDAO;

    @RequestMapping("/home")
    public String home(Model model) {
        taikhoan user = sessionService.get("user");
        if (user != null) {
            model.addAttribute("user", user);
        } else {
            String username = cookieService.getValue("username", req);
            if (username != null) {
                user = usersDAO.findById(username).orElse(null);
                if (user != null) {
                    sessionService.set("user", user);
                    model.addAttribute("user", user);
                }
            }
        }
        return "index";
    }
}

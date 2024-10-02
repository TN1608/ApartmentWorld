package java5.asm.controllers;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java5.asm.model.taikhoan;
import java5.asm.services.CookieService;
import java5.asm.services.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    HttpServletRequest req;
    @Autowired
    HttpServletResponse resp;
    @Autowired
    SessionService sessionService;
    @Autowired
    CookieService cookieService;
    @Autowired
    java5.asm.dao.usersDAO usersDAO;

    @RequestMapping("/home")
    public String home(Model model) {
        taikhoan currentUser = sessionService.get("user");
        if (currentUser != null) {
            if (currentUser.isVaitro()){
                model.addAttribute("user", currentUser);
            } else {
                resp.setStatus(HttpServletResponse.SC_FORBIDDEN);
                return "error/403";
            }
        } else {
            resp.setStatus(HttpServletResponse.SC_FORBIDDEN);
            return "error/403";
        }
        return "admin/index";
    }
}

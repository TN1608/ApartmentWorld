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
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@Controller
public class loginController {
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

    @GetMapping("/login")
    public String loginIndex(@ModelAttribute("taikhoan") taikhoan taikhoan, Model model){
        if(sessionService.get("remeber")!=null){
            return "redirect:/home";
        }
        return "login";
    }
    @PostMapping("/login")
    public String login(@ModelAttribute("taikhoan") taikhoan taikhoan,@RequestParam("tentaikhoan") String username, @RequestParam("matkhau") String password, Model model){
        if(usersDAO.findById(username).isPresent()){
            if(usersDAO.findById(username).get().getMatkhau().equalsIgnoreCase(password)){
                sessionService.set("username",username);
                cookieService.add("username",username,24);
                cookieService.add("password",password,24);
                return "redirect:/home";
            }
        }
        model.addAttribute("message","Sai tên đăng nhập hoặc mật khẩu");
        return "login";
    }
}

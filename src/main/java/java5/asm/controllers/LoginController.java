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
public class LoginController {
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
    public String loginIndex(@ModelAttribute("taikhoan") taikhoan taikhoan){
        taikhoan user = sessionService.get("user");
        if(user != null){
            return "redirect:/home";
        } else {
            String username = cookieService.getValue("username", req);
            if (username != null) {
                user = usersDAO.findById(username).orElse(null);
                if (user != null) {
                    return "redirect:/home";
                }
            }
        }
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam("tentaikhoan") String username,
                        @RequestParam("matkhau") String password,
                        @RequestParam(value = "remember", defaultValue = "false") boolean remember,
                        Model model) {
        taikhoan user = usersDAO.findById(username).orElse(null);
        if (user != null) {
            if (user.getMatkhau().equalsIgnoreCase(password)) {
                sessionService.set("user", user);
                if (remember) {
                    cookieService.add("username", username, 24, resp);
                }
                return "redirect:/home";
            }
        }
        model.addAttribute("message", "Sai tên đăng nhập hoặc mật khẩu");
        return "login";
    }

    @RequestMapping("/logout")
    public String logout(){
        sessionService.remove("user");
        cookieService.remove("username");
        cookieService.remove("password");
        return "redirect:/home";
    }

    @GetMapping("/signup")
    public String signupIndex(@ModelAttribute("taikhoan") taikhoan taikhoan, Model model){

        return "signup";
    }
    @PostMapping("/signup")
    public String signup(@RequestParam("cpass") String cpass, @ModelAttribute("taikhoan") @Validated taikhoan taikhoan, Errors errors, Model model){
        if(errors.hasErrors()){
            return "signup";
        }
        if(usersDAO.findById(taikhoan.getTentaikhoan()).isPresent()){
            model.addAttribute("message","Tên tài khoản đã tồn tại");
            return "signup";
        }
        if(!cpass.equals(taikhoan.getMatkhau())){
            model.addAttribute("message","Mật khẩu không khớp");
            return "signup";
        }
        model.addAttribute("message","Đăng ký thành công");
        usersDAO.save(taikhoan);
        return "redirect:/login";
    }
}

package java5.asm.controllers;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java5.asm.dao.phongtroDAO;
import java5.asm.dao.usersDAO;
import java5.asm.model.phongtro;
import java5.asm.model.taikhoan;
import java5.asm.services.CookieService;
import java5.asm.services.SessionService;
import java5.asm.utils.AuthUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

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
    @Autowired
    phongtroDAO phongtroDAO;
    @Autowired
    AuthUtils authUtils;

    @GetMapping("/home")
    public String home(Model model,@RequestParam("p") Optional<Integer> p) {
        taikhoan user = authUtils.getCurrentUser();
        int pageIndex = p.orElse(0);
        if (pageIndex <= 0) {
            pageIndex = 0;
        }
        Pageable pageable = PageRequest.of(pageIndex,8);
        Page<phongtro> lists = phongtroDAO.findAll(pageable);
        model.addAttribute("items",lists);
        if (user != null) {
            model.addAttribute("user", user);
        }
        return "index";
    }
    @RequestMapping("/home")
    public String homePage(Model model,
                           @RequestParam("keywords")Optional<String> keywords,
                           @RequestParam("p") Optional<Integer> p) {
        String kw = keywords.orElse(sessionService.get("keywords"));
        sessionService.set("keywords",kw);
        int pageIndex = p.orElse(0);
        if (pageIndex <= 0) {
            pageIndex = 0;
        }
        Pageable pageable = PageRequest.of(pageIndex,8);
        Page<phongtro> page = phongtroDAO.findByKeywords("%" + kw + "%",pageable);
        model.addAttribute("items",page);
        taikhoan user = authUtils.getCurrentUser();
        if (user != null) {
            model.addAttribute("user", user);
        }
        return "redirect:/home";
    }
}

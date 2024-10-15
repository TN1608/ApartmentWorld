package java5.asm.controllers;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java5.asm.dao.phongtroDAO;
import java5.asm.dao.usersDAO;
import java5.asm.model.phongtro;
import java5.asm.model.taikhoan;
import java5.asm.services.CookieService;
import java5.asm.services.NotificationService;
import java5.asm.services.SessionService;
import java5.asm.services.WishlistServices;
import java5.asm.utils.AuthUtils;
import java5.asm.utils.EnumOptions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
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
    @Autowired
    NotificationService notificationService;
    @Autowired
    private WishlistServices wishlistServices;


    @ModelAttribute("tinhtrang")
    public List<EnumOptions> getTinhTrang() {
        List<EnumOptions> tinhtrangOptions = new ArrayList<>();
        for (phongtro.tinhtrang tt : phongtro.tinhtrang.values()) {
            tinhtrangOptions.add(new EnumOptions(tt.name(), tt.getDescription()));  // Add value and label
        }
        return tinhtrangOptions;
    }
    @GetMapping("")
    public String index() {
        return "redirect:/home";
    }

    @GetMapping("/home")
    public String home(Model model,
                       @RequestParam("p") Optional<Integer> p,
                       @RequestParam("keywords") Optional<String> keywords) {
        if (keywords.isPresent() && keywords.get().trim().isEmpty()) {
            return "redirect:/home";
        }
        String kw = keywords.orElse("");
        if (keywords.isPresent()) {
            sessionService.set("keywords", kw);
        }
        taikhoan user = authUtils.getCurrentUser();
        int pageIndex = p.orElse(0);
        if (pageIndex <= 0) {
            pageIndex = 0;
        }
        Pageable pageable = PageRequest.of(pageIndex, 8);
        Page<phongtro> page = phongtroDAO.findByKeywords("%" + kw + "%", pageable);
        model.addAttribute("items", page);
        if (user != null) {
            model.addAttribute("user", user);
            notificationService.addNotifications(model);
            wishlistServices.addWishlistModel(model);
        }
        return "index";
    }

    @RequestMapping("/home")
    public String homePage(Model model,
                           @RequestParam("keywords") Optional<String> keywords,
                           @RequestParam("p") Optional<Integer> p) {
        String kw = keywords.orElse("");
        if (keywords.isPresent()) {
            sessionService.set("keywords", kw);
        }
        int pageIndex = p.orElse(0);
        if (pageIndex <= 0) {
            pageIndex = 0;
        }
        Pageable pageable = PageRequest.of(pageIndex, 8);
        Page<phongtro> lists = phongtroDAO.findByTrangThai(phongtro.trangthai.Approved, pageable);
        model.addAttribute("items", lists);
        taikhoan user = authUtils.getCurrentUser();
        if (user != null) {
            model.addAttribute("user", user);
            notificationService.addNotifications(model);
            if (user.getSeller() == null) {
                user.setSeller(taikhoan.UserSeller.NONE);
                usersDAO.save(user);
            }
        }
        return "redirect:/home";
    }
    @GetMapping("/home/filter")
    public String filterByTinhTrang(Model model,
                                    @RequestParam("tinhTrang") String tinhTrang,
                                    @RequestParam("p") Optional<Integer> p) {
        int pageIndex = p.orElse(0);
        if (pageIndex <= 0) {
            pageIndex = 0;
        }
        Pageable pageable = PageRequest.of(pageIndex, 8);
        Page<phongtro> page = phongtroDAO.findByTinhtrang(phongtro.tinhtrang.valueOf(tinhTrang), pageable);
        model.addAttribute("items", page);
        taikhoan user = authUtils.getCurrentUser();
        if (user != null) {
            model.addAttribute("user", user);
            notificationService.addNotifications(model);
        }
        return "index";
    }

    @PostMapping("/notification/readAll")
    public ResponseEntity<Void> markAllNotificationsAsRead() {
        taikhoan user = authUtils.getCurrentUser();
        if (user != null) {
            notificationService.markAsRead(user.getTentaikhoan());
        }
        return ResponseEntity.ok().build();
    }

    @GetMapping("/home/sort")
    public String sort(Model model,
                       @RequestParam("p") Optional<Integer> p,
                       @RequestParam("keywords") Optional<String> keywords,
                       @RequestParam("minPrice") Optional<Integer> minPrice,
                       @RequestParam("maxPrice") Optional<Integer> maxPrice) {
        if (!minPrice.isPresent() && !maxPrice.isPresent()) {
            return "redirect:/home";
        }
        if (keywords.isPresent() && keywords.get().trim().isEmpty()) {
            return "redirect:/home";
        }
        String kw = keywords.orElse("");
        if (keywords.isPresent()) {
            sessionService.set("keywords", kw);
        }
        int min = minPrice.orElse(0);
        int max = maxPrice.orElse(Integer.MAX_VALUE);

        int pageIndex = p.orElse(0);
        if (pageIndex <= 0) {
            pageIndex = 0;
        }
        Pageable pageable = PageRequest.of(pageIndex, 8);
        Page<phongtro> page = phongtroDAO.findByPriceBetween(min, max, pageable);
        model.addAttribute("items", page);
        taikhoan user = authUtils.getCurrentUser();
        if (user != null) {
            model.addAttribute("user", user);
            notificationService.addNotifications(model);
        }
        return "index";
    }
}

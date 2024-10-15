package java5.asm.controllers;

import java5.asm.dao.WishlistDAO;
import java5.asm.dao.phongtroDAO;
import java5.asm.dao.usersDAO;
import java5.asm.model.Wishlist;
import java5.asm.model.phongtro;
import java5.asm.model.taikhoan;
import java5.asm.services.NotificationService;
import java5.asm.services.SessionService;
import java5.asm.services.WishlistServices;
import java5.asm.utils.AuthUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.Instant;
import java.util.*;

@Controller
public class WishlistController {
    @Autowired
    phongtroDAO troDAO;
    @Autowired
    AuthUtils AuthUtils;
    @Autowired
    usersDAO usersDAO;
    @Autowired
    SessionService sessionService;
    @Autowired
    NotificationService notificationService;
    @Autowired
    WishlistDAO wishlistDAO;
    @Autowired
    WishlistServices wishlistServices;

    @GetMapping("/wishlists")
    public String wishlist(Model model) {
        taikhoan user = AuthUtils.getCurrentUser();

//        List<String> wishlists = sessionService.get("wishlists");

        wishlistServices.addWishlistModel(model);
        model.addAttribute("user", user);
        notificationService.addNotifications(model);
        return "wishlists";
    }

    @GetMapping("/wishlists/add")
    public String AddtoList(Model model,
                            @RequestParam("id") String maphong,
                            RedirectAttributes ra) {
        Optional<phongtro> troOpt = troDAO.findById(maphong);
        if (troOpt.isPresent()) {
            phongtro tro = troOpt.get();
            List<String> wishlists = sessionService.get("wishlists");
            if (wishlists == null) {
                wishlists = new ArrayList<>();
            }
            if (!wishlists.contains(tro.getMaphong())) {
                wishlists.add(tro.getMaphong());
            }

//            sessionService.set("wishlists", wishlists);  // Update the session
            taikhoan user = AuthUtils.getCurrentUser();
            Wishlist existingWishlist = wishlistDAO.findByTentaikhoanAndMaphong(user.getTentaikhoan(), tro.getMaphong());
            if (existingWishlist == null) {
                Wishlist wishlist = new Wishlist();
                wishlist.setMaphong(tro);
                wishlist.setTentaikhoan(user);
                wishlistDAO.save(wishlist);
                notificationService.addNotiBox(ra, "Lưu bài tin thành công!");
            } else {
                notificationService.addNotiBox(ra, "Phòng trọ đã có trong danh sách yêu thích!");
            }
        }
        return "redirect:/wishlists";
    }

    @Transactional
    @GetMapping("/wishlists/remove")
    public String RemovefromList(Model model,
                                 @RequestParam("id") String maphong,
                                 RedirectAttributes ra) {
        taikhoan user = AuthUtils.getCurrentUser();
        phongtro tro = troDAO.findById(maphong).orElse(null);
            if (user != null && tro != null) {
                notificationService.addNotiBox(ra, "Xóa bài tin thành công!");
                wishlistDAO.deleteByTentaikhoanAndMaphong(user, tro);
            }
        return "redirect:/wishlists";
    }
}

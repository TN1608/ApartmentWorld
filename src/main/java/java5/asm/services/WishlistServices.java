package java5.asm.services;

import java5.asm.dao.WishlistDAO;
import java5.asm.model.Wishlist;
import java5.asm.utils.AuthUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class WishlistServices {
    @Autowired
    private WishlistDAO wishlistDAO;
    @Autowired
    private AuthUtils authUtils;

    public void addWishlistModel(Model model) {
        List<Wishlist> wishlists = wishlistDAO.findByUser(authUtils.getCurrentUser().getTentaikhoan());
        if (wishlists == null) {
            wishlists = new ArrayList<>();
        }
        if (!wishlists.isEmpty()) {
            model.addAttribute("wishlists", wishlists);
        } else {
            model.addAttribute("tro", Collections.emptyList());
        }
    }
}

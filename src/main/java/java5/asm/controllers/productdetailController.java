package java5.asm.controllers;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java5.asm.dao.phongtroDAO;
import java5.asm.dao.usersDAO;
import java5.asm.model.phongtro;
import java5.asm.model.taikhoan;

@Controller
public class productdetailController {

    @Autowired
    private phongtroDAO phongtroDAO;

    @Autowired
    private usersDAO taikhoanDAO;

    @RequestMapping("/post/{maphong}")
    public String showProductDetail(@PathVariable("maphong") String maphong, Model model) {

        Optional<phongtro> productOpt = phongtroDAO.findById(maphong);
        if (productOpt.isPresent()) {
            phongtro product = productOpt.get();
            model.addAttribute("product", product);

            // Kiểm tra xem tài khoản có được lấy đúng không
            taikhoan user = product.getTentaikhoan();
            if (user != null) {
                System.out.println("Tài khoản: " + user.getTentaikhoan());
                model.addAttribute("user", user);
            } else {
                System.out.println("Không tìm thấy tài khoản liên quan đến sản phẩm.");
            }
        } else {
            model.addAttribute("error", "Sản phẩm không tồn tại.");
        }

        return "productdetail";
    }
}

package java5.asm.controllers;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.PathVariable;

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

    @RequestMapping("/productdetail/{maphong}")
    public String showProductDetail(@PathVariable("maphong") String maphong, Model model) {
        Optional<phongtro> productOpt = phongtroDAO.findById(maphong); 
        if (productOpt.isPresent()) {
            phongtro product = productOpt.get();
            model.addAttribute("product", product);
        } else {
            model.addAttribute("error", "Sản phẩm không tồn tại.");
        }
        return "productdetail"; 
    }
}

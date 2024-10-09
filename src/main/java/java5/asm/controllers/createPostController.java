package java5.asm.controllers;

import java5.asm.dao.phongtroDAO;
import java5.asm.model.phongtro;
import java5.asm.model.taikhoan;
import java5.asm.services.SessionService;
import java5.asm.utils.AuthUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class createPostController {
    @Autowired
    AuthUtils AuthUtils;
    @Autowired
    SessionService session;
    @Autowired
    phongtroDAO phongtroDAO;
    @ModelAttribute("tinhtrang")
    public String[] getTinhTrang() {
        return new String[]{"Đã cho thuê", "Chưa cho thuê"};
    }
    @RequestMapping("/dang-tin")
    public String createPost(Model model, @ModelAttribute("phongtro") phongtro phongtro) {
        taikhoan user = AuthUtils.getCurrentUser();
        if(user !=null){
            model.addAttribute("user",user);
        }
        return "user/createPost";
    }
}

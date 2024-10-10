package java5.asm.controllers;

import jakarta.servlet.ServletContext;
import java5.asm.dao.phongtroDAO;
import java5.asm.model.phongtro;
import java5.asm.model.taikhoan;
import java5.asm.services.SessionService;
import java5.asm.utils.AuthUtils;
import java5.asm.utils.EnumOptions;
import java5.asm.utils.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
public class createPostController {
    @Autowired
    AuthUtils AuthUtils;
    @Autowired
    SessionService session;
    @Autowired
    phongtroDAO phongtroDAO;
    @Autowired
    RestTemplate restTemplate;
    @Autowired
    ServletContext context;

    @ModelAttribute("tinhtrang")
    public List<EnumOptions> getTinhTrang() {
        List<EnumOptions> tinhtrangOptions = new ArrayList<>();
        for (phongtro.tinhtrang tt : phongtro.tinhtrang.values()) {
            tinhtrangOptions.add(new EnumOptions(tt.name(), tt.getDescription()));  // Add value and label
        }
        return tinhtrangOptions;
    }

    @RequestMapping("/dang-tin")
    public String handlePost(Model model,
                             @ModelAttribute("phongtro") phongtro phongtro) {
        taikhoan user = AuthUtils.getCurrentUser();
        if (user == null) {
            return "redirect:/home";
        }
        model.addAttribute("user", user);
        return "user/createPost";
    }

    public String getMaphong() {
        String maphong = phongtroDAO.findTopByMaphong();
        if (maphong != null) {
            int num = Integer.parseInt(maphong.replace("P", ""));
            return "P" + (num + 1);
        }
        return "P1";
    }

    @RequestMapping("/dang-tin/tao-tin")
    public String createPost(Model model,
                             @ModelAttribute("phongtro") phongtro phongtro,
                             @RequestParam("images") MultipartFile[] images) {
        taikhoan user = AuthUtils.getCurrentUser();
        if (user == null) {
            return "redirect:/home";
        }
        model.addAttribute("user", user);
        if (images.length == 0) {
            model.addAttribute("error", "Chưa chọn ảnh");
            return "user/createPost";
        }
        try {
            List<String> listAnh = new ArrayList<>();
            String uploadDirectory = context.getRealPath("/images/phongtro/");
            for (MultipartFile image : images) {
                if (!image.isEmpty()) {
                    listAnh.add(FileUtils.uploadFile(image, uploadDirectory));
                }
            }
            phongtro.setAnh(listAnh);
            phongtro.setTrangthai(java5.asm.model.phongtro.trangthai.Waiting);
        } catch (Exception e) {
            model.addAttribute("error", "Lỗi trạng thái");
            return "user/createPost";
        }
        phongtro.setMaphong(getMaphong());
        phongtro.setTentaikhoan(user);
        phongtroDAO.save(phongtro);
        return "redirect:/user";
    }

    @ResponseBody
    @RequestMapping("/dang-tin/kiem-tra")
    public List<phongtro> checkPost() {
        return phongtroDAO.findByTentaikhoan("khang");
    }
}

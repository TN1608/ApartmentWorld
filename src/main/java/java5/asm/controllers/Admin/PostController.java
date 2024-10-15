package java5.asm.controllers.Admin;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java5.asm.model.CCCD;
import java5.asm.model.phongtro;
import java5.asm.model.taikhoan;
import java5.asm.services.CookieService;
import java5.asm.services.NotificationService;
import java5.asm.services.SessionService;
import java5.asm.services.phongtroService;
import java5.asm.utils.AuthUtils;
import java5.asm.utils.EnumOptions;
import java5.asm.utils.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin")
public class PostController {
    @Autowired
    HttpServletRequest req;
    @Autowired
    HttpServletResponse resp;
    @Autowired
    SessionService sessionService;
    @Autowired
    CookieService cookieService;
    @Autowired
    ServletContext context;
    @Autowired
    java5.asm.dao.usersDAO usersDAO;
    @Autowired
    java5.asm.dao.CCCDDao cccdDAO;
    @Autowired
    java5.asm.dao.phongtroDAO phongtroDAO;
    @Autowired
    AuthUtils authUtils;
    @Autowired
    NotificationService notificationService;
    @Autowired
    phongtroService phongtroService;

    private int FIRST_PAGE_NUMBER = 0;
    private int NUMBER_OF_ITEM_PER_PAGE = 10;

    @RequestMapping("/post")
    public String post(Model model,
                       @RequestParam("keyword") Optional<String> keyword,
                       @RequestParam("page") Optional<Integer> page,
                       @RequestParam("field") Optional<String> field) {
        var currentUser = authUtils.getCurrentUser();
        model.addAttribute("user", currentUser);
        keyword.ifPresent(key -> sessionService.set("keyword", key));
        field.ifPresent(f -> sessionService.set("field", f));

        String keywordParam = keyword.orElse(sessionService.get("keyword", ""));
        String fieldParam = field.orElse(sessionService.get("field", "maphong"));

        int currentPage = page.orElse(FIRST_PAGE_NUMBER);
        if (fieldParam == null || fieldParam.isEmpty()) {
            fieldParam = "maphong";
        }
        Sort sort = Sort.by(Sort.Direction.ASC, fieldParam);
        Pageable pageable;
        int totalPages = phongtroDAO.findAll(PageRequest.of(0, NUMBER_OF_ITEM_PER_PAGE)).getTotalPages();
        if (currentPage < FIRST_PAGE_NUMBER) {
            pageable = PageRequest.of(totalPages - 1, NUMBER_OF_ITEM_PER_PAGE, sort);
        } else if (currentPage >= totalPages) {
            pageable = PageRequest.of(FIRST_PAGE_NUMBER, NUMBER_OF_ITEM_PER_PAGE, sort);
        } else {
            pageable = PageRequest.of(currentPage, NUMBER_OF_ITEM_PER_PAGE, sort);
        }
        Page<phongtro> pages = phongtroDAO.findByKeywords(keywordParam, pageable);
        model.addAttribute("pages", pages);
        addNotifications(model);
        return "admin/post";
    }

    @ModelAttribute("trangthai")
    public List<EnumOptions> trangthai() {
        List<EnumOptions> trangthaiOption = new ArrayList<>();
        for (phongtro.trangthai trangthai : phongtro.trangthai.values()) {
            trangthaiOption.add(new EnumOptions(trangthai.name(), trangthai.getDescription()));
        }
        return trangthaiOption;
    }

    @ModelAttribute("tinhtrang")
    public List<EnumOptions> tinhtrang() {
        List<EnumOptions> tinhtrangOption = new ArrayList<>();
        for (phongtro.tinhtrang tinhtrang : phongtro.tinhtrang.values()) {
            tinhtrangOption.add(new EnumOptions(tinhtrang.name(), tinhtrang.getDescription()));
        }
        return tinhtrangOption;
    }

    @RequestMapping("/post/add")
    public String addPost(Model model,
                          @ModelAttribute("post") phongtro post) {
        var currentUser = authUtils.getCurrentUser();
        model.addAttribute("user", currentUser);
        model.addAttribute("postId", phongtroService.getMaPhong());
        addNotifications(model);
        return "admin/postDetail";
    }

    @Transactional
    @RequestMapping("/post/add/send")
    public String addPostSend(Model model,
                              @ModelAttribute("post") phongtro post,
                              @RequestParam("images") MultipartFile[] images,
                              RedirectAttributes ra) {
        var currentUser = authUtils.getCurrentUser();
        model.addAttribute("user", currentUser);

        String newMaphong = phongtroService.getMaPhong();
        post.setMaphong(newMaphong);

        if (phongtroDAO.existsById(newMaphong)) {
            notificationService.addNotiBox(ra, "Phòng trọ đã tồn tại");
            return "redirect:/admin/post/add";
        }

        if (images.length == 0) {
            notificationService.addNotiBox(ra, "Chưa chọn ảnh");
            return "redirect://post/add";
        }

        List<String> listAnh = new ArrayList<>();
        String uploadDirectory = context.getRealPath("/images/phongtro/");
        for (MultipartFile image : images) {
            if (!image.isEmpty()) {
                listAnh.add(FileUtils.uploadFile(image, uploadDirectory));
            }
        }
        try {
            post.setAnh(listAnh);
            post.setTentaikhoan(currentUser);
            phongtroDAO.save(post);
            notificationService.addNotiBox(ra, "Thêm phòng trọ " + post.getMaphong() + " thành công");
        } catch (Exception e) {
            notificationService.addNotiBox(ra, "Lỗi khi thêm phòng trọ: " + e.getMessage());
            e.printStackTrace();
            return "redirect:/admin/post/add";
        }
        addNotifications(model);
        return "redirect:/admin/post";
    }

    @RequestMapping("/post/edit/{id}")
    public String editPost(Model model,
                           @ModelAttribute("post") phongtro post,
                           @PathVariable("id") String id,
                           RedirectAttributes ra) {
        var currentUser = authUtils.getCurrentUser();
        model.addAttribute("user", currentUser);
        Optional<phongtro> optionalPhongtro = phongtroDAO.findById(id);
        if (optionalPhongtro.isPresent()) {
            phongtro phtro = optionalPhongtro.get();
            model.addAttribute("post", phtro);
            addNotifications(model);
            return "admin/postDetail";
        } else {
            notificationService.addNotiBox(ra, "Phòng trọ không tồn tại");
            return "admin/postDetail";
        }
    }

    @Transactional
    @RequestMapping("/post/edit/send/{id}")
    public String editPostSend(Model model,
                               @ModelAttribute("post") phongtro post,
                               @PathVariable("id") String id,
                               RedirectAttributes ra,
                               @RequestParam("images") MultipartFile[] images) {
        var currentUser = authUtils.getCurrentUser();
        model.addAttribute("user", currentUser);
        Optional<phongtro> optionalPhongtro = phongtroDAO.findById(id);
        if (optionalPhongtro.isPresent()) {
            phongtro phtro = optionalPhongtro.get();
            if (images.length == 0) {
                notificationService.addNotiBox(ra, "Chưa chọn ảnh");
                return "redirect:/admin/post/edit/" + id;
            }
            List<String> listAnh = new ArrayList<>();
            String uploadDirectory = context.getRealPath("/images/phongtro/");
            for (MultipartFile image : images) {
                if (!image.isEmpty()) {
                    listAnh.add(FileUtils.uploadFile(image, uploadDirectory));
                }
            }
            try {
                phtro.setAnh(listAnh);
                phtro.setTentaikhoan(currentUser);
                phongtroDAO.save(phtro);
                notificationService.addNotiBox(ra, "Cập nhật phòng trọ " + phtro.getMaphong() + " thành công");
            } catch (Exception e) {
                notificationService.addNotiBox(ra, "Lỗi khi cập nhật phòng trọ: " + e.getMessage());
                e.printStackTrace();
                return "redirect:/admin/post/edit/" + id;
            }
            addNotifications(model);
            return "redirect:/admin/post";
        } else {
            notificationService.addNotiBox(ra, "Phòng trọ không tồn tại");
            return "redirect:/admin/post";
        }
    }

    @RequestMapping("/post/delete/{id}")
    public String deletePost(Model model,
                             @PathVariable("id") String id,
                             RedirectAttributes ra) {
        var currentUser = authUtils.getCurrentUser();
        model.addAttribute("user", currentUser);
        Optional<phongtro> optionalPhongtro = phongtroDAO.findById(id);
        if (optionalPhongtro.isPresent()) {
            phongtro phtro = optionalPhongtro.get();
            phongtroDAO.delete(phtro);
            notificationService.addNotiBox(ra, "Xóa phòng trọ " + phtro.getMaphong() + " thành công");
            return "redirect:/admin/post";
        } else {
            notificationService.addNotiBox(ra, "Phòng trọ không tồn tại");
            return "redirect:/admin/post";
        }
    }

    private void addNotifications(Model model) {
        List<CCCD> waitingUser = cccdDAO.findCCCDByUser(taikhoan.UserStatus.WAITING);
        model.addAttribute("waitingUsers", waitingUser);
        List<phongtro> waitingPost = phongtroDAO.findByTrangThai(phongtro.trangthai.Waiting);
        model.addAttribute("waitingPosts", waitingPost);
        List<taikhoan> waitingSeller = usersDAO.findBySeller(taikhoan.UserSeller.WAITING_FREE, taikhoan.UserSeller.WAITING_PREMIUM);
        model.addAttribute("waitingSellers", waitingSeller);
    }
}

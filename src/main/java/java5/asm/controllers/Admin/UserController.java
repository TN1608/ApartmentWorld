package java5.asm.controllers.Admin;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java5.asm.dao.CCCDDao;
import java5.asm.dao.phongtroDAO;
import java5.asm.dao.usersDAO;
import java5.asm.model.CCCD;
import java5.asm.model.phongtro;
import java5.asm.model.taikhoan;
import java5.asm.services.CookieService;
import java5.asm.services.NotificationService;
import java5.asm.services.SessionService;
import java5.asm.utils.AuthUtils;
import java5.asm.utils.EnumOptions;
import java5.asm.utils.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
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
public class UserController {
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
    java5.asm.dao.CCCDDao CCCDDao;
    @Autowired
    java5.asm.dao.phongtroDAO phongtroDAO;
    @Autowired
    AuthUtils authUtils;
    @Autowired
    NotificationService notificationService;

    private int FIRST_PAGE_NUMBER = 0;
    private int NUMBER_OF_ITEM_PER_PAGE = 10;

    @RequestMapping("/user")
    public String user(Model model,
                       @RequestParam("keyword") Optional<String> keyword,
                       @RequestParam("page") Optional<Integer> page,
                       @RequestParam("field") Optional<String> field) {
        var currentUser = authUtils.getCurrentUser();
        model.addAttribute("user", currentUser);
        keyword.ifPresent(key -> sessionService.set("keyword", key));
        field.ifPresent(f -> sessionService.set("field", f));

        String keywordParam = keyword.orElse(sessionService.get("keyword", ""));
        String fieldParam = field.orElse(sessionService.get("field", "tentaikhoan"));

        int currentPage = page.orElse(FIRST_PAGE_NUMBER);
        if (fieldParam == null || fieldParam.isEmpty()) {
            fieldParam = "tentaikhoan";
        }

        Sort sort = Sort.by(Sort.Direction.ASC, fieldParam);
        Pageable pageable;
        if (currentPage < FIRST_PAGE_NUMBER) {
            pageable = PageRequest.of(usersDAO.findAll(PageRequest.of(0, NUMBER_OF_ITEM_PER_PAGE)).getTotalPages() - 1, NUMBER_OF_ITEM_PER_PAGE, sort);
        } else if (currentPage >= usersDAO.findAll(PageRequest.of(0, NUMBER_OF_ITEM_PER_PAGE)).getTotalPages()) {
            pageable = PageRequest.of(FIRST_PAGE_NUMBER, NUMBER_OF_ITEM_PER_PAGE, sort);
        } else {
            pageable = PageRequest.of(currentPage, NUMBER_OF_ITEM_PER_PAGE, sort);
        }
        Page<taikhoan> pages = usersDAO.findByKeywords(keywordParam, pageable);

        model.addAttribute("pages", pages);
        addNotifications(model);

        return "admin/user";
    }

    @ModelAttribute("gioitinh")
    public List<EnumOptions> populateGioiTinh() {
        List<EnumOptions> gioiTinhOptions = new ArrayList<>();
        gioiTinhOptions.add(new EnumOptions("true", "Nam"));
        gioiTinhOptions.add(new EnumOptions("false", "Nữ"));
        return gioiTinhOptions;
    }


    @ModelAttribute("vaitro")
    public List<EnumOptions> populateVaiTro() {
        List<EnumOptions> vaiTroOptions = new ArrayList<>();
        vaiTroOptions.add(new EnumOptions("false", "Người dùng"));
        vaiTroOptions.add(new EnumOptions("true", "Quản trị viên"));
        return vaiTroOptions;
    }

    @ModelAttribute("status")
    public List<EnumOptions> populateStatus() {
        List<EnumOptions> statusOption = new ArrayList<>();
        for (taikhoan.UserStatus status : taikhoan.UserStatus.values()) {
            statusOption.add(new EnumOptions(status.name(), status.getDescription()));
        }
        return statusOption;
    }

    @ModelAttribute("seller")
    public List<EnumOptions> populateSeller() {
        List<EnumOptions> sellerOption = new ArrayList<>();
        for (taikhoan.UserSeller seller : taikhoan.UserSeller.values()) {
            sellerOption.add(new EnumOptions(seller.name(), seller.getDescription()));
        }
        return sellerOption;
    }


    @RequestMapping("/user/add")
    public String userAdd(Model model, @ModelAttribute("taikhoan") taikhoan user) {
        var currentUser = authUtils.getCurrentUser();
        model.addAttribute("user", currentUser);
        addNotifications(model);
        return "admin/userDetail";
    }

    @RequestMapping("/user/add/send")
    public String userDetailSend(Model model,
                                 @ModelAttribute("taikhoan") taikhoan user,
                                 RedirectAttributes ra,
                                 @RequestParam("avatar") MultipartFile avatar) {
        var currentUser = authUtils.getCurrentUser();
        model.addAttribute("user", currentUser);
        System.out.println(user.toString());
        if (user.getEmail().isEmpty() || user.getMatkhau().isEmpty()) {
            notificationService.addNotiBox(ra, "Vui lòng điền đầy đủ thông tin!");
            return "redirect:/admin/user/add";
        }
        if (user.getTentaikhoan().isEmpty()) {
            user.setTentaikhoan(authUtils.generateUID());
        }
        if (!avatar.isEmpty()) {
            user.setAnhtaikhoan(FileUtils
                    .uploadFile(avatar, context.getRealPath("/images/avatar/")));
        } else {
            user.setAnhtaikhoan("default.jpg");
        }
        notificationService.addNotiBox(ra, "Thêm người dùng " + user.getTentaikhoan() + " thành công!");
        usersDAO.save(user);
        addNotifications(model);
        return "redirect:/admin/user";
    }

    @RequestMapping("/user/edit/{id}")
    public String userEdit(Model model,
                           @ModelAttribute("taikhoan") taikhoan user,
                           @PathVariable("id") String id,
                           RedirectAttributes ra) {
        var currentUser = authUtils.getCurrentUser();
        model.addAttribute("user", currentUser);

        taikhoan userEdit = usersDAO.findById(id).orElse(null);
        if (userEdit == null) {
            notificationService.addNotiBox(ra, "Người dùng không tồn tại!");
            return "redirect:/admin/user";
        }
        user = userEdit;
        model.addAttribute("taikhoan", user);
        addNotifications(model);
        return "admin/userDetail";
    }

    @RequestMapping("/user/edit/send/{id}")
    public String userEditSend(Model model,
                               @ModelAttribute("taikhoan") taikhoan user,
                               @PathVariable("id") String id,
                               RedirectAttributes ra,
                               @RequestParam("avatar") MultipartFile avatar) {
        var currentUser = authUtils.getCurrentUser();
        model.addAttribute("user", currentUser);

        taikhoan userEdit = usersDAO.findById(id).orElse(null);
        if (userEdit == null) {
            notificationService.addNotiBox(ra, "Người dùng không tồn tại!");
            return "redirect:/admin/user";
        }
        if (!avatar.isEmpty()) {
            user.setAnhtaikhoan(FileUtils
                    .uploadFile(avatar, context.getRealPath("/images/avatar/")));
        } else {
            user.setAnhtaikhoan("default.jpg");
        }
        usersDAO.save(user);
        notificationService.addNotiBox(ra, "Cập nhật thông tin người dùng " + user.getTentaikhoan() + " thành công!");
        return "redirect:/admin/user";
    }

    @RequestMapping("/user/delete/{id}")
    public String userDelete(Model model,
                             @PathVariable("id") String id,
                             RedirectAttributes ra) {
        var currentUser = authUtils.getCurrentUser();
        model.addAttribute("user", currentUser);

        taikhoan userEdit = usersDAO.findById(id).orElse(null);
        if (userEdit == null) {
            notificationService.addNotiBox(ra, "Người dùng không tồn tại!");
            return "redirect:/admin/user";
        }
        usersDAO.delete(userEdit);
        notificationService.addNotiBox(ra, "Xóa người dùng " + userEdit.getTentaikhoan() + " thành công!");
        return "redirect:/admin/user";
    }

    private void addNotifications(Model model) {
        List<CCCD> waitingUser = CCCDDao.findCCCDByUser(taikhoan.UserStatus.WAITING);
        model.addAttribute("waitingUsers", waitingUser);
        List<phongtro> waitingPost = phongtroDAO.findByTrangThai(phongtro.trangthai.Waiting);
        model.addAttribute("waitingPosts", waitingPost);
        List<taikhoan> waitingSeller = usersDAO.findBySeller(taikhoan.UserSeller.WAITING_FREE, taikhoan.UserSeller.WAITING_PREMIUM);
        model.addAttribute("waitingSellers", waitingSeller);
    }
}

package java5.asm.controllers.Admin;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java5.asm.model.CCCD;
import java5.asm.model.phongtro;
import java5.asm.model.taikhoan;
import java5.asm.services.CookieService;
import java5.asm.services.NotificationService;
import java5.asm.services.SessionService;
import java5.asm.utils.AuthUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class CensorController {

    @Autowired
    HttpServletRequest req;
    @Autowired
    HttpServletResponse resp;
    @Autowired
    SessionService sessionService;
    @Autowired
    CookieService cookieService;
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


    @RequestMapping("/kiemduyet")
    public String kiemDuyet(Model model) {
        taikhoan currentUser = authUtils.getCurrentUser();
        model.addAttribute("user", currentUser);
        addNotifications(model);

        return "admin/censor";
    }

    @RequestMapping("/kiemduyet/cccd/{tentaikhoan}")
    public String kiemDuyetDetail(Model model, @PathVariable String tentaikhoan) {
        taikhoan currentUser = authUtils.getCurrentUser();
        model.addAttribute("user", currentUser);
        addNotifications(model);

        CCCD cccd = CCCDDao.findByTentaikhoan(tentaikhoan);
        model.addAttribute("cccd", cccd);

        if (cccd == null) {
            return "redirect:/admin/kiemduyet";
        }

        return "admin/censorDetail";
    }

    @RequestMapping("/kiemduyet/cccd/{tentaikhoan}/accept")
    public String kiemDuyetDetailAccept(Model model, @PathVariable String tentaikhoan, RedirectAttributes ra) {
        taikhoan currentUser = authUtils.getCurrentUser();
        model.addAttribute("user", currentUser);
        addNotifications(model);

        CCCD cccd = CCCDDao.findByTentaikhoan(tentaikhoan);
        taikhoan user = cccd.getTaikhoan();

        cccd.setNgaythem(new Date());
        user.setStatus(taikhoan.UserStatus.APPROVED);
        usersDAO.save(user);
        CCCDDao.save(cccd);

        notificationService.notifyUser(user, "CCCD của bạn đã được duyệt");
        notificationService.addNotiBox(ra, "CCCD đã được duyệt");
        return "redirect:/admin/kiemduyet";
    }

    @RequestMapping("/kiemduyet/cccd/{tentaikhoan}/reject")
    public String kiemDuyetDetailReject(Model model, @PathVariable String tentaikhoan, RedirectAttributes ra) {
        taikhoan currentUser = authUtils.getCurrentUser();
        model.addAttribute("user", currentUser);
        addNotifications(model);

        CCCD cccd = CCCDDao.findByTentaikhoan(tentaikhoan);
        taikhoan user = cccd.getTaikhoan();

        user.setStatus(taikhoan.UserStatus.NONE);
        usersDAO.save(user);
        CCCDDao.delete(cccd);
        notificationService.notifyUser(user, "CCCD của bạn đã bị từ chối");
        notificationService.addNotiBox(ra, "CCCD đã bị từ chối");
        return "redirect:/admin/kiemduyet";
    }

    @RequestMapping("/kiemduyet/baidang/{maphong}")
    public String kiemduyetPostDetail(Model model, @PathVariable String maphong) {
        taikhoan currentUser = authUtils.getCurrentUser();
        model.addAttribute("user", currentUser);
        addNotifications(model);

        phongtro post = phongtroDAO.findById(maphong).orElse(null);
        model.addAttribute("post", post);

        if (post == null) {
            return "redirect:/admin/kiemduyet";
        }

        return "admin/censorPostDetail";
    }

    @RequestMapping("/kiemduyet/baidang/{maphong}/accept")
    public String kiemduyetPostDetailAccept(Model model, @PathVariable String maphong, RedirectAttributes ra) {
        taikhoan currentUser = authUtils.getCurrentUser();
        model.addAttribute("user", currentUser);
        addNotifications(model);

        phongtro post = phongtroDAO.findById(maphong).orElse(null);
        if (post == null) {
            return "redirect:/admin/kiemduyet";
        }

        post.setTrangthai(phongtro.trangthai.Approved);
        phongtroDAO.save(post);

        notificationService.notifyUser(post.getTentaikhoan(), "Bài đăng của bạn đã được duyệt");
        notificationService.addNotiBox(ra, "Bài đăng đã được duyệt");
        return "redirect:/admin/kiemduyet";
    }

    @RequestMapping("/kiemduyet/baidang/{maphong}/reject")
    public String kiemduyetPostDetailReject(Model model, @PathVariable String maphong, RedirectAttributes ra) {
        taikhoan currentUser = authUtils.getCurrentUser();
        model.addAttribute("user", currentUser);
        addNotifications(model);

        phongtro post = phongtroDAO.findById(maphong).orElse(null);
        if (post == null) {
            notificationService.addNotiBox(ra, "Tài khoản không tồn tại");
            return "redirect:/admin/kiemduyet";
        }

        post.setTrangthai(phongtro.trangthai.Hidden);
        phongtroDAO.save(post);

        notificationService.notifyUser(post.getTentaikhoan(), "Bài đăng của bạn đã bị từ chối");
        notificationService.addNotiBox(ra, "Bài đăng đã bị từ chối");
        return "redirect:/admin/kiemduyet";
    }

    @RequestMapping("/kiemduyet/seller/{tentaikhoan}/accept")
    public String kiemduyetSellerAccept(Model model, @PathVariable String tentaikhoan, RedirectAttributes ra) {
        taikhoan currentUser = authUtils.getCurrentUser();
        model.addAttribute("user", currentUser);
        addNotifications(model);

        taikhoan user = usersDAO.findById(tentaikhoan).orElse(null);
        if (user == null) {
            notificationService.addNotiBox(ra, "Tài khoản không tồn tại");
            return "redirect:/admin/kiemduyet";
        }

        if (user.getSeller() == taikhoan.UserSeller.WAITING_FREE) {
            user.setSeller(taikhoan.UserSeller.FREE);
        } else if (user.getSeller() == taikhoan.UserSeller.WAITING_PREMIUM) {
            user.setSeller(taikhoan.UserSeller.PREMIUM);
        }

        usersDAO.save(user);
        notificationService.notifyUser(user, "Tài khoản của bạn đã được duyệt");
        notificationService.addNotiBox(ra, "Tài khoản đã được duyệt");
        return "redirect:/admin/kiemduyet";
    }

    @RequestMapping("/kiemduyet/seller/{tentaikhoan}/reject")
    public String kiemduyetSellerReject(Model model, @PathVariable String tentaikhoan, RedirectAttributes ra) {
        taikhoan currentUser = authUtils.getCurrentUser();
        model.addAttribute("user", currentUser);
        addNotifications(model);

        taikhoan user = usersDAO.findById(tentaikhoan).orElse(null);
        if (user == null) {
            notificationService.addNotiBox(ra, "Tài khoản không tồn tại");
            return "redirect:/admin/kiemduyet";
        }

        user.setSeller(taikhoan.UserSeller.NONE);
        usersDAO.save(user);
        notificationService.notifyUser(user, "Tài khoản của bạn đã bị từ chối");
        notificationService.addNotiBox(ra, "Tài khoản đã bị từ chối");
        return "redirect:/admin/kiemduyet";
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

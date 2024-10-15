package java5.asm.controllers;

import jakarta.servlet.http.HttpServletRequest;
import java5.asm.dao.LSTTDao;
import java5.asm.dao.usersDAO;
import java5.asm.model.lichsuthanhtoan;
import java5.asm.model.taikhoan;
import java5.asm.services.NotificationService;
import java5.asm.services.VNPAYService;
import java5.asm.utils.AuthUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.Instant;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@Controller
public class SellerController {
    @Autowired
    AuthUtils authUtils;
    @Autowired
    NotificationService notificationService;
    @Autowired
    private java5.asm.dao.usersDAO usersDAO;
    @Autowired
    private VNPAYService vnPayService;
    @Autowired
    LSTTDao lsDAO;

    @RequestMapping("/register-seller")
    public String registerSeller(Model model) {
        taikhoan user = authUtils.getCurrentUser();
        if (user != null) {
            model.addAttribute("user", user);
            notificationService.addNotifications(model);
        }
        return "seller/seller";
    }

    @RequestMapping("/register-seller/free")
    public String registerSellerFree(Model model, @ModelAttribute("taikhoan") taikhoan user) {
        taikhoan currentUser = authUtils.getCurrentUser();
        if (currentUser != null) {
            model.addAttribute("user", currentUser);
            notificationService.addNotifications(model);
        }
        return "seller/sellerForm";
    }

    @RequestMapping("/register-seller/premium")
    public String registerSellerPremium(Model model, @ModelAttribute("taikhoan") taikhoan user) {
        taikhoan currentUser = authUtils.getCurrentUser();
        if (currentUser != null) {
            model.addAttribute("user", currentUser);
            notificationService.addNotifications(model);
        }
        return "seller/sellerForm";
    }

    @RequestMapping("/register-seller/send")
    public String registerSellerSend(
            @ModelAttribute("taikhoan") taikhoan taikhoan,
            @RequestParam("package") String packageString, Model model, RedirectAttributes ra) {
        taikhoan user = authUtils.getCurrentUser();
        if (user != null) {
            model.addAttribute("user", user);
            notificationService.addNotifications(model);
            user.setFirstname(taikhoan.getFirstname());
            user.setLastname(taikhoan.getLastname());
            user.setSodienthoai(taikhoan.getSodienthoai());
            user.setEmail(taikhoan.getEmail());
            if (packageString.equals("free")) {
                user.setSeller(java5.asm.model.taikhoan.UserSeller.WAITING_FREE);
            } else {
                user.setSeller(java5.asm.model.taikhoan.UserSeller.WAITING_PREMIUM);
            }
            usersDAO.save(user);
            notificationService.addNotiBox(ra, "Đăng ký bán hàng của bạn đã được gửi.");
            notificationService.notifyUser(user, "Đăng ký bán hàng của bạn đã được gửi. Chúng tôi sẽ xem xét và thông báo kết quả cho bạn sau.");
        }
        return "redirect:/home";
    }

//    @RequestMapping("/test")
//    public String test(RedirectAttributes ra, Model model) {
//        notificationService.addNotiBox(ra, "Đăng ký bán hàng của bạn đã được gửi.");
//        return "redirect:/home";
//    }

    @PostMapping("/submitOrder")
    public String submitOrder(@RequestParam("amount") int orderTotal,
                              @RequestParam("orderInfo") String orderInfo,
                              HttpServletRequest request) {
        String baseUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
        String vnpayUrl = vnPayService.createOrder(request, orderTotal, orderInfo, baseUrl);
        return "redirect:" + vnpayUrl;
    }

    // Sau khi hoàn tất thanh toán, VNPAY sẽ chuyển hướng trình duyệt về URL này
    @GetMapping("/vnpay-payment-return")
    public String paymentCompleted(HttpServletRequest request, Model model, RedirectAttributes ra) {
        int paymentStatus = vnPayService.orderReturn(request);

        String orderInfo = request.getParameter("vnp_OrderInfo");
        String paymentTime = request.getParameter("vnp_PayDate");
        String transactionId = request.getParameter("vnp_TransactionNo");
        String totalPrice = request.getParameter("vnp_Amount");

        model.addAttribute("orderId", orderInfo);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("paymentTime", paymentTime);
        model.addAttribute("transactionId", transactionId);

        double sotienthucte = Double.parseDouble(totalPrice) / 100;
        // luu len LSTT
        lichsuthanhtoan payment = new lichsuthanhtoan();
        payment.setId(Integer.parseInt(transactionId));
        payment.setSotien(sotienthucte);
        payment.setNgaythanhtoan(LocalDate.parse(paymentTime, DateTimeFormatter.ofPattern("yyyyMMddHHmmss")));
        payment.setHinhthucthanhtoan("VNPAY");
        lsDAO.save(payment);
        if(paymentStatus == 1) {
            notificationService.addNotiBox(ra, "Thanh toán thành công.");
        } else {
            notificationService.addNotiBox(ra, "Thanh toán thất bại.");
        }
        return "redirect:/home";
    }
}

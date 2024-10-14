package java5.asm.services;

import java5.asm.dao.NotificationDAO;
import java5.asm.dao.usersDAO;
import java5.asm.model.Notification;
import java5.asm.model.taikhoan;
import java5.asm.utils.AuthUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Service
public class NotificationService {
    @Autowired
    private NotificationDAO nDAO;
    @Autowired
    private usersDAO uDAO;
    @Autowired
    private AuthUtils authUtils;


    public void notifyUser(taikhoan user, String message) {
        Notification notification = new Notification();
        notification.setMessage(message);
        notification.setTentaikhoan(user);
        nDAO.save(notification);
    }

    public void notifyAllUsers(String message) {
        for (taikhoan user : uDAO.findAll()) {
            notifyUser(user, message);
        }
    }

    public void addNotifications(Model model) {
        taikhoan currentUser = authUtils.getCurrentUser();
        if (currentUser != null) {
            List<Notification> notifications = nDAO.findByUser(currentUser.getTentaikhoan());
            model.addAttribute("notifications", notifications);
        }
    }

    public void markAsRead(String username) {
        List<Notification> notifications = nDAO.findByUser(username);
        for (Notification notification : notifications) {
            notification.setIsRead(true);
            nDAO.save(notification);
        }
    }

    public void addNotiBox(RedirectAttributes ra, String message) {
        ra.addFlashAttribute("notiBox", message);
    }

    public void addNotiBox(Model model, String message) {
        model.addAttribute("notiBox", message);
    }
}

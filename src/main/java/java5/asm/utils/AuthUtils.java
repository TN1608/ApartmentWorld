package java5.asm.utils;

import java5.asm.dao.usersDAO;
import java5.asm.model.taikhoan;
import java5.asm.services.CookieService;
import java5.asm.services.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class AuthUtils {

    @Autowired
    private SessionService sessionService;

    @Autowired
    private CookieService cookieService;

    @Autowired
    private usersDAO usersDAO;

    public taikhoan getCurrentUser() {
        taikhoan user = null;
        String username = cookieService.getValue("username");
        if (username != null) {
            user = usersDAO.findById(username).orElse(null);
            if (user != null) {
                sessionService.set("user", user);
            } else {
                sessionService.remove("user");
                cookieService.remove("username");
            }
        } else {
            user = sessionService.get("user", "");
            if (user != null) {
                user = usersDAO.findById(user.getTentaikhoan()).orElse(null);
                if (user == null) {
                    sessionService.remove("user");
                }
            }
        }

        return user;
    }

    public boolean isEmailVerified(taikhoan user) {
        if (user != null) {
            Boolean isVerified = user.getEmailVerified();
            return isVerified != null && isVerified;
        }
        return false;
    }

    public boolean isPhoneVerified(taikhoan user) {
        if (user != null) {
            Boolean isVerified = user.getPhoneVerified();
            return isVerified != null && isVerified;
        }
        return false;
    }
}

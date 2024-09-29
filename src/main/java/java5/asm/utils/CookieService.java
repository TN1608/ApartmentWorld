package java5.asm.utils;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CookieService {
    @Autowired
    HttpServletRequest req;
    @Autowired
    HttpServletResponse reps;

    public Cookie get(String name) {
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(name)) {
                    return cookie;
                }
            }
        }
        return null;
    }

    public String getValue(String name) {
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(name)) {
                    return cookie.getValue();
                }
            }
        }
        return null;
    }

    public Cookie add(String name, String value, int hours) {
        //goi ten va gia tri
        Cookie cookie = new Cookie(name, value);
        //set thoi han theo don vi gio
        cookie.setMaxAge(hours * 60 * 60);
        //them cookie
        reps.addCookie(cookie);
        return cookie;
    }

    //xoa cookie theo ten
    public void remove(String name) {
        //goi ten
        Cookie cookie = get(name);
        if (cookie != null) {
            cookie.setMaxAge(0);
            reps.addCookie(cookie);
        }
    }

    //    test
    public void add(String name, String value, int hours, HttpServletResponse response) {
        Cookie cookie = new Cookie(name, value);
        cookie.setMaxAge(hours * 60 * 60);
        cookie.setHttpOnly(true); // Set HttpOnly flag
        cookie.setSecure(true); // Set Secure flag
        response.addCookie(cookie);
    }

    public String getValue(String name, HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(name)) {
                    return cookie.getValue();
                }
            }
        }
        return null;
    }

}
package java5.asm.services;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java5.asm.utils.AuthUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

@Service
public class AuthInterceptor implements HandlerInterceptor {
    @Autowired
    AuthUtils authUtils;


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String uri = request.getRequestURI();
        var user = authUtils.getCurrentUser();
        String error = "";
        if (user == null) {
            response.sendRedirect("/home");
            return false;
        }

        if (uri.startsWith("/admin/") && !authUtils.isAdmin(user)) {
            response.sendRedirect("/error/403");
            return false;
        }

        if (uri.equals("/some-non-existent-page")) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            response.sendRedirect("/error/404");
            return false;
        }

        return true;
    }
}

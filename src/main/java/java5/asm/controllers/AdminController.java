package java5.asm.controllers;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java5.asm.dao.usersDAO;
import java5.asm.model.taikhoan;
import java5.asm.services.CookieService;
import java5.asm.services.SessionService;
import java5.asm.utils.AuthUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    HttpServletRequest req;
    @Autowired
    HttpServletResponse resp;
    @Autowired
    SessionService sessionService;
    @Autowired
    CookieService cookieService;
    @Autowired
    usersDAO usersDAO;
    @Autowired
    AuthUtils authUtils;

    private int FIRST_PAGE_NUMBER = 0;
    private int NUMBER_OF_ITEM_PER_PAGE = 10;

    @RequestMapping("/home")
    public String home(Model model,
                       @RequestParam("page") Optional<Integer> page,
                       @RequestParam("field") Optional<String> field) {
        taikhoan currentUser = authUtils.getCurrentUser();
        if (currentUser != null) {
            if (currentUser.isVaitro()) {
                model.addAttribute("user", currentUser);
                int currentPage = page.orElse(FIRST_PAGE_NUMBER);
                String sortField = field.orElse("tentaikhoan");
                if (sortField.isEmpty()) {
                    sortField = "tentaikhoan";
                }
                Sort sort = Sort.by(Sort.Direction.ASC, sortField);
                Pageable pageable;
                if (currentPage < FIRST_PAGE_NUMBER) {
                    pageable = PageRequest.of(usersDAO.findAll(PageRequest.of(0, NUMBER_OF_ITEM_PER_PAGE)).getTotalPages() - 1, NUMBER_OF_ITEM_PER_PAGE, sort);
                } else if (currentPage >= usersDAO.findAll(PageRequest.of(0, NUMBER_OF_ITEM_PER_PAGE)).getTotalPages()) {
                    pageable = PageRequest.of(FIRST_PAGE_NUMBER, NUMBER_OF_ITEM_PER_PAGE, sort);
                } else {
                    pageable = PageRequest.of(currentPage, NUMBER_OF_ITEM_PER_PAGE, sort);
                }
                Page<taikhoan> pages = usersDAO.findAll(pageable);
                model.addAttribute("pages", pages);
            } else {
                resp.setStatus(HttpServletResponse.SC_FORBIDDEN);
                return "error/403";
            }
        } else {
            resp.setStatus(HttpServletResponse.SC_FORBIDDEN);
            return "error/403";
        }
        return "admin/index";
    }
}

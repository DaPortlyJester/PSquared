package com.umich.umd.psquared;

import java.io.IOException;
import java.util.logging.Logger;
import javax.servlet.http.*;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

public class SignGuestbookServlet extends HttpServlet {
    private static final Logger log = Logger.getLogger(SignGuestbookServlet.class.getName());

    public void doPost(HttpServletRequest req, HttpServletResponse resp)
                throws IOException {
        UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();

        String content = req.getParameter("content");
        if (content == null) {
            content = "(No greeting)";
        }
        if (user != null) {
            resp.getWriter().println("Greeting posted by user: " + user.getNickname() + ": " + content);
        } else {
            resp.getWriter().println("Greeting posted anonymously: " + content);
        }
    }
}

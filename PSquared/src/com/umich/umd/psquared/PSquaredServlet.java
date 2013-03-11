package com.umich.umd.psquared;

import java.io.IOException;
import javax.servlet.http.*;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class PSquaredServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		
		// Acquire Google user service
		UserService userService = UserServiceFactory.getUserService();
		// Determine Google user
		User user = userService.getCurrentUser();
		
		if(user != null) {
			// append Hello message to response
			resp.setContentType("text/plain");
			resp.getWriter().println("Hello, " + user.getNickname());
		} else {
			resp.sendRedirect(userService.createLoginURL(req.getRequestURI()));
		}
	}
	
}

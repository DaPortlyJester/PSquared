package com.umich.umd.psquared;

import javax.servlet.http.HttpServletRequest;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

public class ManageUser {
	
	private User currUser;
	private static UserService userService = UserServiceFactory.getUserService();
	private boolean userChanged;
	
	public ManageUser() {
		
		userService = UserServiceFactory.getUserService();
		currUser = userService.getCurrentUser();
	}

	public User getCurrUser() {
		UserService us = UserServiceFactory.getUserService();
		currUser = us.getCurrentUser();
		return currUser;
	}

	public void setCurrUser(User currUser) {
		this.currUser = currUser;
	}
	
	public String getLoginURL(HttpServletRequest request){
		String loginURL;
		loginURL = userService.createLoginURL(request.getRequestURI());
		return loginURL;
	}
	
	public String getLogoutURL(HttpServletRequest request) {
		String logoutURL;
		logoutURL = userService.createLoginURL(request.getRequestURI());
		return logoutURL;

	}
	

	
	
	

}

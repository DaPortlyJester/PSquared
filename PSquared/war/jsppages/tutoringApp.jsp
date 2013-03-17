<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>

<%@ page
	import="com.google.appengine.api.datastore.DatastoreServiceFactory"%>
<%@ page import="com.google.appengine.api.datastore.DatastoreService"%>
<%@ page import="com.google.appengine.api.datastore.Query"%>
<%@ page import="com.google.appengine.api.datastore.Entity"%>
<%@ page import="com.google.appengine.api.datastore.FetchOptions"%>
<%@ page import="com.google.appengine.api.datastore.Key"%>
<%@ page import="com.google.appengine.api.datastore.KeyFactory"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>P^2 - Tutoring Network</title>
</head>
<body>
	<div id="pageDiv">
		<div id="headerDiv">
			<div id="leftHead">
				<div id="UMDLogo">
					<img
						src="http://www.umd.umich.edu/fileadmin/umdts/templates/shared/parts/assets/umd-official-wordmark.jpg"
						id="logo" alt="University of Michigan - Dearborn Logo">
				</div>
			</div>
			<div id="rightHead">

				<%
					String guestbookName = request.getParameter("guestbookName");
					if (guestbookName == null) {
						guestbookName = "default";
					}

					UserService userService = UserServiceFactory.getUserService();
					User user = userService.getCurrentUser();
				%>
				<div id="userAccount">
					<%
						if (user != null) {
					%>
					<p>
						User Account:
						<%=user.getNickname()%>
						<br />
						<a href="<%=userService.createLoginURL(request.getRequestURI())%>">Click
							here</a> to sign in to another account <br />
						<a
							href="<%=userService.createLogoutURL(request.getRequestURI())%>">Sign
							Out</a>
					</p>
					<%
						} else {
					%>
					<p>
						User Account: <a
							href="<%=userService.createLoginURL(request.getRequestURI())%>">Please
							Click here</a> to sign in
					</p>
					<%
						}
					%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
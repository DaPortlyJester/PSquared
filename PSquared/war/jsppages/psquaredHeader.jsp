<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ page import="com.umich.umd.psquared.ManageUser" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
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
					ManageUser mngUser = new ManageUser();
					User user = mngUser.getCurrUser();
					
				%>
			<div id="userAccount">
				<%
						if (user != null) {
					%>
				<p>
					User Account: ${ fn:escapeXml(user.getNickname()) }
					<br /> <a
						href="<%=mngUser.getLoginURL(request)%>">Click
						here</a> to sign in to another account <br /> <a
						href="<%=mngUser.getLogoutURL(request)%>">Sign
						Out</a>
				</p>
				<%
						} else {
					%>
				<p>
					User Account: <a
						href="<%=mngUser.getLoginURL(request)%>">Please
						Click here</a> to sign in
				</p>
				<%
						}
					%>
			</div>
		</div>
	</div>

</body>
</html>
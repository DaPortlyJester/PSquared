<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
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

<%@ page import="com.umich.umd.psquared.ManageUser"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
<title>P^2 - Tutoring Network</title>
<link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
</head>

<body>
	<div id="pageDiv">
		<jsp:include page="psquaredHeader.jsp"></jsp:include>
		<div id="welcomeDiv">
			<div id="welcomeText">
				<h1>Welcome to P^2</h1>
				<h2>
					Connecting Students to Tutors and <br>Teachers to Students
				</h2>
			</div>
		</div>

		<form action="/sign" method="post">
			<div id="buttonsDiv">
				<div id="tutoredButton">
					<input type="submit" value="Click Here to Apply For Tutoring"
						name="tutoringApp" />
				</div>
				<div id="tutorButton">
					<input type="submit" value="Click Here to Apply as a Tutor"
						name="tutorApp" />
				</div>
			</div>
		</form>

		<%
			String guestbookName = request.getParameter("guestbookName");
			if (guestbookName == null) {
				guestbookName = "default";
			}
			
			DatastoreService datastore = DatastoreServiceFactory
					.getDatastoreService();
			Key guestbookKey = KeyFactory.createKey("Guestbook", guestbookName);

			// Run an ancestor quessry to ensure we see the most up-to-date
			// view of the Greetings belonging to the selected Guestbook.
			Query query = new Query("Greeting", guestbookKey).addSort("date",
					Query.SortDirection.DESCENDING);
			List<Entity> greetings = datastore.prepare(query).asList(
					FetchOptions.Builder.withLimit(5));

			if (greetings.isEmpty()) {
		%>
		<p>
			Message Store '<%=guestbookName%>' has no messages.
		</p>
		<%
			} else {
		%>
		<p>
			Messages in message store '<%=guestbookName%>'.
		</p>
		<%
			for (Entity greeting : greetings) {
					if (greeting.getProperty("user") == null) {
		%>
		<p>An anonymous person wrote:</p>
		<%
			} else {
		%>
		<p>
			<b><%=((User) greeting.getProperty("user"))
								.getNickname()%></b> wrote:
		</p>
		<%
			}
		%>
		<blockquote><%=greeting.getProperty("content")%></blockquote>
		<%
			}
			}
		%>

		<form action="/sign" method="post">
			<div>
				<textarea name="content" rows="3" cols="60"></textarea>
			</div>
			<div>
				<input type="submit" value="Post Greeting" />
			</div>
			<input type="hidden" name="guestbookName" value="<%=guestbookName%>" />
		</form>
	</div>
</body>
</html>
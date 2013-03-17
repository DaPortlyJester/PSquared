package com.umich.umd.psquared;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Query;


public class TutoringServlet extends HttpServlet {
	
	private static final String COURSES_REQUEST = "Courses";

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		DatastoreService dstore = DatastoreServiceFactory.getDatastoreService();
		Key coursesKey = KeyFactory.createKey("Courses",COURSES_REQUEST);
		
		Query courseQ = new Query("Course",coursesKey).addSort("name");
		List<Entity> courseList = dstore.prepare(courseQ).asList(FetchOptions.Builder.withDefaults());
		
		req.setAttribute(COURSES_REQUEST, courseList);
		
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/tutoringApp.jsp");
		rd.forward(req, resp);
		
	}
	
	
}

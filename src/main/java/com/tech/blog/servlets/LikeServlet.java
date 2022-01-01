package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.LikedDao;
import com.tech.blog.helper.ConnectionProvider;


public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LikeServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String operation = request.getParameter("operation");
		int uid = Integer.parseInt(request.getParameter("uid"));
		int pid = Integer.parseInt(request.getParameter("pid"));
		
		response.setContentType("text/html");
		PrintWriter out =  response.getWriter();
		LikedDao likeDao = new LikedDao(ConnectionProvider.getConnection());
		if(operation.equals("like")) {
			boolean b = likeDao.insertLike(pid, uid);
			out.println(b);
		}
	}

}

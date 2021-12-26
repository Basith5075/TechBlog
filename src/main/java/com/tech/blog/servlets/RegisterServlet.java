package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RegisterServlet() {
        super();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html");
    	PrintWriter out = response.getWriter();
    	
    	String check = request.getParameter("checkbox");
    	if(check==null) {
    		out.println("Please Accept License Agreement !!");
    	}else {
    	
    	String name = request.getParameter("user_name");
		String email = request.getParameter("user_email");
		String password = request.getParameter("user_password");
		String about = request.getParameter("user_about");
		String gender = request.getParameter("user_gender");
    	
		// Storing requested data into the User class of entities
		
		User user = new User(name, email, password, gender, about);
		
		// Transferring the data stored into the User object to the UserDao
		
		UserDao userDao = new UserDao(ConnectionProvider.getConnection());
		boolean res = userDao.saveUser(user);
		if(res) {
			out.println("done");
    	}
    	else{
    		out.println("Something went wrong !!");
    	}
    	
    	
	}
    }
}

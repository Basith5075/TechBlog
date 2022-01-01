package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public EditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String name = request.getParameter("user_name");
		String email = request.getParameter("user_email");
		String password  = request.getParameter("user_password");
		String about = request.getParameter("user_about");
		Part part = request.getPart("image");
		String profile = part.getSubmittedFileName();
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("currentUser");
		
		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);
		user.setAbout(about);
		String oldFile = user.getProfile();
		user.setProfile(profile);
		System.out.println("Profile = "+profile);
		
		
		
		UserDao userDao = new UserDao();
		
		Connection con = ConnectionProvider.getConnection();
		userDao.setCon(con);
		
		
		boolean res = userDao.updateUser(user);
		
		if(res) {
			String oldPath = request.getRealPath("/")+"pics"+File.separator+oldFile;
			String path = request.getRealPath("/")+"pics"+File.separator+user.getProfile();
			Message msg = null;
			String message = null;
			if(!oldFile.equals("default.png")) {
			Helper.deleteFile(oldPath);
			}
			if(Helper.saveFile(part.getInputStream(), path)) {
//				message = message+" || Saved New File ||";
//				msg = new Message(message+path, "Success", "alert-success");
				msg = new Message("Update Profile Pic Successfully !!", "Success", "alert-success");
			}else {
//				message = message+"|| Failed to Save New File ||";
//				msg = new Message(message+path, "error", "alert-danger");
				if(profile.equals("")){
					msg = new Message("Update Profile Successfully !!", "Success", "alert-success");
				}else {
					msg = new Message("Failed to update profile pic !! Please try again later !!", "error", "alert-danger");
				}
			}
			
			session.setAttribute("msg", msg);
			
			response.sendRedirect("profile_page.jsp");
		}else {
			out.println("<h3>Something went wrong !!");
		}
		}
}

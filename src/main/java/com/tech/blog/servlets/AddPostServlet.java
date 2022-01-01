package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Posts;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

/**
 * Servlet implementation class AddPostServlet
 */
@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddPostServlet() {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html");
    	
    	PrintWriter out = response.getWriter();
    	
    	int cid = Integer.parseInt(request.getParameter("cid"));
    	String pTitle = request.getParameter("pTitle");
    	String pContent = request.getParameter("pContent");
    	String pCode = request.getParameter("pCode");
    	Part part = request.getPart("pic");
    	String pPic = part.getSubmittedFileName();
    	
    	// Creating session object to retrieve the user object and take out the userID "Id of usertable"
    	HttpSession session = request.getSession();
    	User user = (User)session.getAttribute("currentUser");
    	
    	int userID = user.getId();
    	
    	Posts post = new Posts(pTitle, pContent, pCode, pPic, cid, userID);
    	
    	PostDao postDao = new PostDao(ConnectionProvider.getConnection());
    	boolean res = postDao.savePost(post);
    	
    	if(res) {    			
    			String path = request.getRealPath("/")+"post_pics"+File.separator+post.getpPic();
    			InputStream picInStream =  part.getInputStream();
    			
    			if(Helper.saveFile(picInStream, path)) {
    				out.println("done");
    			}else {
    				out.println("error");		
    			}
    	}else {
			out.println("error");
    	}
    }

}
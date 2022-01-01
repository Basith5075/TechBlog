package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.Categories;
import com.tech.blog.entities.Posts;

public class PostDao {
	private Connection con ;
	boolean f = false;
	public PostDao(Connection con) {
		this.con = con;
	}
	
	// method for retreiving the categories
	public ArrayList<Categories> getPostCategories(){
		ArrayList<Categories> list = new ArrayList<>();
		
		String query = "SELECT * FROM techblog.categories";
		try {
		Statement stmt = con.createStatement();
		ResultSet rs =  stmt.executeQuery(query);
		
		while(rs.next()) {
			int cid = rs.getInt("cid");
			String name = rs.getString("name");
			String description = rs.getString("description");
			Categories cat = new Categories(cid,name,description);
			list.add(cat);
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// Method for saving the post
	public boolean savePost(Posts post) {
		boolean f = false;
		
		String query = "insert into posts(pTitle,pContent,pCode,pPic,catID,userID) values(?,?,?,?,?,?)";
		try {
		
		PreparedStatement ptsmt = con.prepareStatement(query);
		
		ptsmt.setString(1, post.getpTitle());
		ptsmt.setString(2, post.getpContent());
		ptsmt.setString(3, post.getpCode());
		ptsmt.setString(4, post.getpPic());
		ptsmt.setInt(5, post.getCatID());
		ptsmt.setInt(6, post.getUserID());
		
		ptsmt.executeUpdate();
		f= true;	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
	// Get all posts from DB
	public List<Posts> getAllPost() {
		
		List<Posts> list = new ArrayList<>();	
		
		String query = "select * from posts order by pid desc";
		try {
		Statement stmt = con.createStatement();
		ResultSet rs =   stmt.executeQuery(query);
		
		while(rs.next()) {
			int id = rs.getInt("pid");
			String pTitle = rs.getString("ptitle");
			String pContent = rs.getString("pContent");
			String pCode = rs.getString("pCode");
			String pPic = rs.getString("pPic");
			Timestamp pDate = rs.getTimestamp("pDate");
			int catID = rs.getInt("catID");
			int userID = rs.getInt("userID");
			Posts post = new Posts(id, pTitle, pContent, pCode, pPic, pDate, catID, userID);
			list.add(post);
		}
		 
		}catch(Exception e) {
			e.printStackTrace();			
		}
		return list;
	}
	
	// Get posts by catid
	public List<Posts> getAllPostsByCatID(int catID) {
		
		List<Posts> list = new ArrayList<>();	
		
		try {
		String query = "select * from posts where catid = ?";
		PreparedStatement ptsmt = con.prepareStatement(query);
		
		ptsmt.setInt(1, catID);
		ResultSet rs =  ptsmt.executeQuery();
		
		while(rs.next()) {
			int id = rs.getInt("pid");
			String pTitle = rs.getString("ptitle");
			String pContent = rs.getString("pContent");
			String pCode = rs.getString("pCode");
			String pPic = rs.getString("pPic");
			Timestamp pDate = rs.getTimestamp("pDate");
			int userID = rs.getInt("userID");
			Posts post = new Posts(id, pTitle, pContent, pCode, pPic, pDate, catID, userID);
			list.add(post);
		}
		 
		}catch(Exception e) {
			e.printStackTrace();			
		}
		return list;
		}	
	
	//	Get a post by its pid
	
public Posts getAllPostsByID(int pid) {
		Posts post = null;	
		try {
		String query = "select * from posts where pid = ?";
		PreparedStatement ptsmt = con.prepareStatement(query);
		ptsmt.setInt(1, pid);
		ResultSet rs =  ptsmt.executeQuery();
		
		while(rs.next()) {
			String pTitle = rs.getString("ptitle");
			String pContent = rs.getString("pContent");
			String pCode = rs.getString("pCode");
			String pPic = rs.getString("pPic");
			Timestamp pDate = rs.getTimestamp("pDate");
			int catID = rs.getInt("catID");
			int userID = rs.getInt("userID");
			
			post = new Posts(pid, pTitle, pContent, pCode, pPic, pDate, catID, userID);
			
		}
		 
		}catch(Exception e) {
			e.printStackTrace();			
		}
		return post;
		}	

}

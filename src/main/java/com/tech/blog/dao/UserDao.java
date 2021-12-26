package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

public class UserDao {
	
	private Connection con ;
	boolean f = false;
	public UserDao() {

	}
	
	public UserDao(Connection con) {
		this.con = con;
	}
//	Method for Registering the user
	public boolean saveUser(User user) {
		
		try {
			
			String name = user.getName();
			String email = user.getEmail();
			String password = user.getPassword();
			String about = user.getAbout();
			String gender = user.getGender();
			
			String query = "insert into user(name,email,password,gender,about) values (?,?,?,?,?)";
			
			PreparedStatement ptsmt =  con.prepareStatement(query);
			ptsmt.setString(1, name);
			ptsmt.setString(2, email);
			ptsmt.setString(3, password);
			ptsmt.setString(4, gender);
			ptsmt.setString(5, about);
			
			ptsmt.executeUpdate();
			f= true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
//	Method for retrieving the user details  for login operations
	
	public User getUserByEmailAndPassword(String email, String password) {
		User user = null;
		try {
		String query = "select * from user where email = ? and password = ?";
		
		PreparedStatement ptsmt = con.prepareStatement(query);
		ptsmt.setString(1, email);
		ptsmt.setString(2, password);
		ResultSet rs = ptsmt.executeQuery();
		
		if(rs.next()) {
			user = new User();
			String user_name = rs.getString("name");
			user.setName(user_name);
			user.setId(rs.getInt("id"));
			user.setEmail(rs.getString("email"));
			user.setPassword(rs.getString("password"));
			user.setGender(rs.getString("gender"));
			user.setAbout(rs.getString("about"));
			user.setProfile(rs.getString("profile"));			
		}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return user;
		
	}
	
}

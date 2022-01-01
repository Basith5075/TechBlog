package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikedDao {
	
	private Connection con;

	public LikedDao(Connection con) {
		super();
		this.con = con;
	}
	
	// Below methid insertLike () takes the postid and userid and stores it in the liked table --> "It likes a post"
	public boolean insertLike(int pid, int uid) {
		boolean f = false;
		
		String query = "insert into liked ( pid, uid) values (?,?)";
		
		try {
			PreparedStatement ptsmt = con.prepareStatement(query);
			ptsmt.setInt(1, pid);
			ptsmt.setInt(2, uid);
			ptsmt.executeUpdate();
			f = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	// Below method counts the number of likes in an post using the count() method
	public int countLikeOnPost(int pid) {
		
		int count = 0;
		
		String query = "select count(*) from liked where pid=?";
		
		try {
			PreparedStatement ptsmt = con.prepareStatement(query);
			ptsmt.setInt(1, pid);
			ResultSet rs = ptsmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	// Below method is used to know whether the logged in user has liked a particular post or not, it simply searches for the combination of uid and pid in the liked table
	public boolean isLikedByUser(int pid, int uid) {
		boolean f = false;
		
		try {
			PreparedStatement ptsmt = con.prepareStatement("select * from liked where pid = ? and uid = ?");
			ptsmt.setInt(1, pid);
			ptsmt.setInt(2, uid);
			ResultSet rs =  ptsmt.executeQuery();
			if(rs.next()) {
				f = true;
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
		
	}
	// Below table is used to delete a like on an existing post, it takes the uid and pid of the logged user and deletes the row from the liked table with the respective uid and pid
	public boolean deleteLike(int pid, int uid) {
		
			boolean f = false;
			
			try {
				PreparedStatement ptsmt = con.prepareStatement("delete from liked where pid=? and uid=?");
				ptsmt.setInt(1, pid);
				ptsmt.setInt(2, uid);
				ptsmt.executeUpdate();
				f = true;
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return f;
			
		}
	
	
	
}

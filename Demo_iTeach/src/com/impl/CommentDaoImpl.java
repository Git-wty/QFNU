package com.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dao.CommentDao;
import com.dao.DBUtil;
import com.model.Comment;

public class CommentDaoImpl implements CommentDao {

	@Override
	public void addComment(Comment comment) {
		// TODO Auto-generated method stub
		Connection conn=null;
		PreparedStatement st=null;
		ResultSet rs=null;
		String sql="insert into comment(class_id,student_name,comment)values(?,?,?);";
		try {
			conn=DBUtil.getConnection();
			st=conn.prepareStatement(sql);
			
			st.setString(1, comment.getClassId());
			st.setString(2, comment.getStudentName());
			st.setString(3, comment.getComment());
			
			int num=st.executeUpdate();
			if (num>0) {
				System.out.println("发表评论成功！");
			}else {
				System.out.println("发表评论失败！");
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			DBUtil.release(conn, st, rs);
		}
	}

}

package com.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dao.ClassDao;
import com.dao.DBUtil;
import com.model.WisdomClass;

public class ClassImpl implements ClassDao {

	@Override
	public void createClass(WisdomClass wisdomClass) {
		// TODO Auto-generated method stub
		Connection conn=null;
		PreparedStatement st=null;
		ResultSet rs=null;
		String sql="insert into class(class_id,class_name,teacher_name)values(?,?,?);";
		try {
			conn=DBUtil.getConnection();
			st=conn.prepareStatement(sql);
			st.setString(1, wisdomClass.getClassId());
			st.setString(2, wisdomClass.getClassName());
			st.setString(3, wisdomClass.getTeacherName());
			
			int num=st.executeUpdate();
			if (num>0) {
				System.out.println("创建课堂成功！");
			}else {
				System.out.println("创建课堂失败！");
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			DBUtil.release(conn, st, rs);
		}
	}

	@Override
	public void joinClass(String studentId, String classId) {
		// TODO Auto-generated method stub
		Connection conn=null;
		PreparedStatement st=null;
		ResultSet rs = null;
		String sql="insert into student_class(student_id,class_id)values(?,?);";
		try {
			conn=DBUtil.getConnection();
			st=conn.prepareStatement(sql);
			st.setString(1, studentId);
			st.setString(2, classId);
			
			int num=st.executeUpdate();
			if (num>0) {
				System.out.println("加入课堂成功！");
			}else {
				System.out.println("加入课堂失败！");
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			DBUtil.release(conn, st, rs);
		}
	}

	public ResultSet showClass(String classId) {
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs = null;
		String sql="select student_name from student_class where class_id=?;";
		try {
			conn=DBUtil.getConnection();
			ps=conn.prepareStatement(sql);
			ps.setString(1, classId);
			
			rs = ps.executeQuery();
			
			return rs;

			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
//			DBUtil.release(conn, ps, rs);
		}

		return rs;
	}
}

package com.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import com.dao.DBUtil;
import com.dao.ISelectionDao;
import com.model.Selection;
import java.sql.Statement;

public class SelectionDaoImpl implements ISelectionDao{

	@Override
	public void addSelection(Selection selection) {
		Connection conn=null;
		PreparedStatement st=null;
		ResultSet rs=null;
		String sql="insert into selection(title_id,title,answer,a,b,c,d,paper_id)values(?,?,?,?,?,?,?,?)";
		
		try {
			conn=DBUtil.getConnection();
			st=conn.prepareStatement(sql);
			st.setInt(1, selection.getTitle_id());
			st.setString(2, selection.getTitle());
			st.setString(3, selection.getAnswer());
			st.setString(4, selection.getA());
			st.setString(5, selection.getB());
			st.setString(6, selection.getC());
			st.setString(7, selection.getD());
			st.setString(8, selection.getPaper_id());
			int num=st.executeUpdate();
			if (num>0) {
				System.out.println("插入成功！");
			}else {
				System.out.println("插入失败！");
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			DBUtil.release(conn, st, rs);
		}
		
		
	}

	public ResultSet showSelection(String paper_id) {
		// TODO Auto-generated method stub
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		String sql="select * from selection where paper_id="+"'"+paper_id+"';";
		System.out.println(sql);
		
		try {
			conn=DBUtil.getConnection();
			stmt=conn.createStatement();
			rs = stmt.executeQuery(sql);
			return rs;
		} catch (SQLException e) {
			
			e.printStackTrace();
		} 
		return rs;
	}
	
//	public static void main(String[] args) {
//	
//		ResultSet rs = new SelectionDaoImpl().showSelection(2);
//		try {
//			while(rs.next()) {
//				System.out.println(rs.getString(1));
//				System.out.println(rs.getString(2));
//				System.out.println(rs.getString(3));
//				System.out.println(rs.getString(4));
//				System.out.println(rs.getString(5));
//				System.out.println(rs.getString(6));
//				System.out.println(rs.getString(7));
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
	

}

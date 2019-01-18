package com.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.dao.DBUtil;
import com.dao.ISimpleDao;
import com.model.Simple;

public class SimpleDaoImpl implements ISimpleDao{

	@Override
	public void addSimple(Simple simple) {
		Connection conn=null;
		PreparedStatement st=null;
		ResultSet rs=null;
		String sql="insert into simple(title_id,title,paper_id)values(?,?,?)";
		
		try {
			conn=DBUtil.getConnection();
			st=conn.prepareStatement(sql);
			st.setInt(1, simple.getTitle_id());
			st.setString(2, simple.getTitle());
			
			st.setString(3, simple.getPaper_id());
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

	public ResultSet showSimple(String paper_id) {
		// TODO Auto-generated method stub
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		String sql="select * from simple where paper_id="+"'"+paper_id+"';";
		
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
		
	}
	


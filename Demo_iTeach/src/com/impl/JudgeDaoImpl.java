package com.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.dao.DBUtil;
import com.dao.IJudgeDao;
import com.model.Judge;

public class JudgeDaoImpl implements IJudgeDao {

	@Override
	public void addJudge(Judge judge) {
		// TODO Auto-generated method stub
		Connection conn=null;
		PreparedStatement st=null;
		ResultSet rs=null;
		String sql="insert into judge(title_id,title_name,answer,paper_id)values(?,?,?,?)";
		
		try {
			conn=DBUtil.getConnection();
			st=conn.prepareStatement(sql);
			st.setInt(1, judge.getTitleId());
			st.setString(2, judge.getTitleName());
			st.setString(3, judge.getAnswer());
			st.setString(4, judge.getPaperId());
			int num=st.executeUpdate();
			if (num>0) {
				System.out.println("插入成功！");
			}else {
				System.out.println("插入失败！");
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} 
		
	}

	@Override
	public ResultSet showJudge(String paper_id) {
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		String sql="select * from judge where paper_id="+"'"+paper_id+"';";
		
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

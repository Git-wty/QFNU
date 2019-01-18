package com.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Set;

import com.dao.DBUtil;
import com.dao.IPaperDao;
import com.model.Paper;

public class PaperDaoImpl implements  IPaperDao{

	@Override
	public void addPaper(Paper paper) {
		Connection conn=null;
		PreparedStatement st=null;
		ResultSet rs=null;
		
		
		try {
			
			conn=DBUtil.getConnection();
			System.out.println("2"+conn);
			String sql="insert into paper(paper_id,paper_name,teacher_id) values (?,?,?);";
			st=conn.prepareStatement(sql);
			st.setString(1, paper.getPaperId());
			st.setString(2, paper.getPaperName());
			st.setString(3, paper.getTeacher_id());
			System.out.println("cnonection");
			
			int num=st.executeUpdate();
			if (num>0) {
				System.out.println("插入成功");
			}else {
				System.out.println("插入失败！");
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.err.println("DBUTIL");
		}finally {
		//	DBUtil.release(conn, st, rs);
		}
		
	}
	
	public Paper findPaperById(int paperId) {
		Connection conn=null;
		PreparedStatement st=null;
		ResultSet rs=null;
		String sql="select * from paper where paper_id=?";
		Paper paper=new Paper();
		
		try {
			conn=DBUtil.getConnection();
			st=conn.prepareStatement(sql);
			st.setInt(1,paperId);
			rs=st.executeQuery();
			rs.next();
			
			paper.setPaperId(rs.getString("paper_id"));
			paper.setPaperName(rs.getString("paper_name"));

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return paper;
		
	}
	
	
	public static void main(String[] args) {
		PaperDaoImpl paperDao=new PaperDaoImpl();
		Paper paper=new Paper();
		paper.setPaperId("9999");
		paper.setPaperName("黄大仙");
		paper.setTeacher_id("555");
	
		paperDao.addPaper(paper);
			
	}

}

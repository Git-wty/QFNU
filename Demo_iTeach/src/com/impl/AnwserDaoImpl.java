package com.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dao.DBUtil;
import com.dao.IAnswerDao;
import com.model.Answer;

public class AnwserDaoImpl implements IAnswerDao {

	@Override
	public void addAnswer(Answer answer) {
		Connection conn=null;
		PreparedStatement st=null;
		ResultSet rs=null;
		String sql="insert into paper_answer(student_id,paper_id,selection_ans,judgement_ans,simple_ans,flag)values(?,?,0,0,0,0)";
		
		try {
			conn=DBUtil.getConnection();
			st=conn.prepareStatement(sql);
			st.setString(1, answer.getStudent_id());
			st.setString(2, answer.getPaper_id());
			
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
	
	public void addSelectionAnwser(String paperId,String studentId,String judgement_an) {
		Connection conn=null;
		PreparedStatement st=null;
		ResultSet rs=null;
		String sql="update paper_answer set selection_ans=? where student_id=? and paper_id=? ";
		
		try {
			conn=DBUtil.getConnection();
			st=conn.prepareStatement(sql);
			st.setString(1, judgement_an);
			st.setString(2, studentId);
			st.setString(3, paperId);
			
			
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
	
	public void addSimpleAnwser(String paperId,String studentId,String simple_an) {
		Connection conn=null;
		PreparedStatement st=null;
		ResultSet rs=null;
		String sql="update paper_answer set simple_ans=? where student_id=? and paper_id=? ";
		
		try {
			conn=DBUtil.getConnection();
			st=conn.prepareStatement(sql);
			st.setString(1,simple_an);
			st.setString(2, studentId);
			st.setString(3, paperId);
			
			
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

	
	public void addJudgementAnwser(String paperId,String studentId,String judgement_an) {
		Connection conn=null;
		PreparedStatement st=null;
		ResultSet rs=null;
		String sql="update paper_answer set judgement_ans=? where student_id=? and paper_id=? ";
		
		try {
			conn=DBUtil.getConnection();
			st=conn.prepareStatement(sql);
			st.setString(1, judgement_an);
			st.setString(2, studentId);
			st.setString(3, paperId);
			
			
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
	
	public ResultSet CheckAnswer(String paper_id) {
		Connection conn=null;
		PreparedStatement st=null;
		ResultSet rs=null;
		String sql="select student_id,selection_ans,judgement_ans,simple_ans from paper_answer where paper_id=?";
		
		try {
			conn=DBUtil.getConnection();
			st=conn.prepareStatement(sql);
			st.setString(1, paper_id);
			rs = st.executeQuery();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return rs; 
	}
	
	

}

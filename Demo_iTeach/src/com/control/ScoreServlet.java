package com.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.core.DBUtil;


@WebServlet("/ScoreServlet")
public class ScoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ScoreServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		int flag=Integer.parseInt(request.getParameter("score"));
		String student_id=request.getParameter("student_id");
		String paper_id=request.getParameter("paper_id");
		
		
		Connection conn1=null;
		
		PreparedStatement st1=null;
		
		ResultSet rs1=null;
		
		String sql_update="update paper_answer set flag=? where student_id=? and paper_id=?";
		
		try {
		
				
				conn1=DBUtil.getConnection();
				st1=conn1.prepareStatement(sql_update);
				st1.setInt(1, flag);
				st1.setString(2, student_id);
				st1.setString(3, paper_id);
				int num=st1.executeUpdate();
				if (num>0) {
					PrintWriter writer=response.getWriter();
					writer.print("<script>alert('提交成功');window.history.back();</script>");
					
				}else {
					
				}
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

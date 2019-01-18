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

/**
 * Servlet implementation class CheckPaperServlet
 */
@WebServlet("/CheckPaperServlet")
public class CheckPaperServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public CheckPaperServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		int paper_id=Integer.parseInt(request.getParameter("paper_id"));
		HttpSession session=request.getSession();
		session.setAttribute("paper_id", paper_id);
		request.setAttribute("paper_id", paper_id);
		String teacher_id=(String)session.getAttribute("username");
		
		
		Connection conn=null;
		PreparedStatement st=null;
		ResultSet rs=null;
		String sql="select * from paper where paper_id=? and teacher_id=?";
		
		try {
			conn=DBUtil.getConnection();
			st=conn.prepareStatement(sql);
			st.setInt(1, paper_id);
			st.setString(2, teacher_id);
			rs=st.executeQuery();
			
			if (rs!=null&&rs.next()) {
				request.getRequestDispatcher("/CheckPaper.jsp").forward(request, response);
			}else {
				out.print("<h1>您还没有试卷</h1>");
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

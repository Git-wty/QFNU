package com.dh.demo4.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Insert_question_comment
 */
@WebServlet("/Insert_question_comment")
public class Insert_question_comment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public Connection conn=null;
	public PreparedStatement pstmt=null;
	public ResultSet rs=null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Insert_question_comment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		//�?测是否登录，如果没有登录则跳�?
		HttpSession session=request.getSession();
		String username=(String) session.getAttribute("username");
		if(username== null) {
			response.sendRedirect(request.getContextPath()+"/entry.html");
		}else {
			//获得对应题目id并获取答题人的username以及答题人评�?
			String question_comment=request.getParameter("question_comment");
			
			String question_id=request.getParameter("question_id");
			 
			try {
				String DRIVER="com.mysql.jdbc.Driver";
				String user="iteach";
				String password="iteach123";
				Class.forName(DRIVER);
				conn=DriverManager.getConnection("jdbc:mysql://154.8.194.176:3306/iteach?useUnicode=true",user,password);
				if (!conn.isClosed()) {
					System.out.println("数据库连接成�?");
				}
				String sql="INSERT INTO question_comment(question_id,question_comment,comment_user) VALUES ('"+question_id+"','"+question_comment+"','"+username+"')";
				System.out.print(sql);
				pstmt=conn.prepareStatement(sql); 

				pstmt.executeUpdate();
				} catch (Exception e) {
					
				}
			response.sendRedirect(request.getContextPath()+"/question-view.jsp?question_id="+question_id);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

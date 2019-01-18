package com.dh.demo4.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.*;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class CommentServlet
 */
@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public Connection conn=null;
	public Statement stmt=null;
	public ResultSet rs=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/xml;charset=UTF-8");
		String live=request.getParameter("room_id");
		PrintWriter out=response.getWriter();
		out.print("<response>");
		
		try {
			String DRIVER="com.mysql.jdbc.Driver";
			String user="iteach";
			String password="iteach123";
			Class.forName(DRIVER);
			conn=DriverManager.getConnection("jdbc:mysql://154.8.194.176:3306/iteach?useUnicode=true",user,password);
			if (!conn.isClosed()) {
				//System.out.println("成功连接数据�?");
			}
	        
			stmt=conn.createStatement();
			} catch (Exception e) {
				
			}
		
		try {
			String sql = "SELECT comment,name FROM live_comment WHERE live_id='"+live+"'";
			rs = stmt.executeQuery(sql);
			 while(rs.next()){
	                // ͨ���ֶμ���
	                String name = rs.getString("name");
	                String content = rs.getString("comment");
	    
	                // �������?
	                out.print("<comment>");
	                out.print("<content>"+content+"</content>");
	                out.print("<name>"+name+"</name>");
	                out.print("</comment>");
	            }
	            // ��ɺ�ر�
	            rs.close();
	            stmt.close();
	            conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.print("</response>");
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

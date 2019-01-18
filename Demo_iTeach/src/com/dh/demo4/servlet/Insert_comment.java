package com.dh.demo4.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Insert_comment
 */
@WebServlet("/Insert_comment")
public class Insert_comment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public Connection conn=null;
	public PreparedStatement pstmt=null;
	public ResultSet rs=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Insert_comment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		//获得相应直播房间号及评论内容及评论人姓名
		String comment_content=request.getParameter("content");
		String room_id=request.getParameter("room_id");
		String name=request.getParameter("name");
		 
		try {
			String DRIVER="com.mysql.jdbc.Driver";
			String user="iteach";
			String password="iteach123";
			Class.forName(DRIVER);
			conn=DriverManager.getConnection("jdbc:mysql://154.8.194.176:3306/iteach?useUnicode=true",user,password);
			if (!conn.isClosed()) {
				System.out.println("数据库连接成功");
			}
			String sql="INSERT INTO live_comment(live_id,comment,name) VALUES ('"+room_id+"','"+comment_content+"','"+name+"')";
			System.out.print(sql);
			pstmt=conn.prepareStatement(sql); 

			pstmt.executeUpdate();
			} catch (Exception e) {
				
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

package com.dh.demo4.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/Delete_room")
public class Delete_room extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Connection conn=null;
	PreparedStatement pstmt;
	

    public Delete_room() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String topic_id=request.getParameter("topic_id");
		
		try {
			String DRIVER="com.mysql.jdbc.Driver";
			String user="iteach";
			String password="iteach123";
			Class.forName(DRIVER);
			conn=DriverManager.getConnection("jdbc:mysql://154.8.194.176:3306/iteach?useUnicode=true",user,password);
			if (!conn.isClosed()) {
				System.out.println("数据库连接成�?");
			}	
			} catch (Exception e) {
				
			}
		String sql="DELETE FROM topic_room WHERE topic_id='"+topic_id+"'";
		try {
			pstmt=conn.prepareStatement(sql);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println(sql);
		try {
			pstmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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

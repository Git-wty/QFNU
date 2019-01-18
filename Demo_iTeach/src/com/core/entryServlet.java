package com.core;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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

/**
 * Servlet implementation class entryServlet
 */
@WebServlet("/entryServlet")
public class entryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public entryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		String username=request.getParameter("username");
		String password=md5(request.getParameter("password"));
		
		
		
		Connection conn=null;
		PreparedStatement st=null;
		ResultSet rs=null;
		String sql="select * from user where username=? and password=?";
		
		try {
			conn=DBUtil.getConnection();
			st=conn.prepareStatement(sql);
			st.setString(1, username);
			st.setString(2, password);
			rs=st.executeQuery();
			
			if (rs!=null&&rs.next()) {
				
				HttpSession session=request.getSession();
				session.setAttribute("username", username);
				session.setAttribute("name", rs.getString(3).toString());
			    
				String status = rs.getString("status");
				session.setAttribute("status", status);
				response.sendRedirect(request.getContextPath()+"/index.jsp");
			}else {	
				out.print("<script>alert('用户信息有误，请重试');window.history.back();</script>");
			}
			
		} catch (SQLException e) {
			
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

	public static String md5(String string) {
	    if(string == null){
	        return null;
	    }
	    char hexDigits[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
	            'A', 'B', 'C', 'D', 'E', 'F'};

	    try{
	        byte[] btInput = string.getBytes("utf-8");
	        /** 获得MD5摘要算法的 MessageDigest 对象 */
	        MessageDigest mdInst = MessageDigest.getInstance("MD5");
	        /** 使用指定的字节更新摘要 */
	        mdInst.update(btInput);
	        /** 获得密文 */
	        byte[] md = mdInst.digest();
	        /** 把密文转换成十六进制的字符串形式 */
	        int j = md.length;
	        char str[] = new char[j * 2];
	        int k = 0;
	        for (byte byte0 : md) {
	            str[k++] = hexDigits[byte0 >>> 4 & 0xf];
	            str[k++] = hexDigits[byte0 & 0xf];
	        }
	        return new String(str);
	    }catch(NoSuchAlgorithmException | UnsupportedEncodingException e){
	        return null;
	    }
	}
}


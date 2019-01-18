package com.core;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.impl.RegisterDaoImpl;
import com.model.User;

import sun.security.provider.MD5;

/**
 * Servlet implementation class registerServlet
 */
@WebServlet("/registerServlet")
public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				request.setCharacterEncoding("UTF-8");
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out=response.getWriter();
				//
				String username=request.getParameter("username");
				String password=md5(request.getParameter("password"));
				//
				String surname=request.getParameter("surname");
				String school=request.getParameter("lschool");
				//
				String status=request.getParameter("status");
			
				Connection conn=null;
				PreparedStatement st=null;
				ResultSet rs=null;
				String sql="select username from user";
				
				int flag=0;
				try {
					conn=DBUtil.getConnection();
					st=conn.prepareStatement(sql);
					rs=st.executeQuery();
					System.out.println(rs);
					while(rs.next()) {
						if (username.equals(rs.getString(1))) {
							System.out.println(rs.getString(1));
							flag++;
							break;
						}
						
					}
				
				//response.sendRedirect(request.getContextPath()+"/entry.html");
				}catch (Exception e) {
					e.printStackTrace();
				}
				if (flag==0) {
					RegisterDaoImpl rdi=new RegisterDaoImpl();
					User user=new User();
					
					user.setUsername(username);
					user.setPassword(password);
					user.setName(surname);
					user.setSchool(school);
					user.setStatus(status);
					rdi.addUser(user);
					out.print("<script>alert('注册成功');window.history.back();</script>");
				}else {
					out.print("<script>alert('用户名已存在，请检查');window.history.back();</script>");
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

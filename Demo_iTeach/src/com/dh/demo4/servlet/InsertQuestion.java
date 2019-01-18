package com.dh.demo4.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class InsertQuestion
 */
@WebServlet("/InsertQuestion")
public class InsertQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public Connection conn=null;
	public PreparedStatement pstmt=null;
	public ResultSet rs=null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertQuestion() {
        super();
        // TODO Auto-generated constructor stub
    }

    private static String getItemID(int n)
    {
        String val = "";
        Random random = new Random();
        for ( int i = 0; i < n; i++ )
        {
            String str = random.nextInt( 2 ) % 2 == 0 ? "num" : "char";
            if ( "char".equalsIgnoreCase( str ) )
            { // 产生字母
                int nextInt = random.nextInt( 2 ) % 2 == 0 ? 65 : 97;
                // System.out.println(nextInt + "!!!!"); 1,0,1,1,1,0,0
                val += (char) ( nextInt + random.nextInt( 26 ) );
            }
            else if ( "num".equalsIgnoreCase( str ) )
            { // 产生数字
                val += String.valueOf( random.nextInt( 10 ) );
            }
        }
        return val;
    } 
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		//获得问题名称、问题简介�?�问题类别，创建问题�?
		String question_name=request.getParameter("question_name");
		String question_introduce=request.getParameter("question_introduce");
		String question_style=request.getParameter("question_style");
		String question_id=getItemID(15);
		HttpSession session=request.getSession();
		String username=(String) session.getAttribute("username");
		if(username== null) {
			response.sendRedirect(request.getContextPath()+"/entry.html");
		}
		
		try {
			String DRIVER="com.mysql.jdbc.Driver";
			String user="iteach";
			String password="iteach123";
			Class.forName(DRIVER);
			conn=DriverManager.getConnection("jdbc:mysql://154.8.194.176:3306/iteach?useUnicode=true",user,password);
			if (!conn.isClosed()) {
				System.out.println("数据库连接成�?");
			}
			String sql="INSERT INTO question(question_id,question_name,question_introduce,question_style,question_user) VALUES ('"+question_id+"','"+question_name+"','"+question_introduce+"','"+question_style+"','"+username+"')";
			pstmt=conn.prepareStatement(sql); 

			pstmt.executeUpdate();
			} catch (Exception e) {
				
			}
		response.sendRedirect(request.getContextPath()+"/iTeach-community.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

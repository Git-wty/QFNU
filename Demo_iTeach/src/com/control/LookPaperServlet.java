package com.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.core.DBUtil;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

/**
 * Servlet implementation class LookPaperServlet
 */
@WebServlet("/LookPaperServlet")
public class LookPaperServlet extends HttpServlet {
	private static final long serialVersionUID = 1L; 
       
  
    public LookPaperServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out=response.getWriter();
		
		String teacher_id=(String)request.getSession().getAttribute("username");
		
		
		Connection conn=null;
		PreparedStatement st=null;
		ResultSet rs=null;
		String sql="select paper_id,paper_name from paper where teacher_id=?";
		ArrayList paperids=new ArrayList();
		ArrayList papernames=new ArrayList();
		
		try {
			conn=DBUtil.getConnection();
			st=conn.prepareStatement(sql);
			st.setString(1, teacher_id);
			rs=st.executeQuery();
			
			while(rs.next()) {
				int paperid_num=rs.getInt(1);
				String papername_num=rs.getString(2);
				paperids.add(paperid_num);
				papernames.add(papername_num);
			}
			
			for(int i=0;i<paperids.size();i++) {
				int papid=(int)paperids.get(i);
				String papname=(String)papernames.get(i);
				
			
				out.print("<a href='showPaper.jsp?paper_id="+String.valueOf(papid)+"'><p>"+papid+"  "+papname+"</p></a>");
				
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

}

package com.control;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.core.DBUtil;
import com.impl.PaperDaoImpl;
import com.model.Paper;
import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

/**
 * Servlet implementation class paperServlet
 */
@WebServlet("/paperServlet")
public class paperServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public paperServlet() {
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
		//产生随机试卷编号
		String str="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	     Random random=new Random();
	     StringBuffer sb=new StringBuffer();
	     for(int i=0;i<10;i++){
	       int number=random.nextInt(62);
	       sb.append(str.charAt(number));
	     }
		String paper_id=sb.toString();
		
		HttpSession paper_sc=request.getSession();
		paper_sc.setAttribute("paper_id", paper_id);
		//String teacher_id=(String)paper_sc.getAttribute("username");
	

		String paper_name=request.getParameter("paper_name");
		String teacher_id=(String)paper_sc.getAttribute("username");
		
		
//		Paper paper = new Paper();
//		paper.setPaperId(paper_id);
//		paper.setPaperName(paper_name);
//		paper.setTeacher_id(teacher_id);
		
		
//		PaperDaoImpl paperDaoImpl=new PaperDaoImpl();
//		paperDaoImpl.addPaper(paper);
//		  
    	request.setAttribute("paper_id", paper_id);
		request.setAttribute("paper_name", paper_name);
		request.setAttribute("teacher_id", teacher_id);
	
		
		request.getRequestDispatcher("thepaper.jsp").forward(request, response);
	}
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

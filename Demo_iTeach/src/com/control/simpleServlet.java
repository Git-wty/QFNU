package com.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.impl.SimpleDaoImpl;
import com.model.Simple;

/**
 * Servlet implementation class simpleServlet
 */
@WebServlet("/simpleServlet")
public class simpleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public simpleServlet() {
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
		
		HttpSession paper_sc=request.getSession();
		System.out.println(paper_sc+"simple");
		int paper_id = (int) paper_sc.getAttribute("paper_id");
		
		int simple_id=Integer.parseInt(request.getParameter("simple_id"));
		String simple_name=request.getParameter("simple_name");
		String simple_content=request.getParameter("simple_content");
		
		Simple simple=new Simple();
		simple.setTitle_id(simple_id);
		simple.setTitle(simple_name);
		simple.setContent(simple_content);
		simple.setPaper_id(paper_id);
		
		
		
		SimpleDaoImpl simpleDaoImpl=new SimpleDaoImpl();
		simpleDaoImpl.addSimple(simple);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

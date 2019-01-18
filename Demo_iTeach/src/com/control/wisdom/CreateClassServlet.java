package com.control.wisdom;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.core.RandomString;
import com.impl.ClassImpl;
import com.model.WisdomClass;

/**
 * Servlet implementation class CreateClassServlet
 */
@WebServlet("/CreateClassServlet")
public class CreateClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateClassServlet() {
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
		PrintWriter out = response.getWriter();
		
		RandomString rs = new RandomString();
		String classId = rs.getItemID(4);
		String className = request.getParameter("class_name");
		String teacherName = request.getParameter("teacher_name");
		WisdomClass wisdomClass = new WisdomClass();
		wisdomClass.setClassId(classId);
		wisdomClass.setClassName(className);
		wisdomClass.setTeacherName(teacherName);
		ClassImpl cla = new ClassImpl();
		cla.createClass(wisdomClass);
	

		out.print("<script>alert('新建课堂成功，您可以在课堂管理中看到新创建课堂的编号，请将其传达给学生，新建课堂名称："+classId+"');window.history.back();</script>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package com.control.wisdom;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.impl.CommentDaoImpl;
import com.model.Comment;

/**
 * Servlet implementation class WisdomCommentServlet
 */
@WebServlet("/WisdomCommentServlet")
public class WisdomCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WisdomCommentServlet() {
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
		PrintWriter out = response.getWriter();
		

		String classId = request.getParameter("class_id").toString();
		String comment2 = request.getParameter("comment").toString();
		String studentName = request.getParameter("student_name").toString();
		Comment comment = new Comment();
		comment.setClassId(classId);
		comment.setStudentName(studentName);
		comment.setComment(comment2);
		
		CommentDaoImpl cdi = new CommentDaoImpl();
		cdi.addComment(comment);

		out.print("<script>alert('发表评论成功！');window.history.back();</script>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

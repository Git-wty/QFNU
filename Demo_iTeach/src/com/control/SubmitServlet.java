package com.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.impl.AnwserDaoImpl;
import com.model.Answer;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.InterningXmlVisitor;

/**
 * Servlet implementation class SubmitServlet
 */
@WebServlet("/SubmitServlet")
public class SubmitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubmitServlet() {
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
		
		HttpSession session = request.getSession();
		String student_id=(String) session.getAttribute("username"); 
		String paperId = request.getParameter("paper_id");
		
		Answer answer=new Answer();
		answer.setStudent_id(student_id);
		answer.setPaper_id(paperId);
		AnwserDaoImpl anwserDaoImpl=new AnwserDaoImpl();
		anwserDaoImpl.addAnswer(answer);
		
		
		//获取选择题数量
		int selection_num=Integer.parseInt(request.getParameter("selection_num"));
		String selection_answers="";
		//获取判断题数量
		int judgement_num=Integer.parseInt(request.getParameter("judgement_num"));
		String judgement_answers="";
		//获取简答题数量
		int simple_num=Integer.parseInt(request.getParameter("simple_num"));
		String simple_answers="";
		//获取选择题的信息
		for(int i=0;i<selection_num;i++) {
			String selection_anwser=request.getParameter("answer_selection"+(i+1));
			selection_answers+="@"+selection_anwser;
		}
		anwserDaoImpl.addSelectionAnwser(paperId,student_id, selection_answers);
		
		//获取判断题的信息
		for(int i=0;i<judgement_num;i++) {
			String judgement_answer=request.getParameter("answer_judge"+(i+1));
			judgement_answers+="#"+judgement_answer;
		}
		anwserDaoImpl.addJudgementAnwser(paperId, student_id,judgement_answers);
		
		//获取简答题的信息
		for(int i=0;i<simple_num;i++) {
			String simple_answer=request.getParameter("content"+(i+1));
			simple_answers+="@#"+simple_answer;
		}
		anwserDaoImpl.addSimpleAnwser(paperId, student_id,simple_answers);
		PrintWriter writer=response.getWriter();
		writer.print("<script>alert('提交成功');window.history.go(-2);</script>");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

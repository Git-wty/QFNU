package com.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.impl.JudgeDaoImpl;
import com.model.Judge;

/**
 * Servlet implementation class JudgmentServlet
 */
@WebServlet("/JudgmentServlet")
public class JudgmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JudgmentServlet() {
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
		//获取试卷信息
	
//		int paper_id=Integer.parseInt(request.getParameter("paper_id"));
//		int paper_id = 5;
//		String paper_name=request.getParameter("paper_name");
		HttpSession paper_sc=request.getSession();
		System.out.println(paper_sc+"simple");
		int paperId = (int) paper_sc.getAttribute("paper_id");
		System.out.println(paperId+"simple");
		
		int judgmentId = Integer.parseInt(request.getParameter("judgment_id"));
		String titleName = request.getParameter("judgment_name");
		String answer = request.getParameter("answer");
		Judge judge = new Judge();
		judge.setTitleId(judgmentId);
		judge.setTitleName(titleName);
		judge.setAnswer(answer);
		judge.setPaperId(paperId);
		JudgeDaoImpl judgeImpl = new JudgeDaoImpl();
		judgeImpl.addJudge(judge);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

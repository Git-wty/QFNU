package com.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.impl.PaperDaoImpl;
import com.impl.SelectionDaoImpl;
import com.model.Paper;
import com.model.Selection;


/**
 * @author lenovo  E-mail: example@aliyun.com
 * @version 创建时间：2018年8月28日  下午11:12:33
 * tags
 */
@WebServlet("/selectionServlet")
public class selectionServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		//获取试卷信息
	
//		int paper_id=Integer.parseInt(request.getParameter("paper_id"));
//		int paper_id = 5;
//		String paper_name=request.getParameter("paper_name");
		HttpSession paper_sc=request.getSession();
		int paper_id = (int) paper_sc.getAttribute("paper_id");
		System.out.println(paper_id+"xuanzeti");
		
		
		

		//获取选择题的数量
		String[] selection_num=request.getParameterValues("selection_num");
		int selection_num_int[]=new int[selection_num.length];
		for(int i=0;i<selection_num.length;i++) {
			selection_num_int[i]=Integer.parseInt(selection_num[i]);
		}
		//获取选择题真实数量
		int selection_flag=selection_num_int[(selection_num_int.length-1)];
		//获取其他参数
		int selection_id[]=new int[selection_flag];
		String selection_name[]=new String[selection_flag];
		String selection_anwser[]=new String[selection_flag];
		String selection_a[]=new String[selection_flag];
		String selection_b[]=new String[selection_flag];
		String selection_c[]=new String[selection_flag];
		String selection_d[]=new String[selection_flag];                                                                                                   
		
		SelectionDaoImpl selectionDaoImpl=new SelectionDaoImpl();
		
		
		//遍历所有选择题，获取所有选择题的参数
		for(int i=0;i<selection_flag;i++) {
			Selection selection=new Selection();
			System.out.println(selection_flag);
			System.out.println(request.getParameter("selection_id"+(i+1))+"aaaa");
			System.out.println(request.getParameter("anwser"+(i+1))+"bbbb");
			
			
			selection_id[i]=Integer.parseInt(request.getParameter(("selection_id"+(i+1))));
			selection_name[i]=request.getParameter("selection_name"+(i+1));
			selection_anwser[i]=request.getParameter("anwser"+(i+1));
			selection_a[i]=request.getParameter("selection_a"+(i+1));
			selection_b[i]=request.getParameter("selection_b"+(i+1));
			selection_c[i]=request.getParameter("selection_c"+(i+1));
			selection_d[i]=request.getParameter("selection_d"+(i+1));
			selection.setTitle_id(selection_id[i]);
			selection.setTitle(selection_name[i]);
			selection.setAnswer(selection_anwser[i]);
			selection.setA(selection_a[i]);
			selection.setB(selection_b[i]);
			selection.setC(selection_c[i]);
			selection.setD(selection_d[i]);
			selection.setPaper_id(paper_id);
			selectionDaoImpl.addSelection(selection);
			
		
		}
		PrintWriter writer=response.getWriter();
		
		writer.print("<script>alert('提交成功');window.history.go(-2);</script>");
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
package com.demo.service;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.dao.UserDAO;
import com.demo.entity.Users;

@WebServlet("/updateusers")
public class UsersUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      private UserDAO userDAO= new UserDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsersUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//��ȡ�û�Ҫ���µ�����
		String id=request.getParameter("id");
		String nickname=request.getParameter("nickname");
		String age=request.getParameter("age");
		String gender=request.getParameter("gender");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String remark=request.getParameter("remark");
		//�����û�����
		System.out.println(Integer.parseInt(id));
		Users users=new Users(Integer.parseInt(id),nickname,Integer.parseInt(age),gender,email,phone,new Date(),remark);
		//�ύ����
		userDAO.updataUsers(users);
		//�鿴���º���û�����
		response.sendRedirect("detail?id="+users.getId());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

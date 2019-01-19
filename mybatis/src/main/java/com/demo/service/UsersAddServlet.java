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

/**
 * Servlet implementation class UsersAddServlet
 */
@WebServlet("/addusers")
public class UsersAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      private UserDAO userDAO=new UserDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsersAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//��ȡҪ��ӵ��û�����
		String username=request.getParameter("username");
		String userpass=request.getParameter("userpass");
		String nickname=request.getParameter("nickname");
		String age=request.getParameter("age");
		String gender=request.getParameter("gender");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		//�����û����ݴ���һ���û�����
		Users user=new Users(username,userpass,nickname,Integer.parseInt(age),gender,phone,email,new Date(),new Date(),new Date(),0);
		//���û���������ӵ����ݿ���
		user=userDAO.addUser(user);
		//�鿴���������û�����
		response.sendRedirect("detail?id="+user.getId());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

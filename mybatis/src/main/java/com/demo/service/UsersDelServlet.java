package com.demo.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.dao.UserDAO;
import com.demo.entity.Users;

@WebServlet("/deluser")
public class UsersDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO=new UserDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsersDelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取参数
		String id=request.getParameter("id");
		String type=request.getParameter("type");
		
		//执行删除或者锁定操作
		if ("lock".equals(type)) {
			//执行锁定操作：update操作
			Users users=new Users();
			users.setId(Integer.parseInt(id));
			users.setUserStatus(1);
			
			userDAO.updataUsers(users);
		}else if ("del".equals(type)) {
			//执行删除操作：delete操作
			userDAO.deleteUsers(Integer.parseInt(id));
		}else if ("unlock".equals(type)) {
			//执行解锁操作：update操作
			Users users=new Users();
			users.setId(Integer.parseInt(id));
			users.setUserStatus(0);
			
			userDAO.updataUsers(users);
		}
		//跳转到首页
		response.sendRedirect("index");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

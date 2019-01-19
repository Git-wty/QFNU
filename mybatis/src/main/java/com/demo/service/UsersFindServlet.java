package com.demo.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.dao.UserDAO;
import com.demo.entity.Users;

@WebServlet("/index")
public class UsersFindServlet extends HttpServlet {	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO=new UserDAO();

    public UsersFindServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Users> list=userDAO.findAll();
		request.setAttribute("usersList", list);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
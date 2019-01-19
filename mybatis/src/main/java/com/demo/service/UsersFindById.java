package com.demo.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.dao.UserDAO;
import com.demo.entity.Users;
import com.sun.istack.internal.logging.Logger;

@WebServlet("/detail")
public class UsersFindById extends HttpServlet {
//	������Ӧ����־��¼����ͨ����ͬ���������־�ļ�¼��DEBUG\WARN\INFO\LOG��
	private Logger logger=Logger.getLogger(UsersFindById.class);
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO=new UserDAO();

    public UsersFindById() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id=request.getParameter("id");
		logger.info("��ȡ����ѯ����id---"+id);
		Users user=userDAO.findById(Integer.parseInt(id));
		request.setAttribute("user", user);
		logger.info("��ѯ��ϣ���ѯ�������ݲ���---"+user);
		request.getRequestDispatcher("detail.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

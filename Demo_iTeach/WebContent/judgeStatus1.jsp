<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	HttpSession session2=request.getSession();
	String username=(String)session.getAttribute("username");
	
	if (username == null) {
		response.sendRedirect(request.getContextPath() + "/entry.html");
	}else{
		String status=(String)session.getAttribute("status");
		if(status.equals("student")){
			//如果类别是学生，跳转到学生对应的智能课堂管理页面
			response.sendRedirect("iTeach-live-stu.html");
		}else if(status.equals("teacher")){
			//如果类别是老师，跳转到老师对应的智能课堂管理页面
			response.sendRedirect("iTeach-live-room.html");
		}else{
			//如果类别什么都不是，这是不可能的
			response.sendRedirect("");
		}
	}
	
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<script type="text/javascript" src="js/jquery.min.js" ></script>
		<script type="text/javascript" src="js/bootstrap.min.js" ></script>
	</head>
	<body>
		<div class="container">
			<div class="row">
				<div class="page-header">
					<h1>一个栗子<small>采用mybatis框架</small></h1>
				</div>
			</div>
			<div class="row">
				<div class="jumbotron">
					<h1>Hello</h1>
					<p>...</p>
					<p><a class="btn btn-primary btn-lg" href="addusers.jsp">新建用户</a></p>
				</div>
			</div>
			<div class="row">
				<table class="table table-hover table-striped">
					<tr>
						<td>用户编号</td>
						<td>登录账号</td>
						<td>用户昵称</td>
						<!--<td>用户年龄</td>
						<td>用户性别</td>-->
						<td>邮箱</td>
						<td>联系方式</td>
						<td>账号创建时间</td>
						<!--<td>最后修改时间</td>
						<td>最后登录时间</td>-->
						<td>用户状态</td>
						<td>操作</td>
					</tr>
					<c:forEach var="user" items="${usersList}">
					<tr>
						<td>${user.id}</td>
						<td>${user.name}</td>
						<td>${user.nickname}</td>
						<td>${user.email}</td>
						<td>${user.phone}</td>
						<td>
							<fmt:formatDate value="${user.createTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
						</td>
						<c:if test="${user.userStatus == 0}">
                    		<td>正常</td>
                		</c:if>
                		<c:if test="${user.userStatus == 1}">
                    		<td>锁定</td>
                		</c:if>
                		<c:if test="${user.userStatus == 2}">
                    		<td>删除</td>
                		</c:if>
						<td>
							<a href="${pageContext.request.contextPath}/detail?id=${user.id}">查看</a>
							<c:if test="${user.userStatus==1 }">
								<a href="${pageContext.request.contextPath}/deluser?id=${user.id}&type=unlock">解锁</a>
							</c:if>
							<c:if test="${user.userStatus==0 }">
								<a href="${pageContext.request.contextPath}/deluser?id=${user.id}&type=lock">锁定</a>
							</c:if>
							<a href="${pageContext.request.contextPath}/deluser?id=${user.id}&type=del">删除</a>
						</td>
						
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</body>
</html>

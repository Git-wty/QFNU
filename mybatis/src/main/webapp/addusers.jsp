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
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="page-header">
				<h1>
					一个栗子<small>采用mybatis框架</small>
				</h1>
			</div>
		</div>
		<div class="row">
			<div class="jumbotron">
				<h1>Hello</h1>
				<p>...</p>
				<p>
					<a class="btn btn-primary btn-lg" href="#">Learn more</a>
				</p>
			</div>
		</div>
		<c:set var="user" value="${user}"></c:set>
		<div class="row">
			<form class="form-horizontal" action="${pageContext.request.contextPath}/addusers">
				<div class="form-group">
					<label class="col-sm-2 control-label">用户账号</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="username" placeholder="请输入用户名">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">登录密码</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="userpass" placeholder="请输入密码">
					</div>
				</div>
				<div class="form-group">
					<label for="nickname" class="col-sm-2 control-label">昵称</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="nickname" placeholder="请输入昵称">
					</div>
				</div>
				<div class="form-group">
					<label for="age" class="col-sm-2 control-label">年龄</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="age" name="age" placeholder="请输入年龄">
					</div>
				</div>
				<div class="form-group">
					<label for="gender" class="col-sm-2 control-label">性别</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="gender" name="gender" placeholder="请输入性别">
					</div>
				</div>
				<div class="form-group">
					<label for="phone" class="col-sm-2 control-label">联系方式</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="phone" name="phone" placeholder="请输入联系方式">
					</div>
				</div>
				<div class="form-group">
					<label for="email" class="col-sm-2 control-label">邮箱</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="email" name="email" placeholder="请输入邮箱">
					</div>
				</div>
				<input type="submit"/>
			</form>
		</div>
	</div>
</body>
</html>
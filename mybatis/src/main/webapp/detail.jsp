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
			<form class="form-horizontal" action="updateusers">
			<input type="hidden" name="id" value="${user.id}">
				<div class="form-group">
					<label class="col-sm-2 control-label">用户账号</label>
					<div class="col-sm-10">
						<p class="form-control-static">${user.name}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">登录密码</label>
					<div class="col-sm-10">
						<p class="form-control-static">${user.userpass}</p>
					</div>
				</div>
				<div class="form-group">
					<label for="nickname" class="col-sm-2 control-label">昵称</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="nickname"
							placeholder="请输入昵称" value="${user.nickname }">
					</div>
				</div>
				<div class="form-group">
					<label for="age" class="col-sm-2 control-label">年龄</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="age" name="age"
							value="${user.age}" placeholder="请输入年龄">
					</div>
				</div>
				<div class="form-group">
					<label for="gender" class="col-sm-2 control-label">性别</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="gender" name="gender"
							value="${user.gender}" placeholder="请输入性别">
					</div>
				</div>
				<div class="form-group">
					<label for="phone" class="col-sm-2 control-label">联系方式</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="phone" name="phone"
							value="${user.phone}" placeholder="请输入联系方式">
					</div>
				</div>
				<div class="form-group">
					<label for="email" class="col-sm-2 control-label">邮箱</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="email" name="email"
							value="${user.email}" placeholder="请输入邮箱">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">账号创建时间</label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<fmt:formatDate value="${user.createTime}" pattern="yyyy-MM-dd"></fmt:formatDate>
						</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">最后修改时间</label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<fmt:formatDate value="${user.updateTime}" pattern="yyyy-MM-dd"></fmt:formatDate>
						</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">最后登录时间</label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<fmt:formatDate value="${user.lastLogin}" pattern="yyyy-MM-dd"></fmt:formatDate>
						</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">用户状态</label>
					<div class="col-sm-10">
						<c:if test="${user.userStatus == 0}">
                            <p class="form-control-static">正常</p>
                        </c:if>
                        <c:if test="${user.userStatus == 1}">
                            <p class="form-control-static">锁定</p>
                        </c:if>
                        <c:if test="${user.userStatus == 2}">
                            <p class="form-control-static">删除</p>
                        </c:if>
					</div>
				</div>
				<div class="form-group">
					<label for="remark" class="col-sm-2 control-label">备注</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="remark" value="${user.remark }">
					</div>
				</div>
						<input type="submit" value="更改信息" />
					
				
			</form>
		</div>
		
		<div class="row">
        <table class="table table-striped">
            <tr>
                <th>地址编号</th>
                <th>国家</th>
                <th>省</th>
                <th>市</th>
                <th>县</th>
                <th>街道</th>
                <th>详细地址</th>
                <th>是否默认</th>
            </tr>
            <c:forEach var="addr" items="${user.addresses}">
                <tr>
                    <td>${addr.id}</td>
                    <td>${addr.nation}</td>
                    <td>${addr.province}</td>
                    <td>${addr.city}</td>
                    <td>${addr.country}</td>
                    <td>${addr.street}</td>
                    <td>${addr.remark}</td>
                    <c:if test="${addr.defaultAddr == true}">
                        <td>默认地址</td>
                    </c:if>
                    <c:if test="${addr.defaultAddr == false}">
                        <td>-----</td>
                    </c:if>
                </tr>
            </c:forEach>
        </table>
    </div>
	</div>
</body>
</html>
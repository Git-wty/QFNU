<%@page import="javafx.beans.property.SetProperty"%>
<%@page import="com.impl.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.core.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.model.*"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<title>iTeach</title>
<!--引入bootstrap样式文件-->
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<!--该页面基本css代码-->
<link href="css/main.css" rel="stylesheet" />
<!--layui框架引入-->
<link href="layui/css/layui.css" rel="stylesheet" />
<!--内嵌CSS代码-->

<style>
body {
	background-color: #FFFCF4;
}

.class-main {
	width: 1300px;
	min-height: 800px;
	margin: 0 auto;
	padding-left: 20px;
}

.class-main:after {
	content: ".";
	display: block;
	height: 0;
	clear: both;
	visibility: hidden;
}

.class-main>.class-function {
	width: 250px;
	height: 800px;
	float: left;
	background-color: #393D49;
}

.class-main>.class-content {
	width: 1010px;
	min-height: 800px;
	float: left;
}

.d1 {
	width: 550px;
	margin: 50px 0 0 260px;
	line-height: 1.4;
	font-size: 14px;
	color: #666;
}

.selection {
	padding-top: 30px;
	background: white;
	margin-bottom: 30px;
	word-wrap: break-word;
	word-break: break-all;
}

.judgement {
	padding-top: 20px;
	background: white;
	margin-bottom: 30px;
	word-wrap: break-word;
	word-break: break-all;
}

.simple {
	padding-top: 5px;
	background: white;
	margin-bottom: 30px;
	word-wrap: break-word;
	word-break: break-all;
}

.d1 span {
	margin-left: 80px;
}

.d1 p {
	margin-left: 80px;
	padding-bottom: 10px;
}
}
</style>

</head>
<%
	request.setCharacterEncoding("utf-8");
	HttpSession session2 = request.getSession();
	String username = (String) session2.getAttribute("username");
	String name = (String) session2.getAttribute("name");
%>
<body>
	<!--顶部导航栏-->
	<header class="container" style="width: 100%;">
		<!--顶部共分为两行：1.logo、登录注册、搜索框、APP下载 2.导航栏区域-->
		<!--第一行区域：logo、登录注册、搜索框、APP下载-->
		<div class="header-line1">
			<!--Logo-->
			<img src="img/logo1.png" class="img-responsive" />
			<!--登录注册-->
			<div class="header-user">
				<a href="iTeach-myself.jsp"><%=name%></a>
			</div>

			<!--APP二维码下载 手机端不显示-->
			<div class="hidden-xs header-app"
				style="float: right; line-height: 72px; margin-right: 17px;">
				下载APP</div>

			<!--内容搜索框 手机端不显示-->
			<form class="navbar-form  select hidden-xs " role="search">
				<div class="form-group">
					<input type="text" id="search_text" class="form-control"
						placeholder="输入你想要搜索的课程">
				</div>
				<input id="search_button" type="button" class="btn btn-default"
					value="搜索">
			</form>
		</div>

		<!--第二行：导航栏,行内设置样式取消layui内样式-->
		<nav style="width: 1260px; margin: 0 auto;">
			<!--导航栏ul列表，使用layui框架-->
			<ul class="layui-nav">
				<!--首页部分-->
				<li class="layui-nav-item"><a href="index.jsp">首页</a></li>
				<!--智慧课堂部分，a标签用来创建下拉二级菜单响应，dl和dd标签用来创建下拉二级菜单-->
				<li class="layui-nav-item"><a href="judgeStatus.jsp">智能课堂</a></li>
				<!--名师直播部分-->
				<li class="layui-nav-item"><a href="judgeStatus1.jsp">名师直播</a></li>
				<li class="layui-nav-item"><a href="iTeach-topic-room.jsp">话题讨论</a></li>
				<!--爱学社区模块-->
				<li class="layui-nav-item"><a href="iTeach-community.jsp">爱学社区</a></li>
			</ul>
		</nav>
	</header>

	<!--智能课堂管理模块-->
	<section class="class-main">
		<!--左边功能导航栏部分：智能课堂部分及后台管理-->
		<div class="class-function">
			<ul class="layui-nav layui-nav-tree" lay-filter="test"
				style="width: 250px;">
				<li class="layui-nav-item layui-nav-itemed"><a
					href="javascript:;">我的课堂</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="./wisdomClass/teacherShowClass.jsp">课堂管理</a>
						</dd>
						<dd>
							<a href="./wisdomClass/teacherTaskShowClass.jsp">课堂作业</a>
						</dd>
						<dd>
							<a href="./wisdomClass/teacherCommentShowClass.jsp">课堂评教</a>
						</dd>
						<dd>
							<a href="./wisdomClass/teacherCoursewareShowClass.jsp">课件管理</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item"><a href="TheTest_teacher.jsp">在线考试</a>
					</dl></li>
				<li class="layui-nav-item"><a href="iTeach-live-room.html">名师直播</a></li>
				<li class="layui-nav-item"><a href="iTeach-myself.jsp">个人信息</a></li>
			</ul>
		</div>

		<!--这个模块用来插入智能课堂其余部分代码-->
		<div class="class-content">
			<%
	String paper_id=request.getParameter("paper_id");
	%>
			<sql:setDataSource var="selection" driver="com.mysql.jdbc.Driver"
				url="jdbc:mysql://154.8.194.176:3306/iteach?userUnicode=true"
				user="iteach" password="iteach123" />
			<sql:query var="select" dataSource="${selection}">
		select * from selection where paper_id='<%=paper_id %>';
		</sql:query>

			<div id="d1" class="d1">
				<c:forEach var="row" items="${select.rows }">
					<div class="selection">

						<span><c:out value="${row.title_id }" />.选择题名称:<c:out
								value="${row.title}" /></span><br />
						<p>
							A.
							<c:out value="${row.a }" />
						</p>
						<p>
							B.
							<c:out value="${row.b }" />
						</p>
						<p>
							C.
							<c:out value="${row.c }" />
						</p>
						<p>
							D.
							<c:out value="${row.d }" />
						</p>
						<p>
							选择题答案：
							<c:out value="${row.answer}" />
						</p>

					</div>
				</c:forEach>

				<sql:setDataSource var="question" driver="com.mysql.jdbc.Driver"
					url="jdbc:mysql://154.8.194.176:3306/iteach?userUnicode=true"
					user="iteach" password="iteach123" />
				<sql:query var="result" dataSource="${question}">
				select * from judge where paper_id='<%=paper_id %>';
				</sql:query>
				<c:forEach var="row" items="${result.rows}">
					<div class="judgement">
						<span><c:out value="${row.title_id }" />.判断题名称:<c:out
								value="${row.title_name}" /></span><br />
						<p>
							判断题答案：
							<c:out value="${row.answer}" />
						</p>
					</div>
				</c:forEach>

				<sql:setDataSource var="simple" driver="com.mysql.jdbc.Driver"
					url="jdbc:mysql://154.8.194.176:3306/iteach?userUnicode=true"
					user="iteach" password="iteach123" />
				<sql:query var="simp" dataSource="${simple }">
		select * from simple where paper_id='<%=paper_id %>';
		</sql:query>
				<c:forEach var="row" items="${simp.rows }">
					<div class="simple">
						<span><c:out value="${row.title_id }" />.简答题名称:<c:out
								value="${row.title }" /></span><br />
					</div>
				</c:forEach>
			</div>
	</section>

	<!--底部信息栏 当在手机屏幕浏览时不会显示-->
	<footer>
		<!--盛放底部信息内容的容器-->
		<section class="footer-content">
			<!--logo及介绍-->
			<div style="float: left; width: 500px; padding-top: 10px;">
				<img src="img/logo_bottom.png" style="display: block;" />
				<p style="margin-top: 10px;">iTeach由以梦为码团队建立，旨在为高校师生提供交流和教学辅助平台。</p>
			</div>

			<!--三个网站信息模块-->
			<div>
				<span>关注我们</span>
				<ul>
					<li>QQ</li>
					<li>微信</li>
					<li>微博</li>
					<li>公众号</li>
				</ul>
			</div>

			<div>
				<span>友情链接</span>
				<ul>
					<li>网易卡搭</li>
					<li>搜狐教育</li>
					<li>hao123</li>
					<li>云栖社区</li>
				</ul>
			</div>
			<div>
				<span>关于我们</span>
				<ul>
					<li>关于我们</li>
					<li>联系我们</li>
					<li>意见反馈</li>
					<li>常见问题</li>
				</ul>
			</div>

		</section>
		<!--版权信息-->
		<div style="height: 20px; text-align: center; margin-bottom: 5px;">©Copyright
			iTeach</div>
	</footer>

	<!--js代码统一放置在最底部使用，包括基础的bootstrap框架及layui框架-->
	<script src="https://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
	<script
		src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="layui/layui.js"></script>
	<script>
		//layui框架轮播必须引入模块element,无需修改		
		layui.use('element', function() {
			var element = layui.element;
			//一些事件监听
			element.on('tab(demo)', function(data) {
				console.log(data);
			});
		});
	</script>
	<script type="text/javascript">
	
			$('#search_button').on('click',function(){
				window.open("https://www.baidu.com/s?wd=" + $('#search_text').val());
			});
		</script>
</body>

</html>
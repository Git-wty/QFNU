<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>iTeach</title>
<!--引入bootstrap样式文件-->
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<!--该页面基本css代码-->
<link href="../css/main.css" rel="stylesheet" />
<!--layui框架引入-->
<link href="../layui/css/layui.css" rel="stylesheet" />
<!--内嵌CSS代码-->

<style>
body {
	background-color: #FFFCF4;
}

.class-main {
	width: 1300px;
	min-height: 800px;
	margin: 0 auto;
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

.teacher_comment {
	text-align: center;
	margin-top: 40px;
}

.teacher_comment>ul>li {
	margin-top: 10px;
	font-size: 22px;
}

/* 响应式 */
@media screen and (min-width: 768px) {
	.class-main {
		padding-left: 20px;
	}
	.class-main>.class-content {
		width: 1010px;
		min-height: 800px;
		float: left;
		background-color: #FFFCF4;
	}
	.class-topic {
		display: none;
	}
}

@media screen and (max-width: 767px) {
	.layui-form {
		padding-bottom: 23.33px;
	}
	header {
		display: none;
	}
	footer {
		display: none;
	}
	.class-function {
		display: none;
	}
	.class-main {
		width: 100%;
	}
}
/* 响应式 */
</style>

</head>

<%
	request.setCharacterEncoding("utf-8");
	HttpSession session2 = request.getSession();
	String username = (String) session2.getAttribute("username");
	String teacher_name=(String)session2.getAttribute("name");
	System.out.print(teacher_name);
%>
<body>
	<!--顶部导航栏-->
	<header class="container" style="width: 100%;">
		<!--顶部共分为两行：1.logo、登录注册、搜索框、APP下载 2.导航栏区域-->
		<!--第一行区域：logo、登录注册、搜索框、APP下载-->
		<div class="header-line1">
			<!--Logo-->
			<img src="../img/logo1.png" class="img-responsive" />
			<!--登录注册-->
			<div class="header-user">
				<a href="../iTeach-myself.jsp"><%=teacher_name%></a>
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
				<li class="layui-nav-item"><a href="../index.jsp">首页</a></li>
				<!--智慧课堂部分，a标签用来创建下拉二级菜单响应，dl和dd标签用来创建下拉二级菜单-->
				<li class="layui-nav-item"><a href="teacherShowClass.jsp">智能课堂</a></li>
				<!--名师直播部分-->
				<li class="layui-nav-item"><a href="../iTeach-live-room.html">名师直播</a></li>
				<li class="layui-nav-item"><a href="../iTeach-topic-room.jsp">话题讨论</a></li>
				<!--爱学社区模块-->
				<li class="layui-nav-item"><a href="../iTeach-community.jsp">爱学社区</a></li>
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
							<a href="javaScript:;" id="show_class">课堂管理</a>
						</dd>
						<dd>
							<a href="javaScript:;" id="task_show_class">课堂作业</a>
						</dd>

						<dd>
							<a href="javaScript:;" id="comment_show_class">课堂评教</a>
						</dd>
						<dd>
							<a href="teacherCoursewareShowClass.jsp">课件管理</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item"><a href="../TheTest_teacher.jsp">在线考试</a>
					</dl></li>
				<li class="layui-nav-item"><a href="../iTeach-live-room.html">名师直播</a>
				</li>
				<li class="layui-nav-item"><a href="../iTeach-myself.jsp">个人信息</a>
				</li>
			</ul>
		</div>

		<!--这个模块用来插入智能课堂其余部分代码-->
		<div class="class-content">
			<!-- 移动端适配 -->

			<nav class="navbar navbar-default class-topic" role="navigation">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#example-navbar-collapse">
							<span class="sr-only">切换导航</span> <span class="icon-bar"></span>
							<span class="icon-bar"></span> <span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="teacherShowClass.jsp">智能课堂</a>
					</div>
					<div class="collapse navbar-collapse" id="example-navbar-collapse">
						<ul class="nav navbar-nav">
							<li><a href="teacherShowClass.jsp">课堂管理</a></li>
							<li><a href="teacherTaskShowClass.jsp">课堂作业</a></li>
							<li><a href="teacherCommentShowClass.jsp">课堂评教</a></li>
						</ul>
					</div>
				</div>
			</nav>

			<!-- 移动端适配 -->


			<fieldset class="layui-elem-field layui-field-title"
				style="margin-top: 30px;">
				<legend> 点击课堂查看学生评论</legend>
			</fieldset>


			<div class="layui-form">
				<table class="layui-table">
					<colgroup>
						<col width="150">
						<col width="150">
						<col width="200">
						<col>
					</colgroup>
					<thead>
						<tr>
							<th><div class="table-title">课堂名称</div></th>
							<th><div class="table-title">课堂编号</div></th>
						</tr>
					</thead>
					<tbody>

						<sql:setDataSource var="teacher_class"
							driver="com.mysql.jdbc.Driver"
							url="jdbc:mysql://154.8.194.176:3306/iteach?useUnicode=true"
							user="iteach" password="iteach123" />

						<sql:query dataSource="${teacher_class}" var="result">
	 					SELECT * from class WHERE teacher_name='<%=teacher_name%>';
			 	</sql:query>

						<c:forEach var="row" items="${result.rows}">

							<tr>
								<td><a
									href="teacherShowComment.jsp?class_name=<c:out value="${row.class_name}"/>&class_id=<c:out value="${row.class_id}"/>"><c:out
											value="${row.class_name}" /></a></td>
								<td><a
									href="teacherShowComment.jsp?class_name=<c:out value="${row.class_name}"/>&class_id=<c:out value="${row.class_id}"/>"><c:out
											value="${row.class_id}" /></a></td>
							</tr>

						</c:forEach>


					</tbody>
				</table>
			</div>
		</div>

	</section>

	<!--底部信息栏 当在手机屏幕浏览时不会显示-->
	<footer>

		<!--盛放底部信息内容的容器-->
		<section class="footer-content">
			<!--logo及介绍-->
			<div style="float: left; width: 500px; padding-top: 10px;">
				<img src="../img/logo_bottom.png" style="display: block;" />
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

	<!-- 移动端底部 -->

	<div class="main_nav_bottom">
		<nav
			class="navbar navbar-default navbar-fixed-bottom hidden-lg hidden-md hidden-sm"
			style="background-color: #333;">
			<div class="container" align="center">
				<style>
</style>
				<ul class="nav nav-tabs nav-tabs-justified ">
					<div class="row" align="center">
						<div class="hidden-lg hidden-md hidden-sm col-xs-3" align="center">
							<li><a href="../index.jsp"><img src="../img/首页底部.png"
									style="width: 30px; height: 20px; margin-top: 5px;">
									<p
										style="margin-bottom: 0px; color: whitesmoke; font-size: 0.8em; margin-top: 3px;">首页</p>
							</a></li>
						</div>
						<div class="hidden-lg hidden-md hidden-sm col-xs-3" align="center">
							<li><a href="teacherShowClass.jsp"><img
									src="../img/智能课堂底部.png"
									style="width: 30px; height: 20px; margin-top: 5px;">
									<p
										style="margin-bottom: 0px; color: whitesmoke; font-size: 0.8em; margin-top: 3px;">智能课堂</p>
							</a></li>
						</div>
						<div class="hidden-lg hidden-md hidden-sm col-xs-3" align="center">
							<li><a href="../iTeach-community.jsp"><img
									src="../img/爱学社区底部.png"
									style="width: 30px; height: 20px; margin-top: 5px;">
									<p
										style="margin-bottom: 0px; color: whitesmoke; font-size: 0.8em; margin-top: 3px;">爱学社区</p>
							</a></li>
						</div>
						<div class="hidden-lg hidden-md hidden-sm col-xs-3" align="center">
							<li><a href="../iTeach-myself.jsp"><img
									src="../img/个人中心底部2.png"
									style="width: 30px; height: 20px; margin-top: 5px;">
									<p
										style="margin-bottom: 0px; color: whitesmoke; font-size: 0.8em; margin-top: 3px;">个人中心</p>
							</a></li>
						</div>
					</div>
				</ul>
			</div>
		</nav>
	</div>
	<!-- 移动端底部 -->
	<!--js代码统一放置在最底部使用，包括基础的bootstrap框架及layui框架-->
	<script src="https://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
	<script
		src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../layui/layui.js"></script>
	<script>
		//layui框架轮播必须引入模块element,无需修改		
		layui.use('element', function() {
			var element = layui.element;
			//一些事件监听
			element.on('tab(demo)', function(data) {
				console.log(data);
			});
		});
		  $('#show_class').on('click', function(){
			  window.location.replace("teacherShowClass.jsp");
		  });
		  
		  $('#task_show_class').on('click', function(){
			  window.location.replace("teacherTaskShowClass.jsp");
		  });
		  
		  $('#comment_show_class').on('click', function(){
			  window.location.replace("teacherCommentShowClass.jsp");
		  });
		  
	</script>

	<script type="text/javascript">
	
			$('#search_button').on('click',function(){
				window.open("https://www.baidu.com/s?wd=" + $('#search_text').val());
			});
		</script>
</body>

</html>
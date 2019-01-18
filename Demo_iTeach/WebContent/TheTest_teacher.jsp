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
<link rel="stylesheet"
	href="font-awesome-4.7.0/css/font-awesome.min.css">
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
	font-family: "microsoft yahei";
	margin: 0;
	font-size: 12px;
	color: #333333;
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
	background-color: #FFFCF4;
}

.main_wrap {
	position: relative;
	margin: 60px 70px 0 200px;
}

.create_add {
	margin-left: 100px;
}

.create_add a {
	text-decoration: none
}

.create_add a:visited {
	color: white;
}

.create_add a:hover {
	color: #808080;
}

.create_btn {
	font-size: 16px;
	width: 120px;
	height: 36px;
	margin-right: 10px;
	margin-left: 10px;
	line-height: 2;
	border-radius: 100px;
	border-color: #fa911e;
	background-color: #fa911e;
	color: #fff;
	display: inline-block;
	text-decoration: none;
	padding: 3px 0 0 22px;
}

.create_search {
	position: relative;
	float: left;
}

.serarchbox {
	width: 300px;
	height: 36px;
	line-height: 1.6;
	padding: 8px 0 8px 16px;
	font-size: 12px;
	color: #999;
	border-radius: 100px;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

.list {
	margin-right: 82px;
}

.plane {
	position: absolute;
	top: 12px;
	right: 15px;
}

.folder {
	position: relative;
	margin: 20px 0;
	padding-top: 14px;
	border-top: 2px solidposition: relative;
	margin: 20px 0;
	padding-top: 14px;
	border-top: 2px solid #F5F9DE;;
}

.items {
	z-index: 100;
	position: relative;
	margin-bottom: 20px;
	border-radius: 8px;
	border: 2px solid #e1ebf5;
}

.items_header {
	text-align: center;
	padding: 0 30px;
	font-size: 16px;
	height: 48px;
	line-height: 48px;
	padding: 0 20px;
	border-top-left-radius: 6px;
	border-top-right-radius: 6px;
	background-color: #e6f0fa;
	padding: 0 30px;
}

.items_header span {
	margin-left: 30px;
}

.items_body {
	padding: 0 30px;
	height: 58px;
	margin: 0px;
	border: none;
	box-sizing: border-box;
}

.items_body a {
	text-decoration: none;
	color: #808080;
	margin: 0 130px 0 80px;
}

.items_body a:hover {
	color: #30a6f5;
}

.items_body a i {
	margin: 10px 4px 0 10px;
}

.items_body a span {
	font-size: 16px;
}

.record {
	width: 500px;
	margin: 0 auto;
	margin-top: 70px;
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
			<div class="record">
				<p style="text-align: center; font-size: 20px;">注意事项</p>
				<p style="text-align: center;">1.点击考试设计可以看到该试卷的题型和答案</p>
				<p style="text-align: center;">2.点击做题情况可以看到做该试卷学生的答题情况</p>
			</div>

			<div class="main_wrap">
				<form action="paperServlet">
					<input name="teacher_id" hidden="hidden" />
					<div class="create_add">
						<a class="create_btn"> <i class="fa fa-plus fa-lg"></i> <input
							type="submit" value="创建问卷"
							style="border: none; background: none;"
							onclick="return notEmpty();" />
						</a>

						<div class="create_search">
							<input name="paper_name" type="text" class="serarchbox"
								id="paper_name" placeholder="请输入您要创建的试卷名称..." /> <i
								class="plane fa fa-paper-plane-o fa-lg"></i>
						</div>

						<sql:setDataSource var="question" driver="com.mysql.jdbc.Driver"
							url="jdbc:mysql://154.8.194.176:3306/iteach?useUnicode=true"
							user="iteach" password="iteach123" />
						<sql:query dataSource="${question}" var="result">
					SELECT * From paper WHERE  teacher_id='<%=username%>';
				</sql:query>

					</div>
				</form>


				<div class="folder"></div>

				<div class="list">
					<c:forEach var="row" items="${result.rows}">
						<div class="items">
							<div class="items_header">
								<span>试卷编号：<c:out value="${row.paper_id}" /></span> <span>试卷名称：<c:out
										value="${row.paper_name}" /></span>
							</div>

							<div class="items_body">
								<a
									href="ShowPaper.jsp?paper_id=<c:out value="${row.paper_id}"/>">
									<i class="fa fa-file-text-o fa-3x"></i> <span>考试设计</span>
								</a> <a
									href="studentPaper.jsp?paper_id=<c:out value="${row.paper_id}"/>">
									<i class="fa fa-bar-chart fa-3x"></i> <span>做题情况</span>
								</a>
							</div>
						</div>
					</c:forEach>
				</div>
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
		
		function notEmpty() {
			var paper_name=document.getElementById("paper_name").value;
			if(paper_name=="") {
				alert("试卷名称不能为空！");
				return false;
			} else {
				return true;
			}
		}
	</script>
</body>

</html>
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
<link href="css/main.css" rel="stylesheet" />
<!--layui框架引入-->
<link href="layui/css/layui.css" rel="stylesheet" />
<!--内嵌CSS代码-->

<style>
a {
	text-decoration: none;
}

body {
	background-color: #FFFCF4;
}

.class-main {
	width: 1300px;
	margin: 0 auto;
}

.class-main:after {
	content: ".";
	display: block;
	height: 0;
	clear: both;
	visibility: hidden;
}

.community-sort {
	width: 250px;
	float: left;
	padding-bottom: 20px;
	background-color: #1E9FFF;
	margin-top: 5px;
	padding-top: 10px;
	color: rgb(255, 255, 255);
}

.community-sort>ul {
	
}

.community-sort>ul>li {
	width: 250px;
	text-align: center;
	height: 30px;
	font-size: 20px;
	line-height: 30px;
	margin-top: 20px;
}

.community-sort>ul>li>a {
	color: rgb(255, 255, 255);
}

.community-list {
	margin-left: 5px;
	margin-right: 5px;
	float: left;
	min-height: 800px;
}

.community-control {
	width: 300px;
	height: 600px;
	float: left;
}

.community-control-button {
	width: 300px;
	height: 90px;
	border-radius: 10px;
	background-color: #1E9FFF;
	margin-top: 10px;
	line-height: 90px;
	font-size: 40px;
	text-align: center;
	color: rgb(255, 255, 255);
}

@media screen and (min-width: 768px) {
	.class-main {
		padding-left: 20px;
	}
	.community-question {
		width: 700px;
		border: 3px solid #1E9FFF;
		margin-top: 5px;
		padding-top: 20px;
		padding-left: 20px;
	}
	.class-topic {
		display: none;
	}
	.blank {
		display: none;
	}
}

@media screen and (max-width: 767px) {
	header {
		display: none;
	}
	footer {
		display: none;
	}
	.community-sort {
		display: none;
	}
	.community-control {
		display: none;
	}
	.class-main {
		width: 100%;
	}
	.community-question {
		width: 100%;
		border: 3px solid #1E9FFF;
		padding-top: 20px;
		margin-top: 2px;
	}
	h2 {
		font-size: 1.6em;
		font-weight: 300;
	}
	.community-list {
		margin-left: 0px;
		margin-right: 0px;
	}
	.blank {
		clear: both;
		overflow: hidden;
		display: block;
		overflow: hidden;
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
				<%
					if (username == null) {
				%>
				<a href="entry.html">登录</a> / <a href="register.html">注册</a>
				<%
					} else {
				%>
				<a href="judgeStatus2.jsp"><%=name%></a>
				<%
					}
				%>
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
		<div class="community-sort">
			<p style="text-align: center; font-size: 22px; font-weight: bold;">话题分类</p>
			<ul>
				<li><a href="iTeach-community-sort.jsp?community_style=大学生活">大学生活</a></li>
				<li><a href="iTeach-community-sort.jsp?community_style=计算机">计算机</a></li>
				<li><a href="iTeach-community-sort.jsp?community_style=英语四六级">英语四六级</a></li>
				<li><a href="iTeach-community-sort.jsp?community_style=考研">考研</a></li>
				<li><a href="iTeach-community-sort.jsp?community_style=思政课">思政课</a></li>
				<li><a href="iTeach-community-sort.jsp?community_style=公共课">公选课</a></li>
				<li><a href="iTeach-community-sort.jsp?community_style=其他">其他</a></li>
			</ul>
		</div>
		<div class="community-list">
			<nav class="navbar navbar-default class-topic" role="navigation"
				style="margin-bottom: 0px;">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#example-navbar-collapse">
							<span class="sr-only">切换导航</span> <span class="icon-bar"></span>
							<span class="icon-bar"></span> <span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="#">爱学社区</a>
					</div>
					<div class="collapse navbar-collapse" id="example-navbar-collapse">
						<ul class="nav navbar-nav">
							<li><a href="judgeStatus5.jsp">我要提问</a></li>
							<li><a href="judgeStatus6.jsp">我的问题</a></li>
						</ul>
					</div>
				</div>
			</nav>

			<sql:setDataSource var="question" driver="com.mysql.jdbc.Driver"
				url="jdbc:mysql://154.8.194.176:3306/iteach?useUnicode=true"
				user="iteach" password="iteach123" />

			<sql:query dataSource="${question}" var="result">
	 			SELECT * from question;
			 </sql:query>

			<c:forEach var="row" items="${result.rows}">
				<div class="community-question">
					<h2>
						<a
							href="question-view.jsp?question_id=<c:out value="${row.question_id}"/>"><c:out
								value="${row.question_name}" /></a>
					</h2>
					<div style="margin-top: 10px; height: 90px; max-width: 650px;">
						<c:out value="${row.question_introduce}" />
					</div>
					<div style="margin-top: 10px; height: 25px; width: 200px;">
						提问者:
						<c:out value="${row.question_user}" />
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="community-control">
			<div
				style="width: 300px; height: 200px; font-size: 17px; font-family: '黑体'; font-weight: bold; margin-top: 10px;">
				<img src="img/社区.png" width="298px" />
				<p style="margin-top: 20px;">打造属于大学生的学科分类答疑平台！</p>
				<p style="margin-top: 20px; text-align: center;">无论专业，无论学校！</p>
				<p style="margin-top: 20px; text-align: center;">答题悬赏功能即将上线</p>
			</div>
			<a href="Insert_question.jsp"><div
					class="community-control-button">我要提问</div></a> <a
				href="iTeach-community-my.jsp"><div
					class="community-control-button">我的问题</div></a>
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
	<span class="blank" style="height: 50px;"></span>
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
							<li><a href="index.jsp"><img src="img/首页底部.png"
									style="width: 30px; height: 20px; margin-top: 5px;">
									<p
										style="margin-bottom: 0px; color: whitesmoke; font-size: 0.8em; margin-top: 3px;">首页</p>
							</a></li>
						</div>
						<div class="hidden-lg hidden-md hidden-sm col-xs-3" align="center">
							<li><a href="judgeStatus4.jsp"><img src="img/智能课堂底部.png"
									style="width: 30px; height: 20px; margin-top: 5px;">
									<p
										style="margin-bottom: 0px; color: whitesmoke; font-size: 0.8em; margin-top: 3px;">智能课堂</p>
							</a></li>
						</div>
						<div class="hidden-lg hidden-md hidden-sm col-xs-3" align="center">
							<li><a href="iTeach-community.jsp"><img
									src="img/爱学社区底部.png"
									style="width: 30px; height: 20px; margin-top: 5px;">
									<p
										style="margin-bottom: 0px; color: whitesmoke; font-size: 0.8em; margin-top: 3px;">爱学社区</p>
							</a></li>
						</div>
						<div class="hidden-lg hidden-md hidden-sm col-xs-3" align="center">
							<li><a href="judgeStatus3.jsp"><img
									src="img/个人中心底部2.png"
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
		$('#search_button').on(
				'click',
				function() {
					window.open("https://www.baidu.com/s?wd="
							+ $('#search_text').val());
				});
	</script>
</body>

</html>
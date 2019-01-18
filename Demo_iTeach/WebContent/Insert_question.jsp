<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
body {
	background-color: #FFFCF4;
}

.class-main {
	width: 1300px;
	height: 800px;
	margin: 0 auto;
	margin-top: 30px;
}

.class-main:after {
	content: ".";
	display: block;
	height: 0;
	clear: both;
	visibility: hidden;
}

.insert_question {
	text-align: left;
	font-size: 18px;
	width: 600px;
	height: 500px;
	margin: 0 auto;
}

.question_name>div {
	margin-top: 30px;
	text-align: right;
}

.question_area>div {
	margin-top: 30px;
	text-align: left;
}

@media screen and (min-width: 768px) {
	.class-main {
		padding-left: 20px;
	}
	.question_name {
		width: 200px;
		height: 300px;
		float: left;
	}
	.question_area {
		height: 300px;
		width: 400px;
		float: right;
	}
	.question_area>div>input {
		width: 400px;
	}
	.question_area>div>textarea {
		width: 400px;
	}
	.class-topic {
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
	.class-main {
		width: 100%;
		margin-top: 0px;
	}
	.question_name {
		height: 300px;
		float: left;
		width: 35%;
	}
	.question_area {
		height: 300px;
		float: left;
		width: 60%;
	}
	.insert_question {
		width: 100%;
		font-size: 1.2em;
	}
	.question_area>div>input {
		width: 100%;
	}
	.question_area>div>textarea {
		width: 100%;
	}
}
</style>

</head>
<%
	request.setCharacterEncoding("utf-8");
	HttpSession session2 = request.getSession();
	String username = (String) session2.getAttribute("username");
	String name = (String) session2.getAttribute("name");
	if (username == null) {
		response.sendRedirect(request.getContextPath() + "/entry.html");
	}
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
				<a href="judgeStatus2.jsp"><%=name%></a>
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
		<nav class="navbar navbar-default class-topic" role="navigation"
			style="margin-bottom: 20px;">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#example-navbar-collapse">
						<span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span
							class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">我要提问</a>
				</div>
				<div class="collapse navbar-collapse" id="example-navbar-collapse">
					<ul class="nav navbar-nav">
						<li><a href="iTeach-community.jsp">爱学社区</a></li>
						<li><a href="iTeach-community-my.jsp">我的问题</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<h2 style="text-align: center;">创建我的问答</h2>
		<hr>
		<div class="insert_question">
			<div class="question_name">
				<div>问题概述：</div>
				<div>问题详细介绍:</div>
				<div style="margin-top: 110px;">问题类型:</div>
			</div>
			<form action="InsertQuestion" method="get">
				<div class="question_area">
					<div>
						<input type="text" name="question_name" id="question_name"
							placeholder="请提出你的问题" />
					</div>
					<div>
						<textarea name="question_introduce" id="question_introduce"
							style="height: 100px; resize: none;"
							placeholder="请尽可能的将您的疑惑详细的描述出来，以便其他同学及老师能够更加准确的为你所提出的问题做解答"></textarea>
					</div>
					<div>
						<select name="question_style">
							<option value="大学生活">大学生活</option>
							<option value="计算机">计算机</option>
							<option value="英语四六级">英语四六级</option>
							<option value="考研">考研</option>
							<option value="思政课">思政课</option>
							<option value="公选课">公选课</option>
							<option value="其他">其他</option>
						</select>
					</div>
				</div>
				<input type="submit" value="提交问答"
					style="margin: 0 auto; display: block; width: 175px;"
					onclick="return notEmpty();" />
			</form>
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
		$('#search_button').on('click',function(){
			window.open("https://www.baidu.com/s?wd=" + $('#search_text').val());
		});
		
		function notEmpty() {
			var question_name=document.getElementById("question_name").value;
			var question_introduce=document.getElementById("question_introduce").value;
			if(question_name== "") {
				alert("提出的问题不能为空！");
				return false;
			} else {
				if(question_introduce== "") {
					alert("问题介绍不能为空！");
					return false;
				} else {
						return true;
				}
			}
		}
	</script>
</body>

</html>
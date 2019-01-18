<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
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

.main_wrap {
	position: relative;
	margin: 100px 70px 0 70px;
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
	padding: 0 30px;
	font-size: 16px;
	height: 48px;
	line-height: 48px;
	padding: 0 20px;
	border-top-left-radius: 6px;
	border-top-right-radius: 6px;
	background-color: #e6f0fa;
}

.items_body {
	padding: 0 30px;
	height: 58px;
	margin: 0px;
	border: none;
	box-sizing: border-box;
}

.items_body i {
	margin: 10px 10px 0 20px;
}

.items_body  span {
	font-size: 16px;
}

.record {
	width: 500px;
	margin: 0 auto;
}

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
	.main_wrap {
		position: relative;
		margin: 25px 17px 0 17px;
	}
	.create_btn {
		font-size: 4px;
		width: 77px;
		height: 28px;
		margin-right: 3px;
		margin-left: 38px;
		line-height: 2;
		border-radius: 25px;
		border-color: #fa911e;
		background-color: #fa911e;
		color: #fff;
		display: inline-block;
		text-decoration: none;
		padding: 3px 0 0 5px;
	}
	.create_search {
		position: relative;
		float: left;
	}
	.serarchbox {
		width: 150px;
		height: 27px;
		line-height: 1.6;
		padding: 2px 0 2px 4px;
		font-size: 3px;
		color: #999;
		border-radius: 25px;
		border: 1px solid #ccc;
		box-sizing: border-box;
	}
	.plane {
		position: absolute;
		top: 7px;
		right: 6px;
	}
	.folder {
		position: relative;
		margin: 5px 0;
		padding-top: 3px;
		border-top: 2px solidposition: relative;
		margin: 5px 0;
		padding-top: 3px;
		border-top: 2px solid #F5F9DE;;
	}
	.items {
		z-index: 100;
		position: relative;
		margin-bottom: 15px;
		border-radius: 2px;
		border: 2px solid #e1ebf5;
	}
	.items_header {
		padding: 0 7px;
		font-size: 4px;
		height: 16px;
		line-height: 12px;
		padding: 0 5px;
		border-top-left-radius: 2px;
		border-top-right-radius: 2px;
		background-color: #e6f0fa;
	}
	.items_body {
		padding: 0 7px;
		height: 15px;
		margin: 0px;
		border: none;
		box-sizing: border-box;
	}
	.items_body i {
		margin: 2px 2px 0 5px;
		font-size: 4px;
	}
	.items_body  span {
		font-size: 4px;
	}
	.record {
		width: 125px;
		margin: 0 auto;
	}
}
</style>

<%
	request.setCharacterEncoding("utf-8");
	HttpSession session2 = request.getSession();
	String username = (String) session2.getAttribute("username");
	String name = (String) session2.getAttribute("name");
	if (username == null) {
		response.sendRedirect(request.getContextPath() + "/entry.html");
	}
%>

</head>

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
				<a href="iTeach-myself-stu.jsp"><%=name%></a>
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
							<a href="./wisdomClass/studentShowClass.jsp">课堂管理</a>
						</dd>
						<dd>
							<a href="./wisdomClass/studentTaskShowClass.jsp">课堂作业</a>
						</dd>
						<dd>
							<a href="./wisdomClass/studentCommentShowClass.jsp">课堂评教</a>
						</dd>
						<dd>
							<a href="./wisdomClass/studentCoursewareShowClass.jsp"
								id="courseware_show_class">课件管理</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item"><a href="javascript:;">在线考试</a>
					</dl></li>
				<li class="layui-nav-item"><a href="iTeach-live-stu.html">名师直播</a>
				</li>
				<li class="layui-nav-item"><a href="iTeach-myself-stu.jsp">个人信息</a>
				</li>
			</ul>
		</div>

		<!--这个模块用来插入智能课堂其余部分代码-->
		<div class="class-content">
			<nav class="navbar navbar-default class-topic" role="navigation">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#example-navbar-collapse">
							<span class="sr-only">切换导航</span> <span class="icon-bar"></span>
							<span class="icon-bar"></span> <span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="#">智能课堂</a>
					</div>
					<div class="collapse navbar-collapse" id="example-navbar-collapse">
						<ul class="nav navbar-nav">
							<li><a href="./wisdomClass/studentShowClass.jsp">课堂管理</a></li>
							<li><a href="./wisdomClass/studentTaskShowClass.jsp">课堂作业</a>
							</li>
							<li><a href="./wisdomClass/studentCommentShowClass.jsp">课堂评教</a>
							</li>
							<li><a href="./wisdomClass/studentCoursewareShowClass.jsp">课件管理</a>
							</li>
							<li><a href="TheTest_student.jsp">在线测试</a></li>
						</ul>
					</div>
				</div>
			</nav>


			<div class="main_wrap">
				<form method="post" id="show" action="Select_paper">
					<div class="create_add">
						<a class="create_btn"> <i class="fa fa-map fa-lg"></i> <input
							type="submit" value="开始答题"
							style="border: none; background: none;" />
						</a>

						<div class="create_search">
							<input type="text" name="paper_id" class="serarchbox"
								placeholder="输入考试编号开始答题..." /> <i
								class="plane fa fa-magic fa-lg"></i>
						</div>


					</div>
				</form>
				<sql:setDataSource var="question" driver="com.mysql.jdbc.Driver"
					url="jdbc:mysql://154.8.194.176:3306/iteach?useUnicode=true"
					user="iteach" password="iteach123" />
				<sql:query dataSource="${question}" var="result">
	 				SELECT * From paper_answer WHERE  student_id='<%=username%>';
			</sql:query>

				<sql:setDataSource var="papername" driver="com.mysql.jdbc.Driver"
					url="jdbc:mysql://154.8.194.176:3306/iteach?useUnicode=true"
					user="iteach" password="iteach123" />


				<div class="folder"></div>

				<div class="list">
					<c:forEach var="row" items="${result.rows}">
						<sql:query dataSource="${papername }" var="paper">
					select * from paper where paper_id="${row.paper_id}";
					</sql:query>
						<div class="items">
							<div class="items_header">


								<span>试卷编号：<c:out value="${row.paper_id}" /></span>



								<sql:query dataSource="${papername }" var="paper">
						select * from paper where paper_id="${row.paper_id}";
						</sql:query>
								<c:forEach var="row_paper" items="${paper.rows}">


									<span>试卷名称<c:out value="${row_paper.paper_name}" /></span>
								</c:forEach>

							</div>

							<div class="items_body">

								<i class="fa fa-line-chart fa-3x"></i> <span>考试成绩：<c:out
										value="${row.flag}" /></span> <i class="fa fa-address-book fa-3x"></i>
								<c:forEach var="row_paper" items="${paper.rows}">
									<span>出题人：<c:out value="${row_paper.teacher_id}" /></span>
								</c:forEach>
							</div>
						</div>
					</c:forEach>
				</div>

			</div>
		</div>
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

	<div class="main_nav_bottom">
		<nav
			class="navbar navbar-default navbar-fixed-bottom hidden-lg hidden-md hidden-sm"
			style="background-color: #333;">
			<div class="container" align="center">
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
		</script>
</body>

</html>
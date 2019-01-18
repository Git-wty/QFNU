<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>视频直播</title>
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<link href="css/main.css" rel="stylesheet" />
<!--layui框架引入-->
<link href="layui/css/layui.css" rel="stylesheet" />
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
* {
	margin: 0px;
	padding: 0px;
}

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
	background-color: #FFFCF4;
}

.title {
	background-image: url(img/多人话题讨论.png);
	background-repeat: no-repeat;
	height: 450px;
	margin: 0 auto;
	border-radius: 10px;
	width: 1260px;
	position: relative;
	margin-bottom: 10px;
}

.topic {
	max-width: 1260px;
	background-color: #66CCCC;
	min-height: 200px;
	margin: 0px auto 5px;
	border-radius: 10px;
	clear: both;
}

.topic-content {
	padding-top: 5px;
	margin-left: 20px;
	font-size: 20px;
}

.features {
	position: absolute;
	bottom: 0px;
	width: 1000px;
	margin: 3px auto;
	height: 30px;
	line-height: 30px;
}

.features-button {
	text-align: center;
	height: 30px;
	width: 90px;
	background-color: orangered;
	float: right;
	margin-right: 10px;
	border-radius: 10px;
}

.create-left {
	width: 230px;
	height: 250px;
	float: left;
}

.create-left>div {
	margin-top: 20px;
	height: 27px;
	line-height: 27px;
	text-align: right;
}

.create-right {
	width: 340px;
	height: 250px;
	float: right;
}

.create-right>div {
	width: 180px;
	height: 27px;
	line-height: 27px;
	margin-top: 20px;
	text-align: left;
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
		<nav style="width: 1260px; margin: 0 auto; text-align: left;">
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
	<section class="title">
		<div class="features-button joinTopic" id="join"
			style="position: absolute; bottom: 10px; right: 20px; line-height: 30px;">加入房间</div>
		<div class="features-button openTopic" id="open"
			style="position: absolute; bottom: 10px; right: 140px; line-height: 30px;">开启房间</div>
	</section>

	<section style="min-height: 350px;">
		<sql:setDataSource var="room" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://154.8.194.176:3306/iteach?useUnicode=true"
			user="iteach" password="iteach123" />

		<sql:query dataSource="${room}" var="result">
	 			SELECT * from topic_room WHERE topic_permission="1";
			 </sql:query>

		<c:forEach var="row" items="${result.rows}">
			<div class="topic">
				<!--话题信息-->
				<div class="topic-content">
					<p style="font-size: 22px; font-weight: bold; margin-bottom: 15px;">
						<a href="select-room.jsp?room-id=<c:out value="${row.topic_id}"/>">
							话题名称：<c:out value="${row.topic_name}" />
						</a>
					</p>
					<p>
						话题信息：
						<c:out value="${row.topic_introduce}" />
					</p>
					<p>
						话题类型：
						<c:out value="${row.topic_style}" />
					</p>
				</div>
			</div>
		</c:forEach>

	</section>


	<section id="create-room" style="display: none;">
		<form action="open-room.jsp" method="post">
			<div class="create-left">
				<div>话题名称:</div>
				<div>话题介绍:</div>
				<div>是否公开:</div>
				<div>话题类型:</div>
			</div>
			<div class="create-right">
				<div>
					<input type="text" name="room-name" class="form-control"
						id="room-name" placeholder="请输入话题名称" />
				</div>
				<div>
					<input type="text" name="room-introduce" placeholder="请输入话题介绍"
						id="room-introduce" class="form-control" />
				</div>
				<div>
					公开<input type="radio" name="room-permission" checked value="1" />
					不公开 <input type="radio" name="room-permission" value="0" />
				</div>
				<div>
					<input type="text" name="room-style" class="form-control"
						id="room-style" />
				</div>
			</div>
			<div style="clear: both;">
				<button type="submit" class="btn btn-default"
					style="margin-left: 250px;" onclick="return notEmpty();">开启话题房间</button>
			</div>
		</form>
	</section>


	<section id="open-room" style="display: none;">
		<form action="Select_topicroom" method="post">
			<input type="text" placeholder="请输入您想加入的房间号" class="form-control"
				name="room-id"> <br /> <input type="submit"
				class="btn btn-default" style="display: block; margin: 0 auto;">
		</form>
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
</body>
<script src="https://cdn.bootcss.com/jquery/2.0.0/jquery.min.js"></script>
<script type="text/javascript" src="layer-v3.1.1/layer/layer.js"></script>
<script>
	$('#open').on('click', function() {
		layer.open({
			type : 1,
			area : [ '600px', '360px' ], //控制弹出层大小
			shadeClose : true, //点击遮罩关闭
			content : $('#create-room')
		});
	});

	$('#join').on('click', function() {
		layer.open({
			type : 1,
			area : [ '300px', '170px' ], //控制弹出层大小
			shadeClose : true, //点击遮罩关闭
			content : $('#open-room')
		});
	});
</script>
<script type="text/javascript">
		$('#search_button').on('click',function(){
			window.open("https://www.baidu.com/s?wd=" + $('#search_text').val());
		});
		
		function notEmpty() {
			var room_name=document.getElementById("room-name").value;
			var room_introduce=document.getElementById("room-introduce").value;
			var room_style=document.getElementById("room-style").value;
			if(room_name== "") {
				alert("话题名称不能为空");
				return false;
			} else {
				if(room_introduce== "") {
					alert("话题介绍不能为空");
					return false;
				} else {
					if(room_style== "") {
						alert("话题类型不能为空");
						return false;
					} else {
						return true;
					}
				}
			}
		}
</script>

</html>
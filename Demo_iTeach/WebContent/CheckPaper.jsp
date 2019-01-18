<%@page import="com.sun.rowset.internal.Row"%>
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
	color: #8B7D6B;
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

.student_score {
	margin: 50px 0 0 200px;
}

.student_score span {
	display: inline-block;
	margin: 3px 0 3px 0;
}

input {
	border-radius: 10px;
	border: 1px solid deepskyblue;
	color: orangered;
}
</style>

</head>
<%
	request.setCharacterEncoding("utf-8");
	HttpSession session2 = request.getSession();
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
				<li class="layui-nav-item"><a href="iTeach-live-room.html">名师直播</a>
				</li>
				<li class="layui-nav-item"><a href="iTeach-myself.jsp">个人信息</a>
				</li>
			</ul>
		</div>

		<!--这个模块用来插入智能课堂其余部分代码-->
		<div class="class-content">
			<%
				String paper_id = request.getParameter("paper_id");
				String student_id = request.getParameter("student_id");
				String student_name = request.getParameter("student_name");
				int score = 0;
				String[] selections;
				String[] judgments;
				String[] simples;
				String selection;
				String judgement;
				String simple;
			%>
			<sql:setDataSource var="question" driver="com.mysql.jdbc.Driver"
				url="jdbc:mysql://154.8.194.176:3306/iteach?useUnicode=true"
				user="iteach" password="iteach123" />
			<sql:query dataSource="${question}" var="result">
					select * from paper_answer where student_id='<%=student_id%>' and paper_id='<%=paper_id%>';
			</sql:query>



			<c:forEach var="row" items="${result.rows}">

				<c:set var="selection" value="${row.selection_ans}"></c:set>
				<c:set var="judgement" value="${row.judgement_ans}"></c:set>
				<c:set var="simple" value="${row.simple_ans}"></c:set>
				<c:set var="score" value="${row.flag }"></c:set>

				<%
					selection = (String) pageContext.getAttribute("selection");
						judgement = (String) pageContext.getAttribute("judgement");
						simple = (String) pageContext.getAttribute("simple");

						score = (int) pageContext.getAttribute("score");
						selections = selection.split("@");
						judgments = judgement.split("#");
						simples = simple.split("@#");
				%>


				<div class="student_score">
					<p>
						学生名称:<%=student_name%></p>
					<%
						for (int j = 1; j < selections.length; j++) {
					%>
					<span>选择题<%=j%>:<%=selections[j]%></span>

					<%
						}
					%>
					<br />

					<%
						for (int k = 1; k < judgments.length; k++) {
					%>
					<span>判断题<%=k%>:<%=judgments[k]%></span>

					<%
						}
					%>
					<br />
					<%
						for (int l = 1; l < simples.length; l++) {
					%>
					<span>简答题<%=l%>:<%=simples[l]%></span>

					<%
						}
					%>
					<br />
					<form action="ScoreServlet">
						请输入该生成绩:<input value="<%=score%>" name="score" /> <input
							hidden="hidden" name="student_id" value="<%=student_id%>" /> <input
							hidden="hidden" class="input_score" name="paper_id"
							value="<%=paper_id%>" /> <input type="submit"
							class="input_submit" value="提交" />

					</form>
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
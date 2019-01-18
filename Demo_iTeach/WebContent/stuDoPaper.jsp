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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
	padding: 0;
	margin: 0;
	line-height: 24px;
	font-family: Helvetica Neue, PingFang SC, Hiragino Sans GB, HeitiSC,
		Helvetica, Arial, Microsoft YaHei, WenQuanYi Micro Hei, sans-serif;
	background: #fff;
	color: #222;
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

.class-content>h1 {
	text-align: center;
	font-family: '微软雅黑';
	margin-top: 20px;
}

.studentcheck {
	margin-left: auto;
	margin-right: auto;
	width: 60%;
	color: #484848;
	font-size: 14px;
}

.student_xuanzeti {
	margin-top: 30px;
	margin-bottom: 20px;
	background-color: white;
	padding: 10px 0 0 40px;
	margin-left: 40px;
	font-size: 12px;
}

.student_tiankongti {
	margin-top: 10px;
	margin-bottom: 20px;
	background-color: white;
	padding: 10px 0 0 40px;
	margin-left: 40px;
	font-size: 12px;
}

.student_jiandati {
	margin-top: 10px;
	background-color: white;
	padding: 10px 0 0 40px;
	margin-left: 40px;
	font-size: 12px;
}

.area {
	margin-top: 15px;
	width: 300px;
	height: 200px;
	border-right: none;
	border-bottom: none;
}

input[type=submit] {
	width: 120px;
	height: 32px;
	background-color: #2672ff;
	border: 0px;
	color: white;
	margin: 10px auto 0px;
	display: block;
}

@media screen and (min-width: 768px) {
	.blank {
		display: none;
	}
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
	.area {
		width: 130px;
		height: 80px;
	}
	.student_xuanzeti {
		margin-top: 30px;
		margin-bottom: 20px;
		background-color: white;
		padding: 10px 0 0 20px;
		margin-left: 20px;
		font-size: 12px;
	}
	.student_tiankongti {
		margin-top: 10px;
		margin-bottom: 20px;
		background-color: white;
		padding: 10px 0 0 20px;
		margin-left: 20px;
		font-size: 12px;
	}
	.blank {
		clear: both;
		overflow: hidden;
		display: block;
		overflow: hidden;
	}
	.student_jiandati {
		margin-top: 10px;
		background-color: white;
		padding: 10px 0 0 20px;
		margin-left: 20px;
		font-size: 12px;
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
	<header -="container" style="width: 100%;"> <!--顶部共分为两行：1.logo、登录注册、搜索框、APP下载 2.导航栏区域-->
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

	<!--第二行：导航栏,行内设置样式取消layui内样式--> <nav
		style="width: 1260px;margin: 0 auto;"> <!--导航栏ul列表，使用layui框架-->
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
	</nav> </header>

	<!--智能课堂管理模块-->
	<section class="class-main"> <!--左边功能导航栏部分：智能课堂部分及后台管理-->
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
					<span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">智能课堂</a>
			</div>
			<div class="collapse navbar-collapse" id="example-navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">课堂管理</a></li>
					<li><a href="#">课堂作业</a></li>
					<li><a href="#">课堂评教</a></li>
					<li><a href="#">在线测试</a></li>
					<li><a href="#">名师直播</a></li>
				</ul>
			</div>
		</div>
		</nav>


		<% 
	List seleList = new ArrayList();
	List simpList= new ArrayList();
	List judgeList=new ArrayList();
	String paperId;
%>


		<%


paperId = request.getParameter("paper_id");
	System.out.println(paperId);
ResultSet rs = new SelectionDaoImpl().showSelection(paperId);
ResultSet rs_simple= new SimpleDaoImpl().showSimple(paperId);
ResultSet rs_judge=new JudgeDaoImpl().showJudge(paperId);


try {
	while(rs.next()) {
		Selection selection = new Selection();
		selection.setTitle_id(Integer.parseInt(rs.getString(1)));
		selection.setTitle(rs.getString(2));
//		sele.setAnswer(rs.getString(3));
		selection.setA(rs.getString(4));
		selection.setB(rs.getString(5));
		selection.setC(rs.getString(6));
		selection.setD(rs.getString(7));
		seleList.add(selection);

	}
	
	
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}



try{

	while(rs_judge.next()){
		Judge judge=new Judge();
		judge.setTitleId(Integer.parseInt(rs_judge.getString(1)));
		judge.setTitleName(rs_judge.getString(2));
		judgeList.add(judge);
		
	}
}catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

try{

	while(rs_simple.next()){
		Simple simple=new Simple();
		simple.setTitle_id(Integer.parseInt(rs_simple.getString(1)));
		simple.setTitle(rs_simple.getString(2));
		simpList.add(simple);
	}
}catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
%>

		<h1>测试题</h1>
		<div class="studentcheck">

			<form action='SubmitServlet'>
				<input type='hidden' name='paper_id' value='<%=paperId %>'>
				<input type="hidden" name="selection_num"
					value="<%=seleList.size() %>" /> <input type="hidden"
					name="judgement_num" value="<%=judgeList.size() %>" /> <input
					type="hidden" name="simple_num" value="<%=simpList.size() %>" />
				<%
	
	for(int i=0; i < seleList.size(); i++){
		Selection sele = (Selection)seleList.get(i);
		
 %>
				<div class="student_xuanzeti">

					<%String test=sele.getTitle();
	String aaa=test.replace('<','＜' );
	String bbb=aaa.replace('>', '＞');
	%>

					选择题序号:<%=sele.getTitle_id() %>
					选择题名称:<%=bbb %><br /> <input type='radio'
						name="answer_selection<%=i+1 %>" value='A'
						style="margin-top: 10px;" />选择题A选项:<%=sele.getA()%><br /> <input
						type='radio' name="answer_selection<%=i+1 %>" value='B'
						style="margin-top: 10px;" />选择题B选项:<%=sele.getB()%><br /> <input
						type='radio' name="answer_selection<%=i+1 %>" value='C'
						style="margin-top: 10px;" />选择题C选项:<%=sele.getC()%><br /> <input
						type='radio' name="answer_selection<%=i+1 %>" value='D'
						style="margin-top: 10px;" />选择题D选项:<%=sele.getD()%><br />

				</div>
				<% 
 	}

 %>

				<%
	
	for(int i=0; i < judgeList.size(); i++){
	Judge	 jud=(Judge)judgeList.get(i);
		
 %>
				<div class="student_tiankongti">


					<%String gula=jud.getTitleName();
	String ccc=gula.replace('<','＜' );
	String ddd=ccc.replace('>', '＞');
	%>
					判断题序号:<%=jud.getTitleId() %>
					判断题名称:<%=ddd %><br /> <input type='radio'
						name="answer_judge<%=i+1 %>" value='正确' style="margin-top: 10px;" />正确<br />
					<input type='radio' name="answer_judge<%=i+1 %>" value='错误'
						style="margin-top: 10px;" />错误<br />

				</div>

				<% 
 	}

 %>

				<%
	
	for(int i=0; i < simpList.size(); i++){
		 
		Simple simp=(Simple)simpList.get(i);
		
%>


				<div class="student_jiandati">

					<%String puci=simp.getTitle();
	String eee=puci.replace('<','＜' );
	String fff=eee.replace('>', '＞');
	%>
					简答题题序号:<%=simp.getTitle_id() %>
					简答题名称:<%=fff %><br />

					<textarea type='text' name="content<%=i+1 %>" class="area" /></textarea>
					<br />

				</div>




				<% 
	}
	
%>

				<input type="submit" value='提交试卷'>
			</form>
		</div>
	</div>
	</section>

	<!--底部信息栏 当在手机屏幕浏览时不会显示-->
	<footer> <!--盛放底部信息内容的容器--> <section class="footer-content">
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

	</section> <!--版权信息-->
	<div style="height: 20px; text-align: center; margin-bottom: 5px;">©Copyright
		iTeach</div>
	</footer>
	<span class="blank" style="height: 50px;"></span>
	<div class="main_nav_bottom">
		<nav
			class="navbar navbar-default navbar-fixed-bottom hidden-lg hidden-md hidden-sm"
			style="background-color:#333; ;">
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
						<li><a href="judgeStatus3.jsp"><img src="img/个人中心底部2.png"
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
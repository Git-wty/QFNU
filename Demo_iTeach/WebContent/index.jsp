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
<link href="css/bootstrap3.3.7.min.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery1.10.2.min.js"></script>
<script type="text/javascript" src="js/bootstrap3.3.7.min.js"></script>
<!--移动端-->
<!--智能课堂css与js-->
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="js/jquery.mCustomScrollbar.css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript"
	src="js/jquery.mCustomScrollbar.concat.min.js"></script>

<!--移动端-->



<!--该页面基本css代码-->
<link href="css/main1.css" rel="stylesheet" />
<!--智能课堂动画效果css代码-->

<link rel="stylesheet" type="text/css" href="css/style.css" />

<!--layui框架引入-->
<link href="layui/css/layui.css" rel="stylesheet" />

<!-- 智能课堂的js代码引入-->
<!--<script type="text/javascript" src="js/jquery.min.js"></script>-->
<script type="text/javascript" src="js/zturn.js"></script>
<style>
@media only screen and (max-width:767px ) {
	.pc {
		display: none;
	}
}

@media only screen and (min-width:768px ) {
	.blank {
		display: none;
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
<body style="height: 0px;">
	<!--pc端-->
	<!--顶部导航栏-->
	<div class="pc">
		<div style="background-color: white;">
			<header class="container" style="height: 100px;">

				<!--顶部共分为两行：1.logo、登录注册、搜索框、APP下载 2.导航栏区域-->
				<!--第一行区域：logo、登录注册、搜索框、APP下载-->
				<div class="header-line1" style="min-width: 1276px;">
					<!--Logo-->
					<img src="img/logo.png" class="img-responsive"
						style="margin-left: 20px;" />
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
						style="float: right; line-height: 72px; margin-right: 17px; padding-top: 10px;">
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

			</header>
		</div>
		<nav
			style="min-width: 1276px; margin: 0 auto; background-color: #393D49;">
			<div class="container"
				style="min-width: 1276px; margin: 0 auto; padding: 0 15px;">
				<!--导航栏ul列表，使用layui框架-->

				<ul class="layui-nav">
					<!--首页部分-->
					<ul>
						<li class="layui-nav-item"><a href="index.jsp">首页</a></li>
						<li class="layui-nav-item"><a href="judgeStatus.jsp">智能课堂</a></li>
						<!--名师直播部分-->
						<li class="layui-nav-item"><a href="judgeStatus1.jsp">名师直播</a></li>
						<li class="layui-nav-item"><a href="iTeach-topic-room.jsp">话题讨论</a></li>
						<!--爱学社区模块-->
						<li class="layui-nav-item"><a href="iTeach-community.jsp">爱学社区</a></li>
					</ul>

				</ul>

			</div>



		</nav>

		<!--页面轮播部分-->
		<section
			style="height: 380px; width: 100%; background-color: rgb(248, 227, 148); min-width: 1276px;"
			id="banner">
			<!--轮播展示界面-->
			<div class="banner">
				<!--轮播图部分左侧导航-->
				<div class="banner-list">
					<ul>
						<li>话题讨论</li>
						<li><a href="iTeach-community-sort.jsp?community_style=大学生活">大学生活</a></li>
						<li><a href="iTeach-community-sort.jsp?community_style=计算机">计算机</a></li>
						<li><a href="iTeach-community-sort.jsp?community_style=英语四六级">英语四六级</a></li>
						<li><a href="iTeach-community-sort.jsp?community_style=考研">考研</a></li>
						<li><a href="iTeach-community-sort.jsp?community_style=思政课">思政课</a></li>
						<li><a href="iTeach-community-sort.jsp?community_style=公共课">公选课</a></li>
						<li><a href="iTeach-community-sort.jsp?community_style=其他">其他</a></li>
						<li><a href="iTeach-community.jsp">更多</a></li>
					</ul>

				</div>
				<!--轮播图区域：使用layui框架-->
				<div class="banner-img">
					<div class="layui-carousel" id="test1" lay-filter="test1">
						<!--底部div内可对内容进行填充和修改-->
						<div carousel-item>
							<div style="background-color: rgb(248, 227, 148);">
								<img src="img/视频通话，实现面对面话题讨论（轮播）.png"
									style="width: 860px; height: 380px;" />
							</div>
							<div style="background-color: rgb(3, 5, 10);">
								<img src="img/智能课堂（轮播）.bmp" style="width: 860px; height: 380px;" />
							</div>
							<div style="background-color: rgb(0, 55, 108);">
								<img src="img/课堂直播（轮播）.png" style="width: 860px; height: 380px;" />
							</div>

						</div>
					</div>
				</div>
				<!--轮播图右侧登录注册模块-->
				<div class="banner-login">
					<div class="denglu">

						<span class="span1">免费学习名师名校的智能课堂</span> <img class="denglu-img"
							src="img/登录3.jpg">
						<button>
							<%
								if (name == null) {
							%>
							<a href="entry.html" style="color: rgb(255, 255, 255);">登录</a>
							<%
								} else {
							%>
							<a href="judgeStatus2.jsp" style="color: rgb(255, 255, 255);"><%=name%></a>
							<%
								}
							%>
						</button>
						<div class="span2">
							<span>码到成功团队出品</span>

						</div>

					</div>

				</div>
			</div>

		</section>
		<!--课堂直播部分-->
		<!--课堂直播标题-->
		<section class="ketangzhibo-text">

			<span class="icon-new-l"></span> <em>课</em> <em>堂</em> <em>直</em> <em>播</em>
			<span class="icon-new-r"></span>

		</section>
		<!--课堂直播内容部分-->
		<div class="container-fluid">
			<section class="ketangzhibo">
				<!--课堂直播第一部分-->
				<div class="ketangzhibo-1">
					<img src="img/外语.jpg" style="width: 244px; height: 136px;">
					<div class="ketangzhibo-text-1">
						<span>外经贸英语</span>

					</div>
					<div class="ketangzhibo-text-2">
						<span>尚未开始</span>

					</div>
					<div class="ketangzhibo-text-3">
						<span>曲阜师范大学</span>
					</div>
					<div class="ketangzhibo-text-4">
						<span>本课程是每一位外贸创业者或商务英语爱好者必学的一门课程</span>
					</div>

				</div>
				<!--课堂直播第二部分-->
				<div class="ketangzhibo-1">
					<img src="img/心理学.jpg" style="width: 244px; height: 136px;">
					<div class="ketangzhibo-text-1">
						<span>心理学入门</span>

					</div>
					<div class="ketangzhibo-text-2">
						<span>尚未开始</span>

					</div>
					<div class="ketangzhibo-text-3">
						<span>曲阜师范大学</span>
					</div>
					<div class="ketangzhibo-text-4">
						<span>以严谨的态度，专业的叙述，系统的为大家介绍心理学的基础知识</span>
					</div>
				</div>
				<!--课堂直播第三部分-->
				<div class="ketangzhibo-1">
					<img src="img/文学历史.jpg" style="width: 244px; height: 136px;">
					<div class="ketangzhibo-text-1">
						<span>外国文学史</span>

					</div>
					<div class="ketangzhibo-text-2">
						<span>尚未开始</span>

					</div>
					<div class="ketangzhibo-text-3">
						<span>曲阜师范大学</span>
					</div>
					<div class="ketangzhibo-text-4">
						<span>外国文学横贯东西，综览古今，数不胜数的文学名著汇成一部壮观的诗意人学史</span>
					</div>
				</div>
				<!--课堂直播第四部分-->
				<div class="ketangzhibo-1">
					<img src="img/经济管理.jpg" style="width: 244px; height: 136px;">
					<div class="ketangzhibo-text-1">
						<span>金融经济</span>

					</div>
					<div class="ketangzhibo-text-2">
						<span>尚未开始</span>

					</div>
					<div class="ketangzhibo-text-3">
						<span>曲阜师范大学</span>
					</div>
					<div class="ketangzhibo-text-4">
						<span>本课程是一门全面系统讲述互联网金融原理，业务模式与政策规制的课程</span>
					</div>
				</div>
				<!--课堂直播第五部分-->
				<div class="ketangzhibo-1">
					<img src="img/计算机.jpg" style="width: 244px; height: 136px;">
					<div class="ketangzhibo-text-1">
						<span>计算机技术</span>

					</div>
					<div class="ketangzhibo-text-2">
						<span>尚未开始</span>

					</div>
					<div class="ketangzhibo-text-3">
						<span>曲阜师范大学</span>
					</div>
					<div class="ketangzhibo-text-4">
						<span>本课程主要讲授编译器设计与实现的主要理论和技术</span>
					</div>
				</div>

			</section>
		</div>


		<!--话题讨论部分-->
		<div class="container-fluid" style="padding: 0px; min-width: 1276px;">
			<section class="huatitaolun ">
				<!--文字和讨论框-->
				<div class="huantitaolun-text-and-picture"
					style="min-width: 1276px; max-width: 1350px; margin-left: auto; margin-right: auto;">
					<!--话题讨论文本部分-->
					<div class="huantitaolun-text">
						<div class="huatitaolun-text-1">
							<img src="img/精彩讨论.png">

						</div>
						<div class="huatitaolun-text-2">
							<span>一起学习，一起成长</span>
						</div>
						<a href="iTeach-community.jsp">
							<div class="huatitaolun-button">
								<button>加入讨论</button>
							</div>
						</a>
						<div class="huatitaolun-text-3">
							<span>数名老师同学分享讨论,精彩不容错过</span>
						</div>

					</div>
					<!--话题讨论框-->
					<div class="div-1" style="float: right;">
						<!--第一个话题框-->
						<a href="question-view.jsp?question_id=47nJs648yw9K8e3">
							<div class="div-1-1">
								<div class="div-1-1-img">
									<img src="img/头像.jpg">
								</div>
								<div class="div-1-1-text1">
									<p>黎晴</p>
								</div>
								<div class="div-1-1-text2">
									<p>老师</p>
								</div>
								<div class="div-1-1-text3">
									<p>来自&nbsp;&nbsp;&nbsp;&nbsp;教育学院</p>
								</div>
								<div class="div-1-1-text4">
									<h5>&nbsp;&nbsp;&nbsp;&nbsp;如何在考研时每天保持十小时以上高效学习?</h5>
								</div>
								<div class="div-1-1-text5">
									<p>1545人参加讨论
									<p>
								</div>

							</div>

						</a>

						<!--第二个话题框-->
						<a href="question-view.jsp?question_id=ji9043lHcjB1gp2">
							<div class="div-1-2">
								<div class="div-1-2-img">
									<img src="img/头像.jpg">
								</div>
								<div class="div-1-1-text1">
									<p>欧阳箫</p>
								</div>
								<div class="div-1-1-text2">
									<p>老师</p>
								</div>
								<div class="div-1-1-text3">
									<p>来自&nbsp;&nbsp;&nbsp;&nbsp;历史文化学院</p>
								</div>
								<div class="div-1-1-text4">
									<h5>&nbsp;&nbsp;&nbsp;&nbsp;大学生在大学期间应该如何提高自己的专业知识和运用能力？</h5>
								</div>
								<div class="div-1-1-text5">
									<p>4587人参加讨论
									<p>
								</div>

							</div>
						</a>

					</div>
				</div>

			</section>
		</div>

		<!--智能课堂部分-->
		<section class="zhinengketang">
			<div class="lb_gl">
				<div class="container" style="margin-top: 50px;">
					<!--智能课堂标题-->
					<div class="turn_3d"
						style="font-weight: 600; padding-bottom: 40px;">
						<span class="icon-new-l" style="margin-right: 0px;"></span> <em>你</em>
						<em>的</em> <em>专</em> <em>属</em> <em>课</em> <em>堂</em> <span
							class="icon-new-r"></span>
					</div>
					<!--智能课堂图片部分-->
					<div class="pictureSlider poster-main">
						<div class="poster-btn poster-prev-btn"></div>
						<ul id="zturn" class="poster-list">
							<!--第一张图片-->
							<li class="poster-item zturn-item">
								<p class="xxgy">作业发布</p>

								<div class="for_btn" style="margin-top: 35px;">
									<img src="img/作业发布2.jpg" width="100%"> <a href="#"
										class="in_page"><img src="img/iconin.png" /></a>
								</div>
								<div class="students_star">

									<p class="cell_list">
										<span class="darks">智能课堂之作业发布</span>
									</p>
									<div class="zwjs">提高学习效率，网上作业发布，提高学习效率，及时巩固知识点，当堂知识点立即巩固
									</div>
								</div>
							</li>
							<!--第二张图片-->
							<li class="poster-item  zturn-item">
								<p class="xxgy">网上评教</p>

								<div class="for_btn">
									<img src="img/评教.jpg" width="100%"> <a href="#"
										class="in_page"><img src="img/iconin.png" /></a>
								</div>
								<div class="students_star">

									<p class="cell_list">
										<span class="darks">智能课堂之网上评教</span>
									</p>
									<div class="zwjs">节省大量的人力物力,提高精确度,实现师生之
										间的快捷沟通，合理有效的促进教师团队健康成长</div>
								</div>
							</li>
							<!--第三张图片-->
							<li class="poster-item zturn-item">
								<p class="xxgy">智能点名</p>

								<div class="for_btn">
									<img src="img/在线点名.jpg" width="100%"> <a href="#"
										class="in_page"><img src="img/iconin.png" /></a>
								</div>
								<div class="students_star">

									<p class="cell_list">
										<span class="darks">智能课堂之课堂点名</span>
									</p>
									<div class="zwjs">
										提高老师点名效率，随机抽取指定数量班级成员，TTS智能语音发生让老师不再担心生僻字!</div>
								</div>
							</li>
							<!--第四张图片-->
							<li class="poster-item zturn-item">
								<p class="xxgy">考试成绩</p>

								<div class="for_btn">
									<img src="img/考试成绩.jpg" width="100%"> <a href="#"
										class="in_page"><img src="img/iconin.png" /></a>
								</div>
								<div class="students_star">

									<p class="cell_list">
										<span class="darks">智能课堂之考试成绩</span>
									</p>
									<div class="zwjs">考试成绩即使发布，当堂测试，当堂检测，成绩发布，提高学习效率</div>
								</div>
							</li>
							<!--第五张图片-->
							<li class="poster-item zturn-item">
								<p class="xxgy">在线组卷</p>

								<div class="for_btn">
									<img src="img/在线组卷.jpg" width="100%"> <a href="#"
										class="in_page"><img src="img/iconin.png" /></a>
								</div>
								<div class="students_star">

									<p class="cell_list">
										<span class="darks">智能课堂之在线考试</span>
									</p>
									<div class="zwjs">提高学习效率，通过手机浏览网页进行考试，方便快捷</div>
								</div>
							</li>
							<!--第六张图片-->
							<li class="poster-item zturn-item">
								<p class="xxgy">课堂直播</p>

								<div class="for_btn">
									<img src="img/在线考试.png" width="100%"> <a href="#"
										class="in_page"><img src="img/iconin.png" /></a>
								</div>
								<div class="students_star">

									<p class="cell_list">
										<span class="darks">智能课堂之课堂直播</span>
									</p>
									<div class="zwjs">提高学习效率，随时随地学习，让每一位学子都能享受高质量的教育资源</div>
								</div>
							</li>
							<!--第七张图片-->
							<li class="poster-item zturn-item">
								<p class="xxgy">试卷批改</p>

								<div class="for_btn">
									<img src="img/试卷批改.png" width="100%"> <a href="#"
										class="in_page"><img src="img/iconin.png" /></a>
								</div>
								<div class="students_star">

									<p class="cell_list">
										<span class="darks">智能课堂之试卷批改</span>
									</p>
									<div class="zwjs">考试完毕评阅方即可收到考生试题，缩短公布成果时刻，提高学习工作效率</div>
								</div>
							</li>

						</ul>

					</div>
				</div>

			</div>

		</section>

		<!--底部信息栏 当在手机屏幕浏览时不会显示-->
		<footer class="hidden-xs" style="min-width: 1276px;">

			<!--盛放信息内容的容器-->
			<section class="footer-content" style="min-width: 1276px;">
				<!--logo及介绍-->
				<div style="float: left; width: 500px; padding-top: 10px;">
					<img src="img/lastlogo(1).png"
						style="display: block; margin-left: 5px; margin-bottom: 20px;" />
					<p>iTeach由以梦为码团队建立，旨在为高校师生提供交流和教学辅助平台。</p>
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


	</div>





	<!--js代码统一放置在最底部使用，包括基础的bootstrap框架及layui框架-->
	<!--<script src="js/jquery1.10.2.min.js"></script>
		<script src="js/bootstrap3.3.7.min.js"></script>-->
	<script type="text/javascript" src="layui/layui.js"></script>
	<script>
		//获取轮播区域的DOM对象,方便在轮播时改变背景颜色
		var banner = document.getElementById("banner");
		//layui框架轮播必须引入模块element,无需修改		
		layui.use('element', function() {
			var element = layui.element;
			//一些事件监听
			element.on('tab(demo)', function(data) {
				console.log(data);
			});
		});
		//			轮播图创建事件,可调整相应参数,详间layui官网
		layui.use('carousel', function() {
			var carousel = layui.carousel;
			//建造实例
			carousel.render({
				elem : '#test1',
				width : '860px', //设置容器宽度
				height : '380px',
				arrow : 'hover' //始终显示箭头
			//,anim: 'updown' //切换动画方式
			});
			//轮播图转换事件,用于当轮播图发生变化时进行事件处理
			carousel.on('change(test1)',
					function(obj) { //test1来源于对应HTML容器的 lay-filter="test1" 属性值
						//console.log(obj.index); //当前条目的索引
						//console.log(obj.item.css("background-color")); //当前条目的元素对象
						banner.style.backgroundColor = obj.item
								.css("background-color");
					});
		});
		//直播部分的动画效果
	</script>
	<!--智能课堂-->
	<script type="text/javascript">
		var aa = new zturn({
			id : "zturn",
			opacity : 0.9,
			width : 382,
			Awidth : 1024,
			scale : 0.9
		})
		var ab = new zturn({
			id : "zturn2",
			opacity : 0.8,
			width : 382,
			Awidth : 1024,
			scale : 0.6
		})
	</script>
	<!--pc端-->

	<!--移动端-->
	<section>
		<nav class="navbar-fixed-top">
			<div class="form-select  container hidden-lg hidden-md hidden-sm"
				style="width: 100%; padding-top: 5px; padding-bottom: 5px;">
				<form class="form-inline form-horizontal">

					<input type="text" class="form-control text-center"
						placeholder="输入你想要搜索的课程"
						style="border-radius: 3px; background-color: white; opacity: 0.5; height: 24px; background-color: gainsboro;"
						id="search_text">

				</form>
			</div>
		</nav>


		<!--焦点图start-->
		<div class="carousel slide hidden-lg hidden-md hidden-sm"
			id="NewsCarousel" style="margin-top: 35px;">
			<!--Indicators-->
			<ol class="carousel-indicators">
				<li class="active" data-slide-to="0" data-target="#NewsCarousel"></li>
				<li data-slide-to="1" data-target="#NewsCarousel"></li>
				<li data-slide-to="2" data-target="#NewsCarousel"></li>
			</ol>
			<!--wrapper for slides-->
			<div class="carousel-inner">
				<div class="item active" id="slide1">
					<img src="img/智能课堂（轮播）.bmp" class="img-responsive center-block"
						style="width: 100%; height: 180px;" />

				</div>

				<div class="item" id="slide2">
					<img src="img/视频通话，实现面对面话题讨论（轮播）.png"
						class="img-responsive center-block"
						style="width: 100%; height: 180px" />

				</div>

				<div class="item" id="slide3">
					<img src="img/课堂直播（轮播）.png" class="img-responsive center-block"
						style="width: 100%; height: 180px;" />

				</div>
			</div>
			<!--controller-->
			<a class="left carousel-control" data-slide="prev"
				href="#NewsCarousel"><span class="icon-prev"></span></a> <a
				class="right carousel-control" data-slide="next"
				href="#NewsCarousel"><span class="icon-next"></span></a>
		</div>
		<!--焦点图end-->
	</section>
	<section class="ketangzhibo-app "
		style="background-color: white; margin-top: 10px;">
		<p class=" hidden-lg hidden-md hidden-sm col-xs-12">推荐课程</p>
		<div class="container">

			<div class="row">
				<div class="hidden-lg hidden-md hidden-sm col-xs-12">
					<img src="img/设计.jpg" style="width: 100%; height: 100px;"
						class="img-responsive center-block">

				</div>
			</div>
			<div class="row">

				<div class="ketangzhiboapp-1 hidden-lg hidden-md hidden-sm col-xs-6">
					<a href="#"><img src="img/经济管理.jpg" style="width: 100%;"
						class="img-responsive center-block"></a> <a href="#"><p
							style="font-size: 0.9em; margin-bottom: 5px; margin-top: 10px;">金融经济</p></a>
					<p style="font-size: 0.6em; color: #55B929; margin-bottom: 0px;">尚未开始</p>
					<p style="font-size: 0.6em; color: gray;">曲阜师范大学</p>
				</div>

				<div class="ketangzhiboapp-1 hidden-lg hidden-md hidden-sm col-xs-6">
					<a href="#"><img src="img/心理学.jpg" style="width: 100%;"
						class="img-responsive center-block"></a> <a href="#"><p
							style="font-size: 0.9em; margin-bottom: 5px; margin-top: 10px;">心理学入门</p></a>
					<p style="font-size: 0.6em; color: #55B929; margin-bottom: 0px;">尚未开始</p>
					<p style="font-size: 0.6em; color: gray;">曲阜师范大学</p>
				</div>

			</div>
			<div class="row">

				<div class="ketangzhiboapp-1 hidden-lg hidden-md hidden-sm col-xs-6">
					<a href="#"><img src="img/外语.jpg" style="width: 100%;"
						class="img-responsive center-block"></a> <a href="#"><p
							style="font-size: 0.9em; margin-bottom: 5px; margin-top: 10px;">外经贸英语</p></a>
					<p style="font-size: 0.6em; color: #55B929; margin-bottom: 0px;">尚未开始</p>
					<p style="font-size: 0.6em; color: gray;">曲阜师范大学</p>
				</div>

				<div class="ketangzhiboapp-1 hidden-lg hidden-md hidden-sm col-xs-6">
					<a href="#"><img src="img/文学历史.jpg" style="width: 100%;"
						class="img-responsive center-block"></a> <a href="#"><p
							style="font-size: 0.9em; margin-bottom: 5px; margin-top: 10px;">外国文学史</p></a>
					<p style="font-size: 0.6em; color: #55B929; margin-bottom: 0px;">尚未开始</p>
					<p style="font-size: 0.6em; color: gray;">曲阜师范大学</p>
				</div>

			</div>

		</div>
	</section>
	<section class="talking "
		style="background-color: white; margin-top: 10px;">

		<div class="container">
			<p class=" hidden-lg hidden-md hidden-sm col-xs-12"
				style="margin: 10px 0px 10px 0px; padding-left: 0px;">精彩讨论</p>
			<div class="row hidden-lg hidden-md hidden-sm"
				style="background-color: pink; margin: 40px 0px 5px 0px;">

				<div class="row" style="margin-top: 10px;">
					<div class=" col-xs-6" style="height: 30px; padding-left: 5%;">
						<img src="img/头像.jpg" class="img-responsive"
							style="width: 30px; height: 30px; border-radius: 25px; display: inline-block;">
						<p style="font-size: 0.9em; display: inline-block;">黎晴&nbsp;老师







						
						<p>
					</div>

					<div class="col-xs-6 " style="height: 30px; padding-left: 20%;">
						<p style="font-size: 0.9em;">来自软件学院</p>
					</div>
				</div>
				<div class="row">
					<div class="hidden-lg hidden-md hidden-sm col-xs-12 text-center"
						style="height: 100px;">

						<a href="question-view.jsp?question_id=47nJs648yw9K8e3"
							style="text-decoration: none;"><p
								style="font-size: 1.2em; margin-top: 7%;">如何在考研时每天保持十小时以上高效学习?</p></a>
					</div>

				</div>
				<div class="row">
					<div class="col-xs-12 text-center" style="text-align: center;">
						<p style="font-size: 0.9em;">1549人在此讨论</p>
					</div>
				</div>
			</div>
			<div class="row hidden-lg hidden-md hidden-sm"
				style="background-color: #BCE8F1; margin: 5px 0px 15px 0px;">

				<div class="row" style="margin-top: 10px;">
					<div class=" col-xs-6" style="height: 30px; padding-left: 5%;">
						<img src="img/头像.jpg" class="img-responsive"
							style="width: 30px; height: 30px; border-radius: 25px; display: inline-block;">
						<p style="font-size: 0.9em; display: inline-block;">欧阳箫&nbsp;老师







						
						<p>
					</div>

					<div class="col-xs-6 " style="height: 30px; padding-left: 20%;">
						<p style="font-size: 0.9em;">来自外国语学院</p>
					</div>
				</div>
				<div class="row">
					<div class=" col-xs-12 text-center" style="height: 100px;">

						<a href="question-view.jsp?question_id=ji9043lHcjB1gp2"
							style="text-decoration: none;"><p
								style="font-size: 1.2em; margin-top: 7%;">大学生在大学期间应该如何提高自己的专业知识和运用能力？</p></a>
					</div>

				</div>
				<div class="row">
					<div class="col-xs-12 text-center" style="text-align: center;">
						<p style="font-size: 0.9em;">1549人在此讨论</p>
					</div>
				</div>
			</div>

		</div>

	</section>


	<!--移动端智能课堂-->
	<div class="made scrollbox hidden-md hidden-sm hidden-lg mui-col-xs-12"
		id="horizontal" style="margin-top: 10px;">
		<p style="padding-top: 10px; padding-bottom: 10px; margin-left: 3%;">智能课堂</p>
		<div class="madegame">

			<ul class="clearfix" id="ho">

				<li><a href="judgeStatus4.jsp"><img src="img/课堂底色1.png"
						class="gameImg"
						style="width: 100%; height: 200px; padding-left: 3%; padding-right: 5%;" /></a>

				</li>
				<li><a href="judgeStatus4.jsp"><img src="img/课堂底色2.png"
						class="gameImg"
						style="width: 100%; height: 200px; padding-right: 5%;" /></a></li>
				<li><a href="judgeStatus4.jsp"><img src="img/课堂底色3.png"
						class="gameImg"
						style="width: 100%; height: 200px; padding-right: 5%;" /></a></li>
				<li><a href="judgeStatus4.jsp"><img src="img/课堂底色4.png"
						class="gameImg"
						style="width: 100%; height: 200px; padding-right: 5%;" /></a></li>
				<li><a href="judgeStatus4.jsp"><img src="img/课堂底色5.png"
						class="gameImg"
						style="width: 100%; height: 200px; padding-right: 5%;" /></a></li>
				<li><a href="judgeStatus4.jsp"><img src="img/课堂底色6.png"
						class="gameImg"
						style="width: 100%; height: 200px; padding-right: 5%;" /></a></li>
				<li><a href="judgeStatus4.jsp"><img src="img/课堂底色7.png"
						class="gameImg" style="width: 100%; height: 200px;" /></a></li>

			</ul>
		</div>
	</div>
	<span class="blank" style="height: 30px;"></span>
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



	<!--；移动端智能课堂模板js-->
	<script>
		(function($) {
			$(window).load(function() {

				$.mCustomScrollbar.defaults.theme = "light-2"; //set "light-2" as the default theme

				$("#ho").mCustomScrollbar({
					axis : "x",
					advanced : {
						autoExpandHorizontalScroll : true
					}
				});

			});
		})(jQuery);
	</script>
	<!--移动端-->
	<script type="text/javascript">
		$('#search_button').on('click',function(){
			window.open("https://www.baidu.com/s?wd=" + $('#search_text').val());
		});
	</script>


</body>

</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>视频直播</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<!--引入bootstrap样式文件-->
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<!--layui框架引入-->
<link href="layui/css/layui.css" rel="stylesheet" />
<!--内嵌CSS代码-->
<link rel="stylesheet" href="css/stylesheet.css">
<!--该页面基本css代码-->
<link href="css/main.css" rel="stylesheet" />
<script src="js/menu.js"></script>
<style type="text/css">
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

footer>section>div>ul>li {
	display: block;
}

.media-container {
	width: 600px;
}
</style>
</head>

<body>
	<%
		request.setCharacterEncoding("utf-8");
		String room_id = request.getParameter("room-id");
		HttpSession session2 = request.getSession();
		String username = (String) session2.getAttribute("username");
		String name = (String) session2.getAttribute("name");
		if (username == null) {
			response.sendRedirect(request.getContextPath() + "/entry.html");
		}
	%>
	<!--顶部导航栏-->
	<header class="container" style="width: 100%;">
		<!--顶部共分为两行：1.logo、登录注册、搜索框、APP下载 2.导航栏区域-->
		<!--第一行区域：logo、登录注册、搜索框、APP下载-->
		<div class="header-line1">
			<!--Logo-->
			<img src="img/logo1.png" class="img-responsive" />
			<!--登录注册-->
			<div class="header-user">
				<a href="judgeStatus2.jsp"><%=name %></a>
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
	<sql:setDataSource var="room" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://154.8.194.176:3306/iteach?useUnicode=true"
		user="iteach" password="iteach123" />

	<sql:query dataSource="${room}" var="result">
	 			SELECT topic_name,topic_introduce,topic_style FROM topic_room WHERE topic_id="<%=room_id%>";;
			 </sql:query>

	<section class="make-center" style="min-height: 800px;">
		<!--隐藏房间码输入框及房间开启按钮：由自动生成房间码及jsp进行设置再由js执行按钮点击事件-->
		<c:forEach var="row" items="${result.rows}">
			<h1>话题名称：${row.topic_name}</h1>
			<p>话题简介：${row.topic_introduce}</p>
			<p>话题类型：${row.topic_style}</p>
			<p style="font-size: 15px;">请确保您的摄像头已经打开，如若无法正常使用请尝试刷新页面。</p>
		</c:forEach>
		<div style="display: none">
			<input type="text" id="room-id" autocomplete="off" autocorrect="off"
				autocapitalize="off" size=20 />
			<button id="join-room">Join Room</button>
		</div>
		<div id="videos-container" style="margin: 20px 0;"></div>

		<div id="room-urls"
			style="text-align: center; display: none; background: #F1EDED; margin: 15px -10px; border: 1px solid rgb(189, 189, 189); border-left: 0; border-right: 0;"></div>
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
	<script src="js/RTCMultiConnection.min.js"></script>
	<script src="js/adapter.js"></script>
	<script
		src="https://rtcmulticonnection.herokuapp.com/socket.io/socket.io.js"></script>

	<!-- custom layout for HTML5 audio/video elements -->
	<link rel="stylesheet" href="css/getHTMLMediaElement.css">
	<script src="js/getHTMLMediaElement.js"></script>
	<script>
			// ......................................................
			// .......................UI Code........................
			// ......................................................

			document.getElementById('join-room').onclick = function() {
				disableInputButtons();
				connection.join(document.getElementById('room-id').value);
			};

			// ......................................................
			// ..................RTCMultiConnection Code.............
			// ......................................................

			var connection = new RTCMultiConnection();

			// by default, socket.io server is assumed to be deployed on your own URL
			connection.socketURL = '/';

			// comment-out below line if you do not have your own socket.io server
			connection.socketURL = 'https://rtcmulticonnection.herokuapp.com:443/';

			connection.socketMessageEvent = 'video-conference-demo';

			connection.session = {
				audio: true,
				video: true
			};

			connection.sdpConstraints.mandatory = {
				OfferToReceiveAudio: true,
				OfferToReceiveVideo: true
			};

			connection.videosContainer = document.getElementById('videos-container');
			connection.onstream = function(event) {
				var existing = document.getElementById(event.streamid);
				if(existing && existing.parentNode) {
					existing.parentNode.removeChild(existing);
				}

				event.mediaElement.removeAttribute('src');
				event.mediaElement.removeAttribute('srcObject');
				event.mediaElement.muted = true;
				event.mediaElement.volume = 0;

				var video = document.createElement('video');

				try {
					video.setAttributeNode(document.createAttribute('autoplay'));
					video.setAttributeNode(document.createAttribute('playsinline'));
				} catch(e) {
					video.setAttribute('autoplay', true);
					video.setAttribute('playsinline', true);
				}

				if(event.type === 'local') {
					video.volume = 0;
					try {
						video.setAttributeNode(document.createAttribute('muted'));
					} catch(e) {
						video.setAttribute('muted', true);
					}
				}
				video.srcObject = event.stream;

				var width = parseInt(connection.videosContainer.clientWidth / 3) - 20;
				var mediaElement = getHTMLMediaElement(video, {
					title: event.userid,
					buttons: ['full-screen'],
					width: width,
					showOnMouseEnter: false
				});

				connection.videosContainer.appendChild(mediaElement);

				setTimeout(function() {
					mediaElement.media.play();
				}, 5000);

				mediaElement.id = event.streamid;
			};

			connection.onstreamended = function(event) {
				var mediaElement = document.getElementById(event.streamid);
				if(mediaElement) {
					mediaElement.parentNode.removeChild(mediaElement);
				}
			};

			connection.onMediaError = function(e) {
				if(e.message === 'Concurrent mic process limit.') {
					if(DetectRTC.audioInputDevices.length <= 1) {
						alert('Please select external microphone. Check github issue number 483.');
						return;
					}

					var secondaryMic = DetectRTC.audioInputDevices[1].deviceId;
					connection.mediaConstraints.audio = {
						deviceId: secondaryMic
					};

					connection.join(connection.sessionid);
				}
			};

			// ..................................
			// ALL below scripts are redundant!!!
			// ..................................

			function disableInputButtons() {
				document.getElementById('room-id').onkeyup();
				document.getElementById('join-room').disabled = true;
				document.getElementById('room-id').disabled = true;
			}

			// ......................................................
			// ......................Handling Room-ID................
			// ......................................................

			function showRoomURL(roomid) {
				var roomHashURL = '#' + roomid;
				var roomQueryStringURL = '?roomid=' + roomid;

				var html = '<h2>Unique URL for your room:</h2><br>';

				html += 'Hash URL: <a href="' + roomHashURL + '" target="_blank">' + roomHashURL + '</a>';
				html += '<br>';
				html += 'QueryString URL: <a href="' + roomQueryStringURL + '" target="_blank">' + roomQueryStringURL + '</a>';

				var roomURLsDiv = document.getElementById('room-urls');
				roomURLsDiv.innerHTML = html;

				roomURLsDiv.style.display = 'block';
			}

			(function() {
				var params = {},
					r = /([^&=]+)=?([^&]*)/g;

				function d(s) {
					return decodeURIComponent(s.replace(/\+/g, ' '));
				}
				var match, search = window.location.search;
				while(match = r.exec(search.substring(1)))
					params[d(match[1])] = d(match[2]);
				window.params = params;
			})();

			var roomid = '';
			if(localStorage.getItem(connection.socketMessageEvent)) {
				roomid = localStorage.getItem(connection.socketMessageEvent);
			} else {
				roomid = connection.token();
			}
			document.getElementById('room-id').value = roomid;
			document.getElementById('room-id').onkeyup = function() {
				localStorage.setItem(connection.socketMessageEvent, document.getElementById('room-id').value);
			};

			var hashString = location.hash.replace('#', '');
			if(hashString.length && hashString.indexOf('comment-') == 0) {
				hashString = '';
			}

			var roomid = params.roomid;
			if(!roomid && hashString.length) {
				roomid = hashString;
			}

			if(roomid && roomid.length) {
				document.getElementById('room-id').value = roomid;
				localStorage.setItem(connection.socketMessageEvent, roomid);

				// auto-join-room
				(function reCheckRoomPresence() {
					connection.checkPresence(roomid, function(isRoomExist) {
						if(isRoomExist) {
							connection.join(roomid);
							return;
						}

						setTimeout(reCheckRoomPresence, 5000);
					});
				})();

				disableInputButtons();
			}

			// detect 2G
			if(navigator.connection &&
				navigator.connection.type === 'cellular' &&
				navigator.connection.downlinkMax <= 0.115) {
				alert('2G is not supported. Please use a better internet service.');
			}
		</script>
	<script src="https://cdn.webrtc-experiment.com/common.js"></script>
	<script type="text/javascript">
			//将生成的随机码填入到隐藏的房间号按钮中，需要延时执行，开启聊天室期间使用遮罩遮盖
			var room_id=document.getElementById("room-id");
			setTimeout(function(){room_id.value="<%=room_id%>";
			document.getElementById("join-room").click();
		}, 1);
	</script>
	<script type="text/javascript">
	
			$('#search_button').on('click',function(){
				window.open("https://www.baidu.com/s?wd=" + $('#search_text').val());
			});
		</script>
</body>
</html>
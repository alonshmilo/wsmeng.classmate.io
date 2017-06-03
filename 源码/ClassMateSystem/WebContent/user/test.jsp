<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>同学会个人主页</title>
<link rel="stylesheet" href="../css/pintuer.css">
<link rel="stylesheet" href="../css/admin.css">
<script src="../js/jquery.js"></script>
</head>
<body style="background-color: #f2f9fd;">
	<div class="header bg-main">
		<div class="logo margin-big-left fadein-top">
			<h1>
				<img src="<%=request.getContextPath()%>/GetImageServlet"
					class="radius-circle rotate-hover" height="50" alt="" />同学会个人主页
			</h1>
		</div>
	</div>
	<div class="leftnav">
		<div class="leftnav-title">
			<strong><span class="icon-list"></span>菜单列表</strong>
		</div>
		<h2>
			<span class="icon-user"></span>基本功能
		</h2>
		<ul style="display: block">
			<li><a href="../mainpage.jsp" target="right" onclick="disYes()"><span
					class="icon-caret-right"></span>主页</a></li>
			<li><a href="userinfo.jsp" target="right" onclick="disYes()"><span
					class="icon-caret-right"></span>个人信息</a></li>
			<li><a href="../guestbook.jsp" target="right" onclick="disYes()"><span
					class="icon-caret-right"></span>留言板</a></li>

		</ul>
		<h2>
			<span class="icon-pencil-square-o"></span>活动管理
		</h2>
		<ul>
			<li><a href="activeAnnounce.jsp" target="right"
				onclick="disYes()"><span class="icon-caret-right"></span>活动通知</a></li>
		</ul>
		<h2>
			<span class="icon-pencil-square-o"></span>费用管理
		</h2>
		<ul>
			<li><a href="costAnnounce.jsp" target="right" onclick="disYes()"><span
					class="icon-caret-right"></span>费用公告</a></li>
		</ul>
		<h2>
			<span class="icon-pencil-square-o"></span>关于问卷
		</h2>
		<ul>
			<li>
				<h2>
					<span class="icon-pencil-square-o">发布问卷</span>
				</h2>
				<ul>
					<li><a href="../questionReport.jsp" target="right" onclick="disYes()"><span
							class="icon-caret-right"></span>定义问卷</a></li>
					<li><a href="../singleQustion.jsp" target="right" onclick="disYes()"><span
							class="icon-caret-right"></span>单选</a></li>
					<li><a href="../multipleQuestion.jsp" target="right" onclick="disYes()"><span
							class="icon-caret-right"></span>多选</a></li>
					<li><a href="../gapQuestion.jsp" target="right" onclick="disYes()"><span
							class="icon-caret-right"></span>填空</a></li>
					<li><a href="../judgeQuestion.jsp" target="right" onclick="disYes()"><span
							class="icon-caret-right"></span>判断</a></li>
				</ul>
			</li>
			<li><a href="../allReport.jsp" target="right" onclick="disYes()"><span
					class="icon-caret-right"></span>查看问卷</a></li>
		</ul>
	</div>
	<script type="text/javascript">
		$(function() {
			$(".leftnav h2").click(function() {
				$(this).next().slideToggle(200);
				$(this).toggleClass("on");
			})
			$(".leftnav ul li a").click(function() {
				$("#a_leader_txt").text($(this).text());
				$(".leftnav ul li a").removeClass("on");
				$(this).addClass("on");
			})
		});
		function disNone() {
			var li = document.getElementById("contact");
			li.style.display = "none";
		}
		function disYes() {
			var li = document.getElementById("contact");
			li.style.display = "block";
		}
	</script>
	<ul class="bread">
		<li><a href="main.jsp" target="right" class="icon-home"
			onclick="disNone()">首页</a></li>
		<li id="contact"><a href="##" id="a_leader_txt">首页</a></li>

	</ul>
	<div class="admin">
		<iframe scrolling="auto" src="usermain.jsp" name="right" width="100%"
			height="100%"></iframe>
	</div>

</body>
</html>
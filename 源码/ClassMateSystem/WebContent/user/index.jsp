<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>同学会管理中心</title>
<link rel="stylesheet" href="../css/pintuer.css">
<link rel="stylesheet" href="../css/admin.css">
<script src="../js/jquery.js"></script>
</head>
<body style="background-color: #f2f9fd;">
	<div class="header bg-main">
		<div class="logo margin-big-left fadein-top">
			<h1>
				<img src="<%= request.getContextPath() %>/GetImageServlet" class="radius-circle rotate-hover"
					height="50" alt="" />同学会管理中心
			</h1>
		</div>
		<div class="head-l">
			<a class="button button-little bg-green" href="test.jsp" target="_self"><span
				class="icon-home"></span> 前台首页</a> &nbsp;&nbsp;
			<a href="##" class="button button-little bg-blue"><span class="icon-wrench"></span>
				清除缓存</a> &nbsp;&nbsp;
			<a class="button button-little bg-red"
				href="../other.jsp"><span class="icon-power-off"></span> 退出登录</a>
		</div>
	</div>
	<div class="leftnav">
		<div class="leftnav-title">
			<strong><span class="icon-list"></span>菜单列表</strong>
		</div>
		<h2>
			<span class="icon-user"></span>基本设置
		</h2>
		<ul style="display: block">
			<li><a href="../right.jsp" target="right" onclick="disYes()"><span
					class="icon-caret-right"></span>通讯录管理</a></li>
			<li><a href="../message.jsp" target="right" onclick="disYes()"><span
					class="icon-caret-right"></span>信息管理</a></li>
		</ul>
		<h2>
			<span class="icon-pencil-square-o"></span>活动管理
		</h2>
		<ul>
			<li><a href="../active.jsp" target="right" onclick="disYes()"><span
					class="icon-caret-right"></span>活动发布</a></li>
			<li><a href="../message.jsp" target="right" onclick="disYes()"><span
					class="icon-caret-right"></span>发布通知</a></li>
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
		function disNone(){
			var li = document.getElementById("contact");
			li.style.display = "none";
		}
		function disYes(){
			var li = document.getElementById("contact");
			li.style.display = "block";
		}
	</script>
	<ul class="bread">
		<li><a href="main.jsp" target="right" class="icon-home" onclick="disNone()">首页</a></li>
		<li id="contact"><a href="##" id="a_leader_txt">通讯录管理</a></li>

	</ul>
	<div class="admin">
		<iframe scrolling="auto" src="main.jsp" name="right" width="100%"
			height="100%"></iframe>
	</div>

</body>
</html>
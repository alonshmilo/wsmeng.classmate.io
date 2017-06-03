<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery1.js"></script>
</head>
<body>
	<div class="mainindex">
		<div class="welinfo">
			<span><img src="../images/sun.png" alt="天气" /></span> <b><%=session.getAttribute("ManagerName")%>早上好，欢迎使用信息管理系统</b>
			<a href="#">帐号设置</a>
		</div>
		<div class="xline"></div>
		<ul class="iconlist">
			<li><img src="../images/ico01.png" />
			<p>
					<a href="#">管理设置</a>
				</p></li>
			<li><img src="../images/ico02.png" />
			<p>
					<a href="#">发布文章</a>
				</p></li>
			<li><img src="../images/ico03.png" />
			<p>
					<a href="#">数据统计</a>
				</p></li>
			<li><img src="../images/ico04.png" />
			<p>
					<a href="#">文件上传</a>
				</p></li>
			<li><img src="../images/ico05.png" />
			<p>
					<a href="#">目录管理</a>
				</p></li>
			<li><img src="../images/ico06.png" />
			<p>
					<a href="#">查询</a>
				</p></li>
		</ul>
		
		<div class="xline"></div>
		<div class="box"></div>
		<div class="welinfo">
			<span><img src="../images/dp.png" alt="提醒" /></span> <b>同学会管理系统使用指南</b>
		</div>
		<ul class="infolist">
			<li><span>您可以快速进行公告、活动发布管理操作</span><a class="ibtn">发布或管理文章</a></li>
			
			<li><span>您可以进行密码修改、账户设置等操作</span><a class="ibtn">账户管理</a></li>
		</ul>
	</div>
</body>
</html>

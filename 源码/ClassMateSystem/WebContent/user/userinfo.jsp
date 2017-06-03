<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*, com.dt.bean.*, com.dt.DAO.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="../js/jquery.js" type="text/javascript"></script>
<script src="../js/v2js.js" type="text/javascript"></script>
<link href="../css/css.css" rel="stylesheet" />
</head>
<body>
	<div class="w960  clf">
		<div class="m_left">
			<div class="inner mt12 p0">
				<div class="hd">
					<h3>个人信息</h3>
				</div>
				<div class="bd">
					<%
						int StudentID = (int)session.getAttribute("ManagerID");
						StudentInfo info = StudentDAO.queryStudentInfo(StudentID);
						AdressInfo adressInfo = AdressDAO.getAdressInfo(info.getAddress_id());
					%>
					<ul class="detail-list">
						<li><i class="i-nc"></i>姓名：<span><%= info.getStudent_name() %></span></li>
						<li><i class="i-dj"></i>等级：<span><%= info.getStudent_grade() == 1 ? "管理员" : "普通用户" %></span></li>
						<li><i class="i-ip"></i>邮箱：<span><%= info.getStudent_email() %></span></li>
						<li><a href="uploadImage.jsp">上传头像</a></li>
					</ul>
				</div>
			</div>
			<div class="inner mt12 p0">
				<div class="hd">
					<h3>最近访客</h3>
				</div>
				<div class="bd">
					<ul class="avatar-list clf">
						<li><a href="#" target="_blank"><img
								src="../images/head_snew.jpg" alt="十二的头像"/>
							<div class="a-name">十二</div> </a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="m_main">
			<div class="inner">
				<div class="hd">
					<h3>基本资料</h3>
				</div>
				<div class="infos">
					姓名：<%= info.getStudent_name() %><br/> 目前所在地：<%= adressInfo.getAdress_City() %>
					&nbsp;<%= adressInfo.getAdress_Down() %><br/>
					家乡所在地：<%= adressInfo.getAdress_City() %>&nbsp;<%= adressInfo.getAdress_Down() %>
					&nbsp;<%= adressInfo.getAdress_Number() %><br/> 邮箱：<%= info.getStudent_email() %><br/>
				</div>
			</div>
			<a style="opacity: 0;" id="topcontrol" href="javascript:;"
				title="返回顶部"></a>
		</div>
	</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*, com.dt.bean.*, com.dt.DAO.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/v2js.js" type="text/javascript"></script>
<link href="css/css.css" rel="stylesheet">
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
						<li><a href="<%=request.getContextPath() %>/user/uploadImage.jsp" target="_parent">上传头像</a></li>
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
								src="images/head_snew.jpg" alt="十二的头像" />
								<div class="a-name">十二</div> </a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="m_main">
			<div class="inner">
				<div class="quote_f">
					<form action="<%= request.getContextPath() %>/PostMoodServlet" name="form1" method="post">
						<input name="STUDENT_ID" type="hidden" value="<%= session.getAttribute("ManagerID")%>"/>
						<input name="STUDENT_NAME" type="hidden" value="<%= session.getAttribute("ManagerName") %>"/>
						<textarea style="color: rgb(0, 0, 0);" cols="60" name="MOOD_CONTEXT" rows="3"
								id="msg" onfocus="iCc(this)"></textarea> <br/>
						<input id="pltj" value="发&nbsp;表" class="anbu" type="submit"/>
					</form>
				</div>
			</div>
			<div class="inner">
				<div class="hd">
					<h3>
						<a href="#" target="_blank">全部动态</a>
					</h3>
				</div>
				<%
					List<MoodInfo> infoList = MoodDAO.getAllMoodInfo();
					for(MoodInfo inf : infoList){
				%>
				<div class="i_xx clf">
					<a href="#" target="_blank"><img src="<%= request.getContextPath() %>/GetFlowImageServlet?StudentID=<%= inf.getStudentID() %>"
						class="litpic" alt="<%= inf.getStudentName() %>">
					</a>
					<p class="c_meta">
						<a href="#" target="_blank"><%= inf.getStudentName() %></a><span class="c_time"><%= inf.getPostDate() %></span>
					</p>
					<%= inf.getMoodContext() %>
				</div>
				<%
					}
				%>
			</div>
			<div class="inner more">
				<a href="#">更多内容&gt;&gt;</a>
			</div>
		</div>
	</div>
</body>
</html>
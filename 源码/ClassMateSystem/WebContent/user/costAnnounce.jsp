<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page language="java" import="com.dt.bean.*, com.dt.DAO.*, java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>无标题文档</title>
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
						<li><i class="i-dj"></i>等级：<span><%= info.getStudent_grade() == 1 ? "管理员" : "普通用户" %></li>
						<li><i class="i-ip"></i>邮箱：<span><%= info.getStudent_email() %></span></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="m_main">
			<div class="inner">
				<div class="hd">
					<h3>费用通告</h3>
				</div>
				<div class="infos">
					<div id="tab2" class="tabson">
						<table class="tablelist">
							<thead>
								<tr>
									<th>标题</th>
									<th>发布人</th>
									<th>发布时间</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<%
									List<ActiveInfo> infoList = null;
									infoList = ActiveDAO.getAllActiveInfo();
									for(ActiveInfo activeInfo : infoList){
								%>
								<tr>
									<th><%=activeInfo.getActiveName()%></th>
									<th><%=activeInfo.getStudentName()%></th>
									<th><%=activeInfo.getPost_date()%></th>
									<th><a href="fullMessage.jsp?active_id=<%= activeInfo.getActiveID() %>">查看详细内容</a></th>
								<%	} %>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<a style="opacity: 0;" id="topcontrol" href="javascript:;"
				title="返回顶部"></a>
		</div>

	</div>
</body>
</html>
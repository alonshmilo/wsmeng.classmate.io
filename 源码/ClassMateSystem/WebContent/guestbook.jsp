<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*, com.dt.bean.*, com.dt.DAO.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员的空间留言页</title>
<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/v2js.js" type="text/javascript"></script>
<link href="css/css.css" rel="stylesheet" />
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
						int HostID = (int)session.getAttribute("ManagerID");
						StudentInfo info = StudentDAO.queryStudentInfo(HostID);
						AdressInfo adressInfo = AdressDAO.getAdressInfo(info.getAddress_id());
					%>
					<ul class="detail-list">
						<li><i class="i-nc"></i>姓名：<span><%= info.getStudent_name() %></span></li>
						<li><i class="i-dj"></i>等级：<span><%= info.getStudent_grade() == 1 ? "管理员" : "普通用户" %></span></li>
						<li><i class="i-ip"></i>邮箱：<span><%= info.getStudent_email() %></span></li>
						<li><a href="<%=request.getContextPath() %>/user/uploadImage.jsp">上传头像</a></li>
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
								src="images/head_snew.jpg" alt="十二的头像"/>
									<div class="a-name">十二</div></a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="m_main">
			<div class="inner">
				<div class="hd">
					<h3>会员的留言本</h3>
				</div>
				<div class="comm_content">
					<%
						List<WordsInfo> infoList = WordsDAO.getAllWordsInfoBaseHostID(HostID);
						int count = 0;
						for(WordsInfo inf : infoList){
					%>
					<div class="c_list clf">
						<div class="c_hpic">
							<a href="#" title="xutong7700" target="_blank"><img
								src="<%= request.getContextPath() %>/GetFlowImageServlet?StudentID=<%= inf.getGuestID() %>" alt="#" height="50" width="50"/></a>
						</div>
						<div class="c_fr">
							<p class="c_meta">
								<a href="#" target="_blank"><%= inf.getStudentName() %></a><span class="c_time"><%= inf.getPostDate() %></span>
							</p>
							<div class="c_nr"><%= inf.getWordsContext() %></div>
						</div>
					</div>
					<%
							count++;
						}
					%>
					<div id="pl_page">
						<div class="pagelistbox">
							<span>共 1 页/<%= count %>条记录</span>
						</div>
					</div>
					<div class="cl"></div>
				</div>
			</div>
			<div class="inner">
				<div class="hd">
					<h3>给他留言</h3>
				</div>
				<div class="quote_f">
					<%
						List<StudentInfo> studentInfoList = null;
						studentInfoList = StudentDAO.getStudentInfo();
					%>
					<form action="<%= request.getContextPath() %>/PostWordsServlet" name="form1" method="post">
						选择同学留言：<select name="STUDENT_EMAIL">
							<%
								for(StudentInfo inf : studentInfoList){
							%>
								<option value="<%= inf.getStudent_email() %>"><%= inf.getStudent_name() %></option>
							<%
								}
							%>
							</select>
						<input name="GUEST_ID" type="hidden" value="<%= session.getAttribute("ManagerID")%>"/>
						<input name="STUDENT_NAME" type="hidden" value="<%= session.getAttribute("ManagerName") %>"/>
						<textarea style="color: rgb(0, 0, 0);" cols="60" name="WORDS_CONTEXT" rows="5"
								id="msg" onfocus="iCc(this)"></textarea> <br/>
						<input id="pltj" value="提&nbsp;交" class="anbu" type="submit"/>
					</form>
				</div>
			</div>
		</div>
	</div>
	<a style="opacity: 0;" id="topcontrol" href="javascript:;" title="返回顶部"></a>
</body>
</html>

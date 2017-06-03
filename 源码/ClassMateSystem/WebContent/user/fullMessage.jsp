<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page language="java" import="com.dt.bean.*, com.dt.DAO.*, java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<link href="../css/css.css" rel="stylesheet" />
<link href="../css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="../js/select-ui.min.js"></script>
<script type="text/javascript" src="../js/kindeditor.js"></script>

<script type="text/javascript">
	KE.show({
		id : 'content7',
		cssPath : './index.css'
	});
</script>

<script type="text/javascript">
	$(document).ready(function(e) {
		$(".select1").uedSelect({
			width : 345
		});
		$(".select2").uedSelect({
			width : 167
		});
		$(".select3").uedSelect({
			width : 100
		});
	});
	var flag = 0;
	function displayNone() {
		var span = document.getElementById("hint");
		span.style.display = "none";
		setTimeout("displayNone()", 5000);
	}
	window.onload = function() {
		if (flag == 0) {
			displayNone();
		}
	}
</script>
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
						<li><i class="i-nc" style="display: inline-block"></i>姓名：<span><%= info.getStudent_name() %></span></li>
						<li><i class="i-dj"></i>等级：<span><%= info.getStudent_grade() == 1 ? "管理员" : "普通会员" %></span></li>
						<li><i class="i-ip"></i>邮箱：<span><%= info.getStudent_email() %></span></li>
						<li><a href="uploadImage.jsp">上传头像</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="m_main">
			<div class="inner">
				<div class="hd">
					<h3>费用通告</h3>
				</div>
				<div class="formbody">
		<div id="usual1" class="usual">
			<div id="tab1" class="tabson">

				
				<%
					int ActiveID = Integer.valueOf(request.getParameter("active_id"));
					ActiveInfo activeInfo = ActiveDAO.getActiveInfoBaseActiveID(ActiveID);
				%>
				<ul class="forminfo">
					<li><label>活动标题<b>*</b></label><input name="Message_Title"
						type="text" class="dfinput" value="<%= activeInfo.getActiveName() %>" style="width: 518px;" 
						disabled="disabled"/></li>
					<li>
						<label>活动状态<b>*</b></label><input name="Message_Title"
						type="text" class="dfinput" value="<%= activeInfo.getIsFinish() == 1 ? "完成" : "未完成" %>" style="width: 518px;" 
						disabled="disabled"/>
					</li>
					<li>
						<label>活动花费<b>*</b></label><input name="Message_Title"
						type="text" class="dfinput" value="<%= activeInfo.getActiveCost() %>" style="width: 518px;" 
						disabled="disabled"/>
					</li>
					<li><label>活动内容<b>*</b></label> <textarea
							name="Message_Context" class="textinput" disabled="disabled"><%= activeInfo.getActiveContext() %></textarea>
					</li>
				</ul>
			</div>
		</div>
		<script type="text/javascript">
			$("#usual1 ul").idTabs();
		</script>
		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>
	</div>
			</div>
			<a style="opacity: 0;" id="topcontrol" href="javascript:;"
				title="返回顶部"></a>
		</div>

	</div>

</body>
</html>
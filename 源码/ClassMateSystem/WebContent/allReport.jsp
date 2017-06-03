<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*, com.dt.bean.*, com.dt.DAO.*" %>
<%@ page language="java" import="java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script type="text/javascript" src="js/kindeditor.js"></script>
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
	<div class="formbody">
		<div id="usual1" class="usual">

			<div class="itab">
				<ul>
					<li><a href="#tab2" class="selected">查询通知</a></li>
				</ul>
			</div>
			<div id="tab2" class="tabson">
				<table class="tablelist">
					<thead>
						<tr>
							<th></th>
							<th>编号<i class="sort"><img src="images/px.gif" /></i></th>
							<th>问卷题目</th>
							<th>发布者</th>
							<th>结束时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<%
						List<QuestionReportInfo> infos = QuestionReportDAO.findAll();
						int count = 1;
						for(QuestionReportInfo info : infos){
					%>
					<tbody>
						<tr>
							<td><input name="MessageID" type="checkbox"
								value="<%= info.getReportID() %>" /></td>
							<td><%= count %></td>
							<td><%= info.getReportTitle() %></td>
							<td><%= info.getStudentName() %></td>
							<td><%= info.getEndDate() %></td>
							<td><a href="questionSurvery.jsp?report_id=<%=info.getReportID()%>"
								class="tablelink">填写问卷</a></td>
						</tr>
					</tbody>
					<%
						count++;
						}
					%>
				</table>
			</div>
		</div>
		<script type="text/javascript">
			$("#usual1 ul").idTabs();
		</script>
		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>
	</div>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page language="java"
	import="com.dt.bean.*, java.util.*, com.dt.DAO.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
</script>
</head>
<body>
	<div class="formbody">
		<div id="usual1" class="usual">
			<div class="itab">
				<ul>
					<li><a href="#tab1">修改活动</a></li>
				</ul>
			</div>
			<form action="<%=request.getContextPath()%>/ChangeActiveInfoServlet"
				method="post">
				<div id="tab1" class="tabson">
					<%
						int ActiveID = Integer.valueOf(request.getParameter("params"));
						ActiveInfo info = ActiveDAO.getActiveInfoBaseActiveID(ActiveID);
					%>
					<div class="formtext">
						Hi，<b><%=session.getAttribute("ManagerName")%></b>，欢迎您使用修改活动功能！ <br />
						<%
							String message = (String)request.getAttribute("failure");
							if(message != null){
						%>
						<%= message %>
						<%
							}
						%>
					</div>
					<input type="hidden" name="active_id" value="<%=ActiveID  %>">
					<ul class="forminfo">
						<li><label>活动标题<b>*</b></label><input name="active_name"
							type="text" class="dfinput" value="<%=info.getActiveName()%>"
							style="width: 518px;" disabled="disabled" /></li>
						<li><label>活动类型<b>*</b></label>
							<div class="vocation">
								<select name="active_descripe" class="select1"
									disabled="disabled">
									<option><%=info.getActiveDesc()%></option>
								</select>
							</div></li>
						<li><label>收支类型<b>*</b></label>
							<div class="usercity">
								<div class="vocation">
									<select name="active_type" class="select1" disabled="disabled">
										<option><%=info.getActiveType() == 1 ? "收取会费" : "支出会费"%></option>
									</select>
								</div>
							</div></li>
						<li><label>活动费用<b>*</b></label><input name="active_cost"
							type="text" class="dfinput" value="0"/></li>
						<li><label>活动内容<b>*</b></label> <textarea
								name="active_context" cols="" rows="" class="textinput"
								disabled="disabled"><%=info.getActiveContext()%></textarea></li>
						<li><label>&nbsp;</label><input name="" type="submit"
							class="btn" value="确认发布" /></li>
					</ul>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
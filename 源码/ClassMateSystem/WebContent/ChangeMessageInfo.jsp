<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page language="java"
	import="com.dt.DAO.*, java.util.*, com.dt.bean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script type="text/javascript" src="js/kindeditor.js"></script>
<script type="text/javascript">
	$(document).ready(function(e) {
		$(".select1").uedSelect({
			width : 345
		});
	});
</script>
<title>修改信息</title>
</head>
<body>
	<form action="<%= request.getContextPath() %>/ChangeMessageInfo" method="post">
		<div id="tab1" class="tabson">
			<%
				int MessageID = Integer.valueOf(request
						.getParameter("messageInfo_id"));
				MessageInfo info = MessageDAO.getMessageBaseMessageID(MessageID);
				String messageType = info.getMessage_Type();
			%>
			<div class="formtext">
				Hi，<b><%=session.getAttribute("ManagerName")%></b>，欢迎您试用信息修改功能！ <br>
				<%
					String promat = (String)request.getAttribute("failure");
					if(promat != null){
				%>
				<%= promat %>
				<%
					}
				%>
			</div>
			<input type="hidden" name="message_id" value="<%= MessageID %>">
			<ul class="forminfo">
				<li><label>公告标题<b>*</b></label><input name="Message_Title"
					type="text" class="dfinput" value="<%=info.getMessage_title()%>"
					style="width: 518px;" disabled="disabled" /></li>
				<li><label>内容分类<b>*</b></label>
					<div class="vocation">
						<select class="select1" name="Message_Type" disabled="disabled">
							<option><%=messageType%></option>
						</select>
					</div></li>
				<li><label>通知内容<b>*</b></label> <textarea
						name="Message_Context" class="textinput"><%=info.getMessage_Context()%></textarea>
				</li>
				<li><label>&nbsp;</label><input name="" type="submit"
					class="btn" value="确定修改" /></li>
			</ul>
		</div>
	</form>
</body>
</html>
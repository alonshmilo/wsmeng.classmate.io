<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="com.dt.bean.*, com.dt.DAO.*, java.util.*"%>
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
					<li><a href="#tab1">发布通知</a></li>
					<li><a href="#tab2" class="selected">查询通知</a></li>
				</ul>
			</div>
			<form action="<%=request.getContextPath()%>/MessagePost" method="post">
				<div id="tab1" class="tabson">

					<div class="formtext">
						Hi，<b><%=session.getAttribute("ManagerName")%></b>，欢迎您试用信息发布功能！ <br>
						<span id="hint" style="color: red;"> 
						<%
 							String successMessage = (String)request.getAttribute("success");
 							String failureMessage = (String)request.getAttribute("failure");
 							if(successMessage != null){
 						%> 
 						<%=successMessage%> 
 						<%
 							}
 							if(failureMessage != null){
 						%> 
 						<%=failureMessage%> 
 						<%
 							}
 						%>
						</span>
					</div>
					<ul class="forminfo">
						<li><label>公告标题<b>*</b></label><input name="Message_Title"
							type="text" class="dfinput" value="请填写公告标题" style="width: 518px;" /></li>
						<li><label>内容分类<b>*</b></label>
							<div class="vocation">
								<select class="select1" name="Message_Type">
									<option>学术交流</option>
									<option>活动通知</option>
									<option>心灵鸡汤</option>
									<option>经验分享</option>
									<option>日常灌水</option>
									<option>~吐槽~</option>
									<option>其他</option>
								</select>
							</div>
						</li>
						<li><label>通知内容<b>*</b></label> <textarea
								name="Message_Context" class="textinput"></textarea></li>
						<li><label>&nbsp;</label><input name="" type="submit"
							class="btn" value="马上发布" /></li>
					</ul>
				</div>
			</form>
			<div id="tab2" class="tabson">
				<form action="message.jsp">
					<ul class="seachform">
						<%
							String search_keyword = request.getParameter("search_keyword");
							String search_messageType = request.getParameter("search_messageType");
							if(search_keyword == null&&search_messageType == null){
								search_keyword = "";
								search_messageType = "";
							}
						%>
						<li><label>综合查询</label><input name="search_keyword"
							type="text" class="scinput" value="<%=search_keyword%>" /></li>
						<li><label>分组</label>
							<div class="vocation">
								<select class="select3" name="search_messageType">
									<option><%=search_messageType%></option>
									<option value="学术交流">学术交流</option>
									<option value="活动通知">活动通知</option>
									<option value="心灵鸡汤">心灵鸡汤</option>
									<option value="经验分享">经验分享</option>
									<option value="日常灌水">日常灌水</option>
									<option value="吐槽">吐槽</option>
									<option value="其他">其他</option>
								</select>
							</div></li>
						<li><label>&nbsp;</label><input name="" type="submit"
							class="scbtn" value="查询" /></li>
					</ul>
				</form>
				<table class="tablelist">
					<thead>
						<tr>
							<th></th>
							<th>编号<i class="sort"><img src="images/px.gif" /></i></th>
							<th>主题</th>
							<th>用户</th>
							<th>信息内容</th>
							<th>发布时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<%
							//查询所有的信息
							int count = 1;
							List<MessageInfo> infoList = null;
							if(search_keyword.equals("")&&search_messageType.equals("")){
							//第一次进入该页面，只是显示全部的信息
								infoList = MessageDAO.getAllMessageInfo();
							}else if(!search_keyword.equals("")&&search_messageType.equals("")){
							//只是根据Title进行模糊查询
								infoList = MessageDAO.getMessageBaseTitle(search_keyword);
							}else if(search_keyword.equals("")&&!search_messageType.equals("")){
							//根据信息分类来进行查询
								infoList = MessageDAO.getMessageBaseType(search_messageType);
							}else{
							//根据信息分类和Title来进行查询
								infoList = MessageDAO.getMessageBaseTitleAndType(search_messageType, search_keyword);
							}
							for(MessageInfo info : infoList){
						%>
						<tr>
							<td><input name="MessageID" type="checkbox"
								value="<%=info.getMessage_ID()%>" /></td>
							<td><%=count%></td>
							<td><%=info.getMessage_title()%></td>
							<td><%=info.getStudent_Name()%></td>
							<td><%=info.getMessage_Context()%></td>
							<td><%=info.getPostDate()%></td>
							<td><a
								href="ChangeMessageInfo.jsp?messageInfo_id=<%=info.getMessage_ID()%>"
								class="tablelink">修改</a></td>
						</tr>
						<%
							count++;
							}
						%>
					</tbody>
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
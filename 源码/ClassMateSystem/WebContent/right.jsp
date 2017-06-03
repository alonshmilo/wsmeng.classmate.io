<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312"%>
<%@ page import="com.dt.jdbcconnect.*, java.util.*, com.dt.DAO.*, com.dt.bean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery1.js"></script>
<script>
	function getId(){
		var lens = document.getElementsByName("singleInfo");
		var result;
		var count = 0;
		for(var i = 0; i < lens.length; i++){
			if(lens[i].checked){
				count++;
				result = lens[i].value;
			}
		}
		if(count > 1){
			alert("修改时只允许选中一行");
		}else{
			location.href = "changeinfo.jsp?param1=" + result;	
		}
	}
	function getIds(){
		var lens = document.getElementsByName("singleInfo");
		var result;
		var count = 0;
		for(var i = 0; i < lens.length; i++){
			if(lens[i].checked){
				count++;
				result = lens[i].value;
			}
		}
		if(count > 1){
			alert("删除时只允许选中一行");
		}else{
			location.href = "<%=request.getContextPath() %>/DeleteUserServlet?param1=" + result;
		}
	}
</script>
</head>
<body>
	<div class="rightinfo">
	
		<div class="tools">
			<!--
				这里是三个标签添加，修改，删除。当点击其中的某一个是都会跳转到相应的页面，来处理基本的逻辑行为
			-->
			<ul class="toolbar">
				<li onclick="javascript:location.href='<%=request.getContextPath() %>/info.jsp'" class="click">
					<span><img src="images/t01.png" /></span>添加
				</li>
				<!--
					对数据修改时，只能训中选中一行数据，选中多行数据则会出错 
				 -->
				<li onclick="getId()">
					<span><img src="images/t02.png" /></span>修改
				</li>
				<!--
					删除数据是可以选中多行数据 
				 -->
				<li onclick="getIds()">
					<span><img src="images/t03.png" /></span>删除
				</li>
			</ul>
			<ul class="toolbar1">
				<li><span><img src="images/t05.png" /></span>设置</li>
			</ul>
		</div>
		<table id="" class="tablelist">
			<thead>
				<tr>
					<th></th>
					<th>姓名<i class="sort"><img src="images/px.gif" /></i></th>
					<th>地址</th>
					<th>联系电话</th>
					<th>邮箱</th>
					<th>级别</th>
				</tr>
			</thead>
			<%
				String grade = null;
				int count = 0;
				String adress;
				List<Map<StudentInfo, AdressInfo>> infoList = StudentDAO.getAllStudentInfo();
				for(int i = 0; i < infoList.size(); i++){
					Map<StudentInfo, AdressInfo> var = infoList.get(i);
					StudentInfo studentInfo = var.keySet().iterator().next();
					AdressInfo adressInfo = var.values().iterator().next();
					if(studentInfo.getStudent_grade() == 1){
						grade = "管理员";
					}else{
						grade = "用户";
					}
					count++;
					adress = adressInfo.getAdress_City() + adressInfo.getAdress_Down() + adressInfo.getAdress_Number();
			%>
			<tbody>
				<tr>
					<td><input name="singleInfo" type="checkbox" value="<%= studentInfo.getStudent_id() %>"/></td>
					<td><%= studentInfo.getStudent_name() %></td>
					<td><%= adress %></td>
					<td><%= studentInfo.getStudent_phone() %></td>
					<td><%= studentInfo.getStudent_email() %></td>
					<td><%= grade %></td>
				</tr>
			</tbody>
			<%
				}
			%>
		</table>

		<div class="pagin">
			<div class="message">
				共<i class="blue"><%= count %></i>条记录，当前显示第&nbsp;<i class="blue">2&nbsp;</i>页
			</div>
			<ul class="paginList">
				<li class="paginItem"><a href="javascript:;"><span
						class="pagepre"></span></a></li>
				<li class="paginItem"><a href="javascript:;">1</a></li>
				<li class="paginItem current"><a href="javascript:;">2</a></li>
				<li class="paginItem"><a href="javascript:;">3</a></li>
				<li class="paginItem"><a href="javascript:;">4</a></li>
				<li class="paginItem"><a href="javascript:;">5</a></li>
				<li class="paginItem more"><a href="javascript:;">...</a></li>
				<li class="paginItem"><a href="javascript:;">10</a></li>
				<li class="paginItem"><a href="javascript:;"><span
						class="pagenxt"></span></a></li>
			</ul>
		</div>
		<%	
			String promat = (String)request.getAttribute("promat");
			if(promat != null){
		%>
		<%= promat %>
		<%	} %>

		<div class="tip">
			<div class="tiptop">
				<span>提示信息</span><a></a>
			</div>

			<div class="tipinfo">
				<span><img src="images/ticon.png" /></span>
				<div class="tipright">
					<p>是否确认对信息的修改 ？</p>
					<cite>如果是请点击确定按钮 ，否则请点取消。</cite>
				</div>
			</div>

			<div class="tipbtn">
				<input name="" type="button" class="sure" value="确定" />&nbsp; <input
					name="" type="button" class="cancel" value="取消" />
			</div>
		</div>
	</div>
</body>
</html>
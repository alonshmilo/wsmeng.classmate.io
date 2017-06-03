<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312"%>
<%@ page import="com.dt.jdbcconnect.*, java.util.*, com.dt.DAO.*, com.dt.bean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�ޱ����ĵ�</title>
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
			alert("�޸�ʱֻ����ѡ��һ��");
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
			alert("ɾ��ʱֻ����ѡ��һ��");
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
				������������ǩ��ӣ��޸ģ�ɾ������������е�ĳһ���Ƕ�����ת����Ӧ��ҳ�棬������������߼���Ϊ
			-->
			<ul class="toolbar">
				<li onclick="javascript:location.href='<%=request.getContextPath() %>/info.jsp'" class="click">
					<span><img src="images/t01.png" /></span>���
				</li>
				<!--
					�������޸�ʱ��ֻ��ѵ��ѡ��һ�����ݣ�ѡ�ж������������� 
				 -->
				<li onclick="getId()">
					<span><img src="images/t02.png" /></span>�޸�
				</li>
				<!--
					ɾ�������ǿ���ѡ�ж������� 
				 -->
				<li onclick="getIds()">
					<span><img src="images/t03.png" /></span>ɾ��
				</li>
			</ul>
			<ul class="toolbar1">
				<li><span><img src="images/t05.png" /></span>����</li>
			</ul>
		</div>
		<table id="" class="tablelist">
			<thead>
				<tr>
					<th></th>
					<th>����<i class="sort"><img src="images/px.gif" /></i></th>
					<th>��ַ</th>
					<th>��ϵ�绰</th>
					<th>����</th>
					<th>����</th>
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
						grade = "����Ա";
					}else{
						grade = "�û�";
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
				��<i class="blue"><%= count %></i>����¼����ǰ��ʾ��&nbsp;<i class="blue">2&nbsp;</i>ҳ
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
				<span>��ʾ��Ϣ</span><a></a>
			</div>

			<div class="tipinfo">
				<span><img src="images/ticon.png" /></span>
				<div class="tipright">
					<p>�Ƿ�ȷ�϶���Ϣ���޸� ��</p>
					<cite>���������ȷ����ť ���������ȡ����</cite>
				</div>
			</div>

			<div class="tipbtn">
				<input name="" type="button" class="sure" value="ȷ��" />&nbsp; <input
					name="" type="button" class="cancel" value="ȡ��" />
			</div>
		</div>
	</div>
</body>
</html>
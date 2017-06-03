<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page language="java" import="com.dt.jdbcconnect.*, java.lang.*, com.dt.bean.*
								 , com.dt.DAO.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改用户</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- CSS -->
<link rel='stylesheet'
	href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
<link rel='stylesheet'
	href='http://fonts.googleapis.com/css?family=Oleo+Script:400,700'>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/style2.css">
<script type="text/javascript">
	function check(){
		var password = document.getElementById("password");
		var repassword = document.getElementById("repassword");
		System.out.println(password.value + ":" + repassword.value);
		if(password.value != repassword.value){
			alert("密码有错误，请重新输入");
			return false;
		}else{
			return true;
		}
	}
</script>
</head>
<body>
	<div class="header">
		<div class="row" id="headertext">
			<h1>
				修改用户<span class="red">.</span>
			</h1>
		</div>
	</div>
	<%
		//从right页面中获得学生的ID，从而获取学生的信息
		int student_id = Integer.parseInt(request.getParameter("param1"));
	%>
	<div class="register-container container">
		<div class="outdiv">
			<div class="register span6" id="register">
				<form action="<%= request.getContextPath() %>/ChangeUserInfoServlet" method="post" onsubmit="return check()">
					<h2>
						<span class="red"><strong>同学会</strong></span>
					</h2>
					<%
						StudentInfo info = null;
						info = StudentDAO.queryStudentInfo(student_id);
					%>
					<input type="hidden" name="student_id" value="<%= student_id %>">
					<label>用户名</label>
					<input type="text" id="username" name="username" value="<%= info.getStudent_name() %>">
					<label>密码</label>
					<input type="password" id="password" name="password" value="请输入密码">
					<label>确认密码</label>
					<input type="password" id="repassword" name="repassword" value="请确认密码">
					<label>邮箱</label>
					<input type="text" id="email" name="email" value="<%= info.getStudent_email() %>"> 
					<label>联系电话</label>
					<input type="text" id="firstname" name="phone" value="<%= info.getStudent_phone() %>"> 
					<input type="submit" value="修改">
				</form>
			</div>
		</div>
	</div>
	<script src="js/jquery-1.8.2.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.backstretch.min.js"></script>
	<script src="js/scripts.js"></script>
	<div style="display: none">
		<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
			language='JavaScript' charset='utf-8'></script>
	</div>
</body>
</html>
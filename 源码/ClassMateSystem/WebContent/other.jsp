<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>同学会管理系统</title>
<link href="css/style1.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script type="application/x-javascript"> 
	addEventListener("load", function()
			{ setTimeout(hideURLbar, 0); }, false); 
							 function hideURLbar()
							 { window.scrollTo(0,1); }
</script>
<!--webfonts-->
<link href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<!--//webfonts-->
</head>
<body>
	<h1>同学会管理系统</h1>
		<div class="app-cam">
			<form action="<%=request.getContextPath()%>/LoginServlet" method="post" >
				<%
					String promat = (String)request.getAttribute("promat");
					request.removeAttribute("promat");
					if(promat != null){
				%>
				<p><%= promat %></p>
				<%
					}
				%>
				<input type="text" name="name" class="text" value="输入邮箱">
				<input type="password" name="password" value="输入密码" >
				<div class="submit"><input type="submit" value="登  录" ></div>
				<div class="clear"></div>
				<div class="new">
					<p><a href="#">忘记密码?</a></p>
					<p class="sign">没有账号？<a href="register.jsp"> 注册</a></p>
					<div class="clear"></div>
				</div>
			</form>
		</div>
	<!--start-copyright-->
   		<div class="copy-right">
				<p>Copyright &copy; 2017.Company name All rights reserved.<a target="_blank" ></a></p>
		</div>
	<!--//end-copyright-->
</body>
</html>
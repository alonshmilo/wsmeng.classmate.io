<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<title>注册账号</title>
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

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
</head>
<body>
	<div class="header">
		<div class="row" id="headertext">
			<h1>
				用户注册<span class="red">.</span>
			</h1>
		</div>
	</div>
	<div class="register-container container">
		<div class="outdiv">
			<div class="register span6" id="register">
				<form action="<%= request.getContextPath() %>/RegisterUserServlet" method="post">
					<h2>
						<span class="red"><strong>同学会</strong></span>注册
					</h2>
					<label>用户名</label>
					<input type="text" id="username" name="username" value="请输入用户名">
					<label>邮箱</label>
					<input type="text" id="email" name="email" value="请输入邮箱"> 
					<label>联系电话</label>
					<input type="text" id="firstname" name="phone" value="请输入联系方式"> 
					<label>密码</label> 
					<input type="password" id="password" name="password" value="请输入密码">
					<label>地址</label> 
					省：<select name="adress_provice" id="Select1"></select><br>
					 市：<select name="adress_city" id="Select2"></select><br> 
					 区：<select name="adress_down" id="Select3"></select>
					<button type="submit">注册</button>
				</form>
			</div>
		</div>
	</div>
	<script src="js/jquery-1.8.2.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.backstretch.min.js"></script>
	<script src="js/scripts.js"></script>
	<script type="text/javascript" src="js/jsAddress.js"></script>
	<script type="text/javascript">
		addressInit('Select1', 'Select2', 'Select3');
	</script>
	<div style="display: none">
		<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
			language='JavaScript' charset='gb2312'></script>
	</div>
</body>
</html>
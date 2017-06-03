<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/css.css" rel="stylesheet" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/wenjuan_ht.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script type="text/javascript" src="js/kindeditor.js"></script>
<script src="js/jquery-1.8.0.min.js"></script>
<script src="js/question.js"></script>
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
	<div class=" all_660">
		<%
			String message = (String) session.getAttribute("postMessage");
			if (message != null) {
		%>
		<%=message%><br />
		<%
			session.removeAttribute("postMessage");
			}
		%>
		<div class="xxk_box">
			<ul class="xxk_title">
				<li class="on">定义问卷</li>
			</ul>
			<div class="xxk_conn">
				<form action="<%=request.getContextPath()%>/PostReportServlet"
					method="post">
					<div class="xxk_xzqh_box tktm">
						<div id="usual1" class="usual" class="inner">
							<div id="tab1" class="tabson" class="quote_f">
								<ul class="forminfo">
									<li><label>问卷主题<b>*</b></label> <input name="reportName"
										class="dfinput" value="请输入问卷的主题" type="text"
										onblur="if(this.value == '') {this.value = '请输入问卷的主题'}"
										onfocus="if(this.value='请输入问卷的主题'){this.value = ''}"
										style="width: 518px;"/></li>
									<li><label>起始日期<b>*</b></label> <input name="postdate"
										class="dfinput" value="请输入问卷的起始日期" type="text"
										onblur="if(this.value == '') {this.value = '请输入问卷的起始日期'}"
										onfocus="if(this.value='请输入问卷的起始日期'){this.value = ''}"
										style="width: 518px;"/></li>
									<li><label>结束日期<b>*</b></label> <input name="enddate"
										value="请输入问卷的结束日期" type="text" class="dfinput"
										onblur="if(this.value == '') {this.value = '请输入问卷的结束日期'}"
										onfocus="if(this.value='请输入问卷的结束日期'){this.value = ''}"
										style="width: 518px;" /></li>
									<li><input id="pltj" value="提&nbsp;交" class="anbu" type="submit"/></li>
								</ul>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
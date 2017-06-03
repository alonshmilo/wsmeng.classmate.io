<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/wenjuan_ht.css">
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
			String message = (String)session.getAttribute("judgeMessage");
			if(message!=null){
		%>
		<%= message %><br/>
		<%
			session.removeAttribute("judgeMessage");
			}
		%>
		<div class="xxk_box">
			<ul class="xxk_title">
				<li class="on">判断</li>
			</ul>
			<div class="xxk_conn">
				<!-- 填空----------------------------------------------------------------------------------------------------------------------------------------->
				<form action="<%= request.getContextPath() %>/PostJudgeQuestionServlet" method="post">
					<div class="xxk_xzqh_box tktm">
						<textarea name="question_name" cols="" rows=""
							class="input_wenbk btwen_text btwen_text_tk"
							onblur="if(!this.value)this.value='判断题目'"
							onclick="if(this.value&&this.value=='判断题目' )  this.value=''"></textarea>

						<!--完成编辑-->
						<div class="bjqxwc_box">
							<input class="qxbj_but" disabled="disabled" value="取消编辑">
							<input type="submit" class="swcbj_but" value="完成编辑">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
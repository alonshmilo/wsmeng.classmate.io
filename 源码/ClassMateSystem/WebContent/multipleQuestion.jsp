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
			String message = (String)session.getAttribute("multipleMessage");
			if(message!=null){
		%>
		<%= message %><br/>
		<%
			session.removeAttribute("multipleMessage");
			}
		%>
		<div class="xxk_box">
			<ul class="xxk_title">
				<li class="on">多选</li>
			</ul>
			<div class="xxk_conn">
				<!--多选----------------------------------------------------------------------------------------------------------------------------------------->
				<form action="">
					<div class="xxk_xzqh_box duoxuan">
						<textarea name="question_name" cols="" rows=""
							class="input_wenbk btwen_text btwen_text_duox"
							onblur="if(!this.value)this.value='多选题目'"
							onclick="if(this.value&&this.value=='多选题目' )  this.value=''"></textarea>
						<div class="title_itram">
							<div class="kzjxx_iteam">
								 <input name="options" type="text" class="input_wenbk" value="选项"
									onblur="if(!this.value)this.value='选项'"
									onclick="if(this.value&&this.value=='选项' )  this.value=''">
									 <a href="javascript:void(0);" class="del_xm">删除</a>
							</div>
						</div>
						<a href="javascript:void(0)" class="zjxx">增加选项</a>

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
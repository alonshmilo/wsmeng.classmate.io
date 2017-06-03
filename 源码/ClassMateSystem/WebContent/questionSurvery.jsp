<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page language="java" import="com.dt.bean.*, com.dt.DAO.*, java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/css.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="css/wenjuan_ht.css">
<script src="js/jquery-1.8.0.min.js"></script>
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

	<div class="w960  clf">
		<%
			int reportID = Integer.valueOf(request.getParameter("report_id"));
			int count = 1;
		%>
		<div class="m_main" style="width: 900px;">
			<div class="inner">
				<div class="hd">
					<h3>填写调查问卷</h3>
				</div>
				<div class=" all_660">
					<div class="yd_box">
						<%
							List<QuestionInfo> singleInfos = 
												QuestionDAO.findByTypeIDAndReportID(reportID, 1);
							for(QuestionInfo info : singleInfos){
						%>
						<div class="movie_box">
							<ul class="wjdc_list">
								<li>
									<div class="tm_btitlt">
										<i class="nmb"><%= count %></i>. <i class="btwenzi"><%= info.getQuestionName() %></i><span
											class="tip_wz">【单选】</span>
									</div>
								</li>
								<%
									List<OptionInfo> infos = OptionDAO.findAll(info.getQuestionID());
									for(OptionInfo inf : infos){
								%>
								<li><label> <input name="a" type="radio" value="">
										<span><%= inf.getOptionContent() %></span></label>
								</li>
								<%
									}
								%>
							</ul>
							<div class="dx_box" data-t="0"></div>
						</div>
						<%
							count++;
							}
							List<QuestionInfo> multipleInfos = 
									QuestionDAO.findByTypeIDAndReportID(reportID, 2);
							for(QuestionInfo info : multipleInfos){
						%>
						<div class="movie_box">
							<ul class="wjdc_list">
								<li>
									<div class="tm_btitlt">
										<i class="nmb"><%= count %></i>. <i class="btwenzi"><%= info.getQuestionName() %></i><span
											class="tip_wz">【多选】</span>
									</div>
								</li>
								<%
									List<OptionInfo> infos = OptionDAO.findAll(info.getQuestionID());
									for(OptionInfo inf : infos){
								%>
								<li><label> <input name="" type="checkbox" value="">
										<span><%= inf.getOptionContent() %></span></label>
								</li>
								<%
									}
								%>
							</ul>
							<div class="dx_box" data-t="1"></div>
						</div>
						<%
							count++;
							}
							List<QuestionInfo> gapInfos = 
									QuestionDAO.findByTypeIDAndReportID(reportID, 3);
							for(QuestionInfo info : gapInfos){
						%>
						<div class="movie_box">
							<ul class="wjdc_list">
								<li>
									<div class="tm_btitlt">
										<i class="nmb"><%= count %></i>. <i class="btwenzi"><%= info.getQuestionName() %></i><span
											class="tip_wz">【填空】</span>
									</div>
								</li>
								<li><label> <textarea name="" cols="" rows=""
											class="input_wenbk btwen_text btwen_text_dx"
											onblur="if(!this.value)this.value='单选题目'"
											onclick="if(this.value&&this.value=='单选题目' )  this.value=''"></textarea>
								</label></li>
							</ul>
							<div class="dx_box" data-t="2"></div>
						</div>
						<%
							count++;
							}
							List<QuestionInfo> judgeInfos = 
									QuestionDAO.findByTypeIDAndReportID(reportID, 4);
							for(QuestionInfo info : judgeInfos){
						%>
						<div class="movie_box">
							<ul class="wjdc_list">
								<li>
									<div class="tm_btitlt">
										<i class="nmb"><%= count %></i>. <i class="btwenzi"><%= info.getQuestionName() %></i><span
											class="tip_wz">【判断】</span>
									</div>
								</li>
								<li><label> <input name="a" type="radio" value="">
										<span>是</span></label></li>
								<li><label> <input name="a" type="radio" value="">
										<span>不是</span></label></li>
							</ul>
							<div class="dx_box" data-t="0"></div>
						</div>
						<%
							count++;
							}
						%>
						<!--
						<div class="movie_box">
							<div class="wjdc_list">
								<h4 class="title_wjht">
									<i class="nmb">4</i>. 对目前的工作哪方面不满意？
								</h4>
								<table width="100%" border="0" cellspacing="0" cellpadding="0"
									class="tswjdc_table">
									<tr>
										<td class="lefttd_qk">&nbsp;</td>
										<td>非常喜欢</td>
										<td>喜欢</td>
										<td>一般</td>
										<td>不喜欢</td>
										<td>非常不喜欢</td>
									</tr>
									<tr class="os_bjqk">
										<td class="lefttd_qk">CCTV1</td>
										<td><input name="c1" type="radio" value=""></td>
										<td><input name="c2" type="radio" value=""></td>
										<td><input name="c3" type="radio" value=""></td>
										<td><input name="c4" type="radio" value=""></td>
										<td><input name="c5" type="radio" value=""></td>
									</tr>
									<tr>
										<td class="lefttd_qk">CCTV2</td>
										<td><input name="c1" type="radio" value=""></td>
										<td><input name="c2" type="radio" value=""></td>
										<td><input name="c3" type="radio" value=""></td>
										<td><input name="c4" type="radio" value=""></td>
										<td><input name="c5" type="radio" value=""></td>
									</tr>
									<tr class="os_bjqk">
										<td class="lefttd_qk">CCTV3</td>
										<td><input name="c1" type="radio" value=""></td>
										<td><input name="c2" type="radio" value=""></td>
										<td><input name="c3" type="radio" value=""></td>
										<td><input name="c4" type="radio" value=""></td>
										<td><input name="c5" type="radio" value=""></td>
									</tr>
								</table>
							</div>
							<div class="dx_box" data-t="3"></div>
						</div>
						-->
					</div>
				</div>
				<input type="submit" name="提  交"/>
			</div>
		</div>
	</div>

</body>
</html>
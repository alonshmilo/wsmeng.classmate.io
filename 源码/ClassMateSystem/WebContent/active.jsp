<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page language="java"
	import="com.dt.bean.*, java.util.*, com.dt.DAO.*"%>
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
</script>
</head>
<body>
	<div class="formbody">
		<div id="usual1" class="usual">
			<div class="itab">
				<ul>
					<li><a href="#tab1">发布活动</a></li>
					<li><a href="#tab2" class="selected">活动查看</a></li>
				</ul>
			</div>
			<form action="<%=request.getContextPath()%>/AddActiveInfoServlet"
				method="post">
				<div id="tab1" class="tabson">
					<div class="formtext">
						Hi，<b><%=session.getAttribute("ManagerName")%></b>，欢迎您使用活动发布功能！ <br />
					</div>
					<ul class="forminfo">
						<li><label>活动标题<b>*</b></label><input name="active_name"
							type="text" class="dfinput" value="请填写活动名称" style="width: 518px;" /></li>
						<li><label>活动类型<b>*</b></label>
							<div class="vocation">
								<select name="active_descripe" class="select1">
									<option>户外踏青</option>
									<option>聊天喝茶</option>
									<option>吃饭聚餐</option>
									<option>网吧开黑</option>
									<option>其他</option>
								</select>
							</div></li>
						<li><label>收支类型<b>*</b></label>
							<div class="usercity">
								<div class="vocation">
									<select name="active_type" class="select1">
										<option value="1">收取会费</option>
										<option value="0">支出会费</option>
									</select>
								</div>
							</div></li>
						<li><label>活动费用<b>*</b></label><input name="active_cost"
							type="text" class="dfinput" /></li>
						<li><label>活动内容<b>*</b></label> <textarea
								name="active_context" cols="" rows="" class="textinput"></textarea></li>
						<li><label>&nbsp;</label><input name="" type="submit"
							class="btn" value="确认发布" /></li>
					</ul>
				</div>
			</form>
			<div id="tab2" class="tabson">
				<form action="active.jsp">
					<ul class="seachform">
						<%
							String search_type = request.getParameter("search_type");
							String search_state = request.getParameter("search_state");
							if(search_type == null&&search_state == null){
								search_type = "";
								search_state = "";
							}
						%>
						<li><label>活动类型</label>
							<div class="vocation">
								<select class="select3" name="search_type">
									<option><%= search_type %></option>
									<option></option>
									<option value="户外踏青">户外踏青</option>
									<option value="喝茶聊天">聊天喝茶</option>
									<option value="吃饭聚餐">吃饭聚餐</option>
									<option value="网吧开黑">网吧开黑</option>
									<option value="其他">其他</option>
								</select>
							</div></li>
						<li><label>活动状态</label>
							<div class="vocation">
								<select class="select3" name="search_state">
									<option><%= search_state.equals("0") ? "未结束" : search_state.equals("1") ? "已结束" : "" %></option>
									<option></option>
									<option value="0">未结束</option>
									<option value="1">已结束</option>
								</select>
							</div></li>
						<li><label>&nbsp;</label><input name="" type="submit"
							class="scbtn" value="查询" /></li>
					</ul>
				</form>
				<table class="tablelist">
					<thead>
						<tr>
							<th><input name="" type="checkbox" value=""
								checked="checked" /></th>
							<th>标题</th>
							<th>发布人</th>
							<th>发布时间</th>
							<th>是否结束</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<%
							int isFinish = -1;
							if(search_state != ""){
								isFinish = search_state.equals("0") ? 0 : 1;	
							}
							List<ActiveInfo> infoList = null;
							if(search_type == ""&&isFinish == -1){
								infoList = ActiveDAO.getAllActiveInfo();
							}else if(search_type == ""&&isFinish != -1){
								infoList = ActiveDAO.getActiveInfoBaseIsFinish(isFinish);
							}else if(search_type != ""&&isFinish == -1){
								infoList = ActiveDAO.getActiveInfoBaseDesc(search_type);
							}else if(search_type != null&&isFinish != -1){
								infoList = ActiveDAO.getActiveInfoBaseDescAndIsFinish(search_type, isFinish);
							}
							for(ActiveInfo info : infoList){
						%>
						<tr>
							<th><input name="" type="checkbox"
								value="<%=info.getActiveID()%>" /></th>
							<th><%=info.getActiveName()%></th>
							<th><%=info.getStudentName()%></th>
							<th><%=info.getPost_date()%></th>
							<th><%=info.getIsFinish() == 1 ? "结束" : "未结束"%></th>
							<th><a href="ChangeActiveInfo.jsp?params=<%=info.getActiveID()%>"><%=info.getIsFinish() == 1 ? "不可修改" : "修改"%></a></th>
						</tr>
						<%				
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

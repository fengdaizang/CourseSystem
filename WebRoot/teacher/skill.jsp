<%@page import="com.course.utils.*"%>
<%@page import="com.course.dao.*"%>
<%@page import="com.course.bean.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% 
	int cid=Integer.parseInt(request.getParameter("cid"));
	SkillDao skillDao=new SkillDao();
	ArrayList<Skill> skills=skillDao.getSkillsByCid(cid);

%>	
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'orderList.jsp' starting page</title>
    <script type="text/javascript" src="js/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrapValidator.css" />
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/npm.js"></script>

  </head>
  
  <body>
    <div style="margin-top: 20px;" class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<a class="list-group-item active">修改/删除-学科技能</a>
				<table class="table table-hover table-bordered table-condensed">
					<thead>
						<tr>
							<th>
								编号
							</th>
							<th>
								名称
							</th>
							<th>
								内容
							</th>
							<th>
								操作
							</th>
						</tr>
					</thead>
					<tbody>
						<% for(int i=0;i<skills.size();i++){ %>
						<tr>
							<td rowspan="2" align="center">
								<h3><%=skills.get(i).getSkill_id() %></h3>
							</td>
							<td>
								<%=skills.get(i).getSkill_name() %>
							</td>
							<td>
								<%=skills.get(i).getSkill_info() %>
							</td>
							<td>
								<a href="/CourseSystem/skillServlet?method=deleteHomework&skill_id=<%=skills.get(i).getSkill_id() %>&cid=<%=cid%>">删除</a>
							</td>
						</tr>
						<form action="/CourseSystem/skillServlet">
						<tr>
							<td>
								<input name="skill_id" value="<%=skills.get(i).getSkill_id() %>" type="hidden">
								<input name="method" value="editSkill" type="hidden">
								<input name="cid" value="<%=cid %>" type="hidden">
								<input name="skill_name" value="<%=skills.get(i).getSkill_name() %>">
							</td>
							<td>
								<input name="skill_info" value="<%=skills.get(i).getSkill_info() %>">
							</td>
							<td>
								<button type="submit" class="btn btn-default btn-primary">修改</button>
							</td>
						</tr>
						</form>
					<%} %>
				</table>
				<a class="list-group-item active">添加作业</a><br>
				<form action="/CourseSystem/skillServlet" class="form-horizontal" role="form">
					<input name="method" value="addSkill" type="hidden">
					<input name="cid" value="<%=cid %>" type="hidden">
					<div class="form-group">
						 <label class="col-sm-4 control-label">名称</label>
						<div class="col-sm-4">
							<input class="form-control" name="skill_name" type="text" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">内容</label>
						<div class="col-sm-4">
							<input class="form-control"  name="skill_info" type="text"/>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-4 col-sm-8">
							 <button type="submit" class="btn btn-default">增加</button>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-4 col-sm-8">
							 <a href="index.jsp">返回上一级</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
  </body>
</html>

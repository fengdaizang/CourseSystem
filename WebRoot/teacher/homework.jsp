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
	HomeworkDao homeworkDao=new HomeworkDao();
	ArrayList<Homework> homeworks=homeworkDao.getHomeworksByCid(cid);

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
				<a class="list-group-item active">查看作业</a>
				<table class="table table-hover table-bordered table-condensed">
					<thead>
						<tr>
							<th>
								编号
							</th>
							<th>
								标题
							</th>
							<th>
								内容
							</th>
							<th>
								截止时间
							</th>
							<th>
								操作
							</th>
						</tr>
					</thead>
					<tbody>
						<% for(int i=0;i<homeworks.size();i++){ %>
						<tr>
							<td rowspan="2" align="center">
								<h3><%=homeworks.get(i).getHw_id() %></h3>
							</td>
							<td>
								<%=homeworks.get(i).getTitle() %>
							</td>
							<td>
								<%=homeworks.get(i).getContent() %>
							</td>
							<td>
								<%=homeworks.get(i).getDeadline() %>
							</td>
							<td>
								<a href="/CourseSystem/homeworkServlet?method=deleteHomework&hw_id=<%=homeworks.get(i).getHw_id() %>&cid=<%=cid%>">删除</a>
							</td>
						</tr>
						<form action="/CourseSystem/homeworkServlet">
						<tr>
							<td>
								<input name="hw_id" value="<%=homeworks.get(i).getHw_id() %>" type="hidden">
								<input name="method" value="editHomework" type="hidden">
								<input name="cid" value="<%=cid %>" type="hidden">
								<input name="title" value="<%=homeworks.get(i).getTitle() %>">
							</td>
							<td>
								<input name="content" value="<%=homeworks.get(i).getContent() %>">
							</td>
							<td>
								<input name="deadline" value="<%=homeworks.get(i).getDeadline() %>">
							</td>
							<td>
								<button type="submit" class="btn btn-default btn-primary">修改</button>
							</td>
						</tr>
						</form>
					<%} %>
				</table>
				<a class="list-group-item active">添加作业</a><br>
				<form action="/CourseSystem/homeworkServlet" class="form-horizontal" role="form">
					<input name="method" value="addHomework" type="hidden">
					<input name="cid" value="<%=cid %>" type="hidden">
					<div class="form-group">
						 <label class="col-sm-4 control-label">标题</label>
						<div class="col-sm-4">
							<input class="form-control" name="title" type="text" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">内容</label>
						<div class="col-sm-4">
							<input class="form-control"  name="content" type="text"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">截止时间</label>
						<div class="col-sm-4">
							<input class="form-control"  name="deadline" type="text"/>
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

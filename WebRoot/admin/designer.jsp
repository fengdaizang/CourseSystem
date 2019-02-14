<%@page import="com.course.utils.*"%>
<%@page import="com.course.dao.*"%>
<%@page import="com.course.bean.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% 	
	DesignerDao designerDao=new DesignerDao();
	ArrayList<Designer> designers=designerDao.getDesigners();
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
				<a class="list-group-item active">查看/修改设计者</a>
				<table class="table table-hover table-bordered table-condensed">
					<thead>
						<tr>
							<th>
								工号
							</th>
							<th>
								姓名
							</th>
							<th>
								电话
							</th>
							<th>
								邮箱
							</th>
							<th>
								性别
							</th>
							<th>
								操作
							</th>
						</tr>
					</thead>
					<tbody>
						<% for(int i=0;i<designers.size();i++){ %>
						<tr>
							<td rowspan="2" align="center">
								<h3><%=designers.get(i).getUsername() %></h3>
							</td>
							<td>
								<%=designers.get(i).getDname() %>
							</td>
							<td>
								<%=designers.get(i).getDphone() %>
							</td>
							<td>
								<%=designers.get(i).getDemail() %>
							</td>
							<td>
								<%=SexUtils.getSex( designers.get(i).getDsex())   %>
							</td>
							<td>
								<a href="/CourseSystem/adminServlet?method=deleteDesigner&did=<%=designers.get(i).getDid() %>">删除</a>
							</td>
						</tr>
						<form action="/CourseSystem/adminServlet">
						<tr>
							<td>
								<input name="did" value="<%=designers.get(i).getDid() %>" type="hidden">
								<input name="method" value="editDesigner" type="hidden">
								<input name="dname" value="<%=designers.get(i).getDname() %>" type="text">
							</td>
							<td>
								<input name="dphone" value="<%=designers.get(i).getDphone() %>" type="text">
							</td>
							<td>
								<input name="demail" value="<%=designers.get(i).getDemail() %>" type="text">
							</td>
							<td>
								<select name="dsex">
									<option value="1">男</option>
									<option value="0">女</option>
								</select>
							</td>
						
							<td>
								<button type="submit" class="btn btn-default btn-primary">修改</button>
							</td>
						</tr>
						</form>
					<%} %>
				</table>
				<a class="list-group-item active">添加设计者</a><br>
				<form action="/CourseSystem/adminServlet" class="form-horizontal" role="form">
					<input name="method" value="addDesigner" type="hidden">
					<div class="form-group">
						 <label class="col-sm-4 control-label">工号</label>
						<div class="col-sm-4">
							<input class="form-control" name="username" type="text" />
						</div>
					</div>
					<div class="form-group">
						 <label class="col-sm-4 control-label">姓名</label>
						<div class="col-sm-4">
							<input class="form-control" name="dname" type="text" />
						</div>
					</div>
					<div class="form-group">
						 <label class="col-sm-4 control-label">初始密码</label>
						<div class="col-sm-4">
							<input class="form-control" name="password" type="text" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">电话</label>
						<div class="col-sm-4">
							<input class="form-control" name="dphone" type="text" />
						</div>
					</div>
					<div class="form-group">
						 <label class="col-sm-4 control-label">邮箱</label>
						<div class="col-sm-4">
							<input class="form-control" name="demail" type="text" />
						</div>
					</div>
					<div class="form-group">
						 <label class="col-sm-4 control-label">性别</label>
						<div class="col-sm-4">
							<select name="dsex">
									<option value="1">男</option>
									<option value="0">女</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-4 col-sm-8">
							 <button type="submit" class="btn btn-default">增加</button>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-4 col-sm-8">
							 <a href="admin/right.jsp">返回上一级</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
  </body>
</html>

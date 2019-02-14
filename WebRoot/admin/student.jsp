<%@page import="com.course.utils.*"%>
<%@page import="com.course.dao.*"%>
<%@page import="com.course.bean.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% 	
	StudentDao studentDao=new StudentDao();
	ArrayList<Student> students=studentDao.getStudents();
	ClassesDao classesDao=new ClassesDao();
	ArrayList<Classes> classes=classesDao.getClasses();
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
				<a class="list-group-item active">查看/修改学生</a>
				<table class="table table-hover table-bordered table-condensed">
					<thead>
						<tr>
							<th>
								学号
							</th>
							<th>
								姓名
							</th>
							<th>
								年龄
							</th>
							<th>
								性别
							</th>
							<th>
								班级
							</th>
							<th>
								操作
							</th>
						</tr>
					</thead>
					<tbody>
						<% for(int i=0;i<students.size();i++){ %>
						<tr>
							<td rowspan="2" align="center">
								<h3><%=students.get(i).getUsername() %></h3>
							</td>
							<td>
								<%=students.get(i).getSname() %>
							</td>
							<td>
								<%=students.get(i).getAge() %>
							</td>
							<td>
								<%=SexUtils.getSex(students.get(i).getSex())   %>
							</td>
							<td>
								<%=students.get(i).getClassid() %>
							</td>
							<td>
								<a href="/CourseSystem/adminServlet?method=deleteStudent&sid=<%=students.get(i).getSid() %>">删除</a>
							</td>
						</tr>
						<form action="/CourseSystem/adminServlet">
						<tr>
							<td>
								<input name="sid" value="<%=students.get(i).getSid() %>" type="hidden">
								<input name="method" value="editStudent" type="hidden">
								<input name="sname" value="<%=students.get(i).getSname() %>" type="text">
							</td>
							<td>
								<input name="age" value="<%=students.get(i).getAge() %>" type="text">
							</td>
							<td>
								<select name="sex">
									<option value="1">男</option>
									<option value="0">女</option>
								</select>
							</td>
							<td>
								<select name="classid">
									<%for(int j=0;j<classes.size();j++){ %>
									<option value="<%=classes.get(j).getId()%>">
										<%=classes.get(j).getCollege_name()%>-<%=classes.get(j).getMajor_name() %>
									</option>
									<%} %>
								</select>
							</td>
							<td>
								<button type="submit" class="btn btn-default btn-primary">修改</button>
							</td>
						</tr>
						</form>
					<%} %>
				</table>
				<a class="list-group-item active">添加课程</a><br>
				<form action="/CourseSystem/adminServlet" class="form-horizontal" role="form">
					<input name="method" value="addStudent" type="hidden">
					<div class="form-group">
						 <label class="col-sm-4 control-label">学号</label>
						<div class="col-sm-4">
							<input class="form-control" name="username" type="text" />
						</div>
					</div>
					<div class="form-group">
						 <label class="col-sm-4 control-label">姓名</label>
						<div class="col-sm-4">
							<input class="form-control" name="sname" type="text" />
						</div>
					</div>
					<div class="form-group">
						 <label class="col-sm-4 control-label">初始密码</label>
						<div class="col-sm-4">
							<input class="form-control" name="password" type="text" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">班级</label>
						<div class="col-sm-4">
							<select name="classid">
									<%for(int j=0;j<classes.size();j++){ %>
									<option value="<%=classes.get(j).getId()%>">
										<%=classes.get(j).getCollege_name()%>-<%=classes.get(j).getMajor_name() %>
									</option>
									<%} %>
								</select>
						</div>
					</div>
					<div class="form-group">
						 <label class="col-sm-4 control-label">年龄</label>
						<div class="col-sm-4">
							<input class="form-control" name="age" type="text" />
						</div>
					</div>
					<div class="form-group">
						 <label class="col-sm-4 control-label">性别</label>
						<div class="col-sm-4">
							<select name="sex">
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

<%@page import="com.course.utils.*"%>
<%@page import="com.course.dao.*"%>
<%@page import="com.course.bean.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% 
	ArrayList<Course> courses=(ArrayList<Course>)session.getAttribute("courses");
	TeacherDao teacherDao=new TeacherDao();
	ArrayList<Teacher> teachers=teacherDao.getTeachers();
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
				<a class="list-group-item active">查看/修改课程</a>
				<table class="table table-hover table-bordered table-condensed">
					<thead>
						<tr>
							<th>
								编号
							</th>
							<th>
								课程名称
							</th>
							<th>
								上课班级
							</th>
							<th>
								老师id
							</th>
							<th>
								上课时间
							</th>
							<th>
								操作
							</th>
						</tr>
					</thead>
					<tbody>
						<% for(int i=0;i<courses.size();i++){ %>
						<tr>
							<td rowspan="2" align="center">
								<h3><%=courses.get(i).getCid() %></h3>
							</td>
							<td>
								<%=courses.get(i).getCname() %>
							</td>
							<td>
								<%=courses.get(i).getClassid() %>
							</td>
							<td>
								<%=courses.get(i).getTeacherid() %>
							</td>
							<td>
								<%=courses.get(i).getCtime() %>
							</td>
							<td>
								<a href="/CourseSystem/courseServlet?method=deleteCourse&cid=<%=courses.get(i).getCid() %>">删除</a>
							</td>
						</tr>
						<form action="/CourseSystem/courseServlet">
						<tr>
							<td>
								<input name="cid" value="<%=courses.get(i).getCid() %>" type="hidden">
								<input name="method" value="editCourse" type="hidden">
								<input name="cname" value="<%=courses.get(i).getCname() %>">
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
								<select name="teacherid">
									<%for(int j=0;j<teachers.size();j++){ %>
									<option value="<%=teachers.get(j).getTid()%>">
										<%=teachers.get(j).getTid()%>-<%=teachers.get(j).getTname() %>
									</option>
									<%} %>
								</select>
							</td>
							<td>
								<input name="ctime" value="<%=courses.get(i).getCtime() %>">
							</td>
							
							<td>
								<button type="submit" class="btn btn-default btn-primary">修改</button>
							</td>
						</tr>
						</form>
					<%} %>
				</table>
				<a class="list-group-item active">添加课程</a><br>
				<form action="/CourseSystem/courseServlet" class="form-horizontal" role="form">
					<input name="method" value="addCourse" type="hidden">
					<div class="form-group">
						 <label class="col-sm-4 control-label">课程名</label>
						<div class="col-sm-4">
							<input class="form-control" name="cname" type="text" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">上课老师</label>
						<div class="col-sm-4">
							<select name="teacherid">
									<%for(int i=0;i<teachers.size();i++){ %>
									<option value="<%=teachers.get(i).getTid()%>">
										<%=teachers.get(i).getTid()%>-<%=teachers.get(i).getTname() %>
									</option>
									<%} %>
								</select>
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
						<label class="col-sm-4 control-label">上课时间时间</label>
						<div class="col-sm-4">
							<input class="form-control"  name="ctime" type="text"/>
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

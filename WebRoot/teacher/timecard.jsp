<%@page import="com.course.dao.*"%>
<%@page import="com.course.bean.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% Teacher teacher=(Teacher)request.getSession().getAttribute("teacher");
	ArrayList<Student> students=(ArrayList<Student>)session.getAttribute("students");
	Course course=(Course)session.getAttribute("course");
	int time=(Integer)session.getAttribute("time");
	TimeCardDao timeCardDao=new TimeCardDao();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <title></title>
    <script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=path%>/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/bootstrap-theme.css" />
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/bootstrapValidator.css" />
    <script type="text/javascript" src="<%=path%>/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=path%>/js/npm.js"></script>
  </head>
  <body >
	  <div style="margin-top: 20px;" class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
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
								班级
							</th>
							<th>
								操作
							</th>
						</tr>
					</thead>
					<tbody>
						<% for(int i=0;i<students.size();i++){ 
							TimeCard timeCard=new TimeCard();
							timeCard=timeCardDao.getTimeCardBySidAndCid(students.get(i).getSid(), course.getCid());
							
							if(time==(timeCard.getCheckin()+timeCard.getCheckout())){
								continue;
							}
						%>
						<% if(i%4==0){ %><tr>
						<% }else if(i%4==1){ %><tr class="success">
						<% }else if(i%4==2){ %><tr class="error">
						<% }else if(i%4==3){ %><tr class="warning">
						<% } %>
							<td>
								<%=students.get(i).getSid() %>
							</td>
							<td>
								<%=students.get(i).getUsername() %>
							</td>
							<td>
								<%=students.get(i).getClassid() %>
							</td>
							<td>
								 <a href="/CourseSystem/timeCardServlet?method=checkin&sid=<%=students.get(i).getSid() %>&cid=<%=course.getCid()%>">出勤</a>
								 <a href="/CourseSystem/timeCardServlet?method=checkout&sid=<%=students.get(i).getSid() %>&cid=<%=course.getCid()%>">缺勤</a>
							</td>
						</tr>
						<%} %>
						<tr>
							<td colspan="4">若点到已完成，可<a href="right.jsp">返回上一页</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
  </body>
</html>
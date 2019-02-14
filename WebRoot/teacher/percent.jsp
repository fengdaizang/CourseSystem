<%@page import="com.course.dao.*"%>
<%@page import="com.course.bean.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% Teacher teacher=(Teacher)request.getSession().getAttribute("teacher");
	
	int cid=Integer.parseInt(request.getParameter("cid"));
	CourseDao courseDao=new CourseDao();
	Course course=courseDao.getCoursesByCid(cid);
	PercentDao percentDao=new PercentDao();
	Percent percent=percentDao.getPercentByCid(cid);
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
				<%if(percent.getCid()!=0){ %>
					<h3 class="text-center text-info">
						课程名:<%=course.getCname() %>
						[考勤<%=percent.getTimecard_part()%>--
						作业<%=percent.getHomework_part()%>]
					</h3>
					<h5 class="text-center text-info">
						您可以重新选择加以修改
					</h5>
					<hr>
				<%} %>
				<form action="/CourseSystem/percentServlet" class="form-horizontal" role="form">
					<input value="addPercent" name="method"  type="hidden" />
					<div class="form-group"> 
						<label for="inputEmail3" class="col-sm-5 control-label">课程名</label>
						<div class="col-sm-7">
							<%=course.getCname() %>
							<input value="<%=cid %>" name="cid"  type="hidden" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-5 control-label">成绩百分比</label>
						<div class="col-sm-7">
							<select name="percent" >
								<option value="1">考勤10%--作业90%</option>
								<option value="2">考勤20%--作业80%</option>
								<option value="3">考勤30%--作业70%</option>
								<option value="4">考勤40%--作业60%</option>
								<option value="5">考勤50%--作业50%</option>
								<option value="6">考勤60%--作业40%</option>
								<option value="7">考勤70%--作业30%</option>
								<option value="8">考勤80%--作业20%</option>
								<option value="9">考勤90%--作业10%</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-5 col-sm-7">
							 <button type="submit" class="btn btn-default">提交</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
  </body>
</html>
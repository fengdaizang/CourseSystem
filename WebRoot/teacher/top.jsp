<%@page import="com.course.bean.Teacher"%>
<%@page import="com.course.bean.Student"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% Teacher teacher=(Teacher)request.getSession().getAttribute("teacher"); %>
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
  <body leftmargin="0" topmargin="0">
	  <div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="alert alert-success alert-dismissable">
					 <a style="float: right;" href="/CourseSystem/teacherServlet?method=logout" target="_top">
					 	<img src="<%=path%>/images/out.gif" alt="安全退出" width="46" height="20" border="0">
					 </a>
					 <h3 style="margin-left: 40%;"><%=teacher.getTname() %>老师，您好:欢迎使用课设管理与分析系统</h3>
				</div>
			</div>
		</div>
	</div>
  </body>
</html>

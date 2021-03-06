<%@page import="com.course.bean.Course"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% ArrayList<Course> courses=(ArrayList<Course>)session.getAttribute("courses"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
	<title>管理页面</title>

    <script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=path%>/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/bootstrap-theme.css" />
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/bootstrapValidator.css" />
    <script type="text/javascript" src="<%=path%>/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=path%>/js/npm.js"></script>
</head>

<body>
	<div style="margin-left: 20px;margin-top: 20px;" class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="panel-group" id="panel-404620">
					<div class="panel panel-default">
						<div class="panel-heading">
							 <a class="panel-title" data-toggle="collapse" data-parent="#panel-404620" href="#panel-element-676742">个人信息管理</a>
						</div>
						<div id="panel-element-676742" class="panel-collapse in">
							<div class="panel-body">
								<a href="designer/modify.jsp" target="main">修改个人信息</a>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							 <a class="panel-title" data-toggle="collapse" data-parent="#panel-404620" href="#panel-element-676743">课程管理</a>
						</div>
						<div id="panel-element-676743" class="panel-collapse collapse">
							<div class="panel-body">
								<a href="designer/course.jsp" target="main">课程管理</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

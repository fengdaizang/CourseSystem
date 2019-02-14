<%@page import="com.course.utils.SexUtils"%>
<%@page import="com.course.bean.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% Teacher teacher=(Teacher)request.getSession().getAttribute("teacher"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'right.jsp' starting page</title>
    <script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=path%>/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/bootstrap-theme.css" />
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/bootstrapValidator.css" />
    <script type="text/javascript" src="<%=path%>/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=path%>/js/npm.js"></script>
  </head>

<body>
	<div style="margin-top: 20px;" class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="list-group">
					<a class="list-group-item active">个人信息</a>
					<div class="list-group-item">
						<h4 class="list-group-item-heading">
							姓名：<%=teacher.getTname()%>
						</h4>
						<p class="list-group-item-text">
							关心同学的好老师！
						</p>
					</div>
					<div class="list-group-item">
						 电话：<%=teacher.getTphone() %>
					</div>
					<div class="list-group-item">
						 邮箱：<%=teacher.getTemail() %>
					</div>
					<div class="list-group-item">
						 性别：<%=SexUtils.getSex(teacher.getSex()) %>
					</div>
					<a class="list-group-item active"></a>
				</div>
			</div>
		</div>
	</div>
</body>

</html>

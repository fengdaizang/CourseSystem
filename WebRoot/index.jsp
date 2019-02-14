<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% String msg=(String)session.getAttribute("msg"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录</title>
    <script type="text/javascript" src="js/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrapValidator.css" />
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/npm.js"></script>
  </head>
  
  <body>
    <div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="alert alert-dismissable alert-success">
					<h3 style="margin-left: 40%;">欢迎使用课程设计管理与分析系统-请先登录</h3>
				</div>
				<% if(msg!=null){
					session.setAttribute("msg", null);
				%>
				<div class="alert alert-dismissable alert-danger">
					<button type="button" class="close" data-dismiss="alert">×</button>
					<h4>注意!</h4>
					<strong><%=msg %></strong>
				</div>
				<%} %>
  				<div class="tabbable login" id="tabs-739113">		
					<ul style="margin-left: 40%" class="nav nav-pills">
						<li class="active">
							 <a href="#panel-1" class="btn disabled" data-toggle="tab">用户登录  USER LOGIN</a>
						</li>
					</ul><br>
					<div class="tab-content">
						<div  class="tab-pane active" id="panel-1">
							<form action="/CourseSystem/loginServlet" class="form-horizontal" role="form">
								<div class="form-group">
									 <label class="col-sm-4 control-label">账号</label>
									<div class="col-sm-4">
										<input class="form-control"  placeholder="请输入你的账号" name="username" id="username" />
									</div>
									<label id="usernameLabel" class="col-sm-4"></label>
								</div>
								<div class="form-group">
									 <label class="col-sm-4 control-label">密码</label>
									<div class="col-sm-4">
										<input class="form-control"  placeholder="请输入密码" type="password" name="password" id="password"  />
									</div>
									<label id="passwordLabel" class="col-sm-4"></label>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">身份</label>
									<div class="col-sm-4">
										<select name="type">
											<option value="1">学生</option>
											<option value="2">老师</option>
											<option value="3">课程设计者</option>
											<option value="4">系统管理员</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-4 col-sm-4">
										<div class="checkbox">
											 <label><input type="checkbox" name="rememberme" value="y"/>记住密码？</label>
										</div>
									</div>
									<label id="genderLabel" class="col-sm-4"></label>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-4 col-sm-4">
										 <button type="submit" class="btn btn-info btn-lg btn-block">立即登录</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
  </body>
</html>

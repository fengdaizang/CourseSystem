<%@page import="com.course.bean.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% Designer designer=(Designer)request.getSession().getAttribute("designer"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'modify.jsp' starting page</title>
    <script type="text/javascript" src="js/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrapValidator.css" />
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/npm.js"></script>
	<script type="text/javascript">
    	function checkFrom(){
    		var oldpassword1 = document.getElementById("oldpassword1").value;
    		var oldpassword2 = document.getElementById("oldpassword2").value;
    		var newpassword = document.getElementById("newpassword").value;
    		var repassword = document.getElementById("repassword").value;
    		
    		if(oldpassword2 != oldpassword1){
    			alert("原密码不正确!");
    			return false;
    		}
    		if(newpassword ==oldpassword1){
    			alert("新密码与旧密码不能一致!");
    			return false;
    		}
    		if(repassword !=newpassword){
    			alert("两次密码不一致!");
    			return false;
    		}
    	}
    </script>
	
  </head>
  
  <body >
    <div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column" >
				<div class="tabbable" id="tabs-658239">
					<ul  class="nav nav-tabs">
						<li style="margin-left: 40%;" class="active">
							 <a href="#panel-421509" data-toggle="tab">修改个人信息</a>
						</li>
						<li>
							 <a href="#panel-593721" data-toggle="tab">修改密码</a>
						</li>
					</ul>
					<br>
					<div class="tab-content">
						<div class="tab-pane active" id="panel-421509">
							<form action="/CourseSystem/designerServlet" class="form-horizontal" role="form">
								<input name="did" value="<%=designer.getDid()%>" type="hidden">
								<input name="method" value="modifyInfo" type="hidden">
								<div class="form-group">
									 <label class="col-sm-4 control-label">姓名</label>
									<div class="col-sm-4">
										<input class="form-control"  name="dname" type="text" value="<%=designer.getDname() %>" />
									</div>
								</div>
								<div class="form-group">
									 <label class="col-sm-4 control-label">电话</label>
									<div class="col-sm-4">
										<input class="form-control" name="dphone" type="text" value="<%=designer.getDphone() %>" />
									</div>
								</div>
								<div class="form-group">
									 <label class="col-sm-4 control-label">邮箱</label>
									<div class="col-sm-4">
										<input class="form-control" name="demail" type="text" value="<%=designer.getDemail() %>" />
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
									<div class="col-sm-offset-4 col-sm-4">
										 <button type="submit" class="btn btn-default">提交</button>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-4 col-sm-4">
										 <a href="teacher/right.jsp">返回上一级</a>
									</div>
								</div>
							</form>
						</div>
						<div class="tab-pane" id="panel-593721">
							<form class="form-horizontal" action="/CourseSystem/teacherServlet" role="form" onsubmit="return checkFrom()" >
								<input name="did" value="<%=designer.getDid()%>" type="hidden">
								<input name="method" value="modifyPassword" type="hidden">
								<input value="<%=designer.getPassword() %>" id="oldpassword1" type="hidden" />
								<div class="form-group">
									 <label class="col-sm-4 control-label">原密码</label>
									<div class="col-sm-4">
										<input class="form-control" id="oldpassword2"  type="password" />
									</div>
								</div>
								<div class="form-group">
									 <label class="col-sm-4 control-label">新密码</label>
									<div class="col-sm-4">
										<input class="form-control" id="newpassword" name="password" type="password" />
									</div>
								</div>
								<div class="form-group">
									 <label class="col-sm-4 control-label">确认密码</label>
									<div class="col-sm-4">
										<input class="form-control" id="repassword" type="password"/>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-4 col-sm-4">
										 <button type="submit" class="btn btn-default">提交</button><br>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-4 col-sm-4">
										 <a href="designer/right.jsp">返回上一级</a>
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

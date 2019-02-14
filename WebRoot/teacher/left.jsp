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
								<a href="teacher/modify.jsp" target="main">修改个人信息</a>
							</div>
						</div>
					</div>
					<% for(int i=0;i<courses.size();i++){ %>
					<div class="panel panel-default">
						<div class="panel-heading">
							 <a class="panel-title collapsed" 
							 	data-toggle="collapse" data-parent="#panel-404620"
							 	 href="#panel-element-1498<%=courses.get(i).getCid() %>"><%=courses.get(i).getCname() %></a>
						</div>
						<div id="panel-element-1498<%=courses.get(i).getCid() %>" class="panel-collapse collapse">
							<div class="panel-body">
								<a href="/CourseSystem/studentServlet?method=timecard&cid=<%=courses.get(i).getCid()%>" target="main">日常考勤</a>
							</div>
							<div class="panel-body">
								<a href="/CourseSystem/timeCardServlet?method=timeCardInfo&cid=<%=courses.get(i).getCid()%>" target="main">查看考勤结果</a>
							</div>
							<div class="panel-body">
								<a href="teacher/percent.jsp?cid=<%=courses.get(i).getCid()%>" target="main">编辑成绩百分比</a>
							</div>
							<div class="panel-body">
								<a href="teacher/homework.jsp?cid=<%=courses.get(i).getCid()%>" target="main">发布课程作业</a>
							</div>
							<div class="panel-body">
								<a href="teacher/skill.jsp?cid=<%=courses.get(i).getCid()%>" target="main">编辑技能点</a>
							</div>
							<div class="panel-body">
								<a href="teacher/task.jsp?cid=<%=courses.get(i).getCid()%>" target="main">作业评分</a>
							</div>
							<div class="panel-body">
								<a href="teacher/score.jsp?cid=<%=courses.get(i).getCid()%>" target="main">查看成绩</a>
							</div>
							<div class="panel-body">
								<a href="teacher/report.jsp?cid=<%=courses.get(i).getCid()%>" target="main">生成课程报告</a>
							</div>
						</div>
					</div>
					<%} %>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

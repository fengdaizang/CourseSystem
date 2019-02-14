<%@page import="com.course.utils.TimeUtils"%>
<%@page import="com.course.dao.*"%>
<%@page import="com.course.bean.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% 
	int cid=0;
	if(request.getParameter("cid")==null){
		cid=(Integer)session.getAttribute("cid");
	}else{
		cid=Integer.parseInt(request.getParameter("cid"));
		session.setAttribute("cid", cid);
	}
	
	HomeworkDao homeworkDao=new HomeworkDao();
	TaskDao taskDao=new TaskDao();
	ArrayList<Homework> homeworks=homeworkDao.getHomeworksByCid(cid);
	Student student=(Student)request.getSession().getAttribute("student");
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
				<a class="list-group-item active">查看作业</a>
				<table class="table table-hover table-bordered table-condensed">
					<thead>
						<tr>
							<th>
								标题
							</th>
							<th>
								内容
							</th>
							<th>
								截止时间
							</th>
							<th>
								上传作业
							</th>
							<th>
								操作
							</th>
						</tr>
					</thead>
					<tbody>
						<% for(int i=0;i<homeworks.size();i++){ %>
						<form action="/CourseSystem/upLoadServlet" class="form-horizontal" enctype="multipart/form-data" method="post" role="form">
						<tr>
							<input type="hidden" value="<%=homeworks.get(i).getHw_id()%>" name="hw_id">
							<input type="hidden" value="<%=student.getSid()%>" name="sid">
							<input type="hidden" value="uploadTask" name="method">
							<td>
								<%=homeworks.get(i).getTitle() %>
							</td>
							<td>
								<%=homeworks.get(i).getContent()%>
							</td>
							<td>
								<%=homeworks.get(i).getDeadline()%>
							</td>
							<%if(TimeUtils.countTime(homeworks.get(i).getDeadline(), TimeUtils.getCurrentTime())<0){ %>
							<td>
								<%	Task task=taskDao.getTaskBySidAndHw_id(student.getSid(), homeworks.get(i).getHw_id());
									if(task.getFile_url()!=null){%>已上传,可覆盖<%}%>
								 <input id="file" name="file" type="file" value="请选择文件" /> 
							</td>
							<td>
								 <input value="提交" type="submit" /> 
							</td>
							
							<%}else{ %>
								<td colspan="2">
								超过规定时间，不能提交作业 
								</td>
							<%} %>
						</tr>
						<%} %>
					</tbody>
				</table>
			</div>
		</div>
	</div>
  </body>
</html>

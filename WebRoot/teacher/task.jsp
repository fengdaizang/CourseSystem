<%@page import="com.course.dao.*"%>
<%@page import="com.course.bean.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%  int cid=Integer.parseInt(request.getParameter("cid"));
	ArrayList<Student> students=(ArrayList<Student>)session.getAttribute("students");
	HomeworkDao homeworkDao=new HomeworkDao();
	ArrayList<Homework> homeworks=homeworkDao.getHomeworksByCid(cid);
	TaskDao taskDao=new TaskDao();
	StudentDao studentDao=new StudentDao();
	SkillDao skillDao=new SkillDao();
	ArrayList<Skill> skills=skillDao.getSkillsByCid(cid);
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
				<a class="list-group-item active">作业评分</a>
				<table class="table table-hover table-bordered table-condensed">
					<tbody>
						<% for(int i=0;i<homeworks.size();i++){%>
						<tr class="info">
							<td colspan="8" align="center">作业：<%=homeworks.get(i).getTitle() %></td>
						</tr>
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
								作业
							</th>
							<th>
								评分
							</th>
							<th>
								技能点
							</th>
							<th>
								掌握程度
							</th>
							<th>
								操作
							</th>
						</tr>
						<% ArrayList<Task> tasks=taskDao.getTasksByHw_id(homeworks.get(i).getHw_id());
							for(int j=0;j<tasks.size();j++){
								Student student=studentDao.getStudentBySId(tasks.get(j).getSid());		
						%>
						<% if(j%4==0){ %><tr>
						<% }else if(j%4==1){ %><tr class="success">
						<% }else if(j%4==2){ %><tr class="error">
						<% }else if(j%4==3){ %><tr class="warning">
						<% } %>
							<form action="/CourseSystem/taskServlet">
							<td>
								<input type="hidden" name="task_id" value="<%=tasks.get(j).getTask_id()%>">
								<input type="hidden" name="method" value="addScore">
								<input type="hidden" name="cid" value="<%=cid%>">
								<%=student.getSid() %>
							</td>
							<td>
								<%=student.getUsername() %>
							</td>
							<td>
								<%=student.getClassid() %>
							</td>
							<td>
								<a href="/CourseSystem/downLoadServlet?hw_id=<%=tasks.get(j).getHw_id() %>&filename=<%=tasks.get(j).getFile_url() %>">
									<%=tasks.get(j).getFile_url().substring(tasks.get(j).getFile_url().lastIndexOf("_")+1) %>
								</a>
							</td>
							<td>
								 <input type="text" name="score">
							</td>
							<td>
								<select name="skill_id">
								<% for(int k=0;k<skills.size();k++){ %>
									<option value="<%=skills.get(k).getSkill_id()%>"><%=skills.get(k).getSkill_name() %></option>
								<%} %>
								</select>
							</td>
							<td>
								 <input type="text" name="degree">
							</td>
							<td>
								 <input type="submit" value="添加">
							</td>
							</form>
						</tr>
						<%} %>
						<%} %>
						<tr>
							<td colspan="5"><a href="right.jsp">返回上一页</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
  </body>
</html>
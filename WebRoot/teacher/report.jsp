<%@page import="com.course.dao.*"%>
<%@page import="com.course.bean.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%  ScoreDao scoreDao=new ScoreDao();
	int cid=0;
	if(request.getParameter("cid")==null){
		cid=(Integer)session.getAttribute("cid");
	}else{
		cid=Integer.parseInt(request.getParameter("cid"));
		session.setAttribute("cid", cid);
	}
	ArrayList<Score> scores=null;
	String level=request.getParameter("level");
	if(level==null||level==""){
		scores=scoreDao.getScoresByCid(cid);
	}else{
		scores=scoreDao.getScoresByCidAndLevel(cid, level);
	}
	StudentDao studentDao=new StudentDao();
%>
<%
	CourseDao courseDao=new CourseDao();
	Course course=courseDao.getCoursesByCid(cid);
	ArrayList<Student> students=studentDao.getStudentsByClassid(course.getClassid());

%>
<%  
    String exportToExcel = request.getParameter("exportToExcel");  
  	if (exportToExcel != null  
    	&& exportToExcel.toString().equalsIgnoreCase("YES")) {  
    		response.setContentType("application/vnd.ms-excel");  
     		response.setHeader("Content-Disposition", "inline; filename="  
                    + "excel.xls");  
   }  
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
							<th colspan="7" align="center">
								<%=course.getCname() %>的课程总结初稿
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th colspan="7" align="center">
								等级A
							</th>
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
								平时成绩
							</th>
							<th>
								作业成绩
							</th>
							<th>
								得分
							</th>
						</tr>
						<% scores=scoreDao.getScoresByCidAndLevel(cid, "A");
							for(int i=0;i<scores.size();i++){
							Student student=studentDao.getStudentBySId(scores.get(i).getSid());		
						%>
						<% if(i%4==0){ %><tr>
						<% }else if(i%4==1){ %><tr class="success">
						<% }else if(i%4==2){ %><tr class="error">
						<% }else if(i%4==3){ %><tr class="warning">
						<% } %>
							<td>
								<input type="hidden" name="cid" value="<%=cid%>">
								<%=student.getUsername() %>
							</td>
							<td>
								<%=student.getSname() %>
							</td>
							<td>
								<%=student.getClassid() %>
							</td>
							<td>
								<%=scores.get(i).getTimecard_part() %>
							</td>
							<td>
								<%=scores.get(i).getHomework_part() %>
							</td>
							<td>
								<%=scores.get(i).getTimecard_part()+scores.get(i).getHomework_part() %>
							</td>
						</tr>
						<%} %>
						<tr>
							<th colspan="7" align="center">
								等级B
							</th>
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
								平时成绩
							</th>
							<th>
								作业成绩
							</th>
							<th>
								得分
							</th>
						</tr>
						<% scores=scoreDao.getScoresByCidAndLevel(cid, "B");
							for(int i=0;i<scores.size();i++){
							Student student=studentDao.getStudentBySId(scores.get(i).getSid());		
						%>
						<% if(i%4==0){ %><tr>
						<% }else if(i%4==1){ %><tr class="success">
						<% }else if(i%4==2){ %><tr class="error">
						<% }else if(i%4==3){ %><tr class="warning">
						<% } %>
							<td>
								<input type="hidden" name="cid" value="<%=cid%>">
								<%=student.getUsername() %>
							</td>
							<td>
								<%=student.getSname() %>
							</td>
							<td>
								<%=student.getClassid() %>
							</td>
							<td>
								<%=scores.get(i).getTimecard_part() %>
							</td>
							<td>
								<%=scores.get(i).getHomework_part() %>
							</td>
							<td>
								<%=scores.get(i).getTimecard_part()+scores.get(i).getHomework_part() %>
							</td>
						</tr>
						<%} %>
						<tr>
							<th colspan="7" align="center">
								等级C
							</th>
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
								平时成绩
							</th>
							<th>
								作业成绩
							</th>
							<th>
								得分
							</th>
						</tr>
						<% scores=scoreDao.getScoresByCidAndLevel(cid, "C");
							for(int i=0;i<scores.size();i++){
							Student student=studentDao.getStudentBySId(scores.get(i).getSid());		
						%>
						<% if(i%4==0){ %><tr>
						<% }else if(i%4==1){ %><tr class="success">
						<% }else if(i%4==2){ %><tr class="error">
						<% }else if(i%4==3){ %><tr class="warning">
						<% } %>
							<td>
								<input type="hidden" name="cid" value="<%=cid%>">
								<%=student.getUsername() %>
							</td>
							<td>
								<%=student.getSname() %>
							</td>
							<td>
								<%=student.getClassid() %>
							</td>
							<td>
								<%=scores.get(i).getTimecard_part() %>
							</td>
							<td>
								<%=scores.get(i).getHomework_part() %>
							</td>
							<td>
								<%=scores.get(i).getTimecard_part()+scores.get(i).getHomework_part() %>
							</td>
						</tr>
						<%} %>
						<tr>
							<th colspan="7" align="center">
								等级D
							</th>
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
								平时成绩
							</th>
							<th>
								作业成绩
							</th>
							<th>
								得分
							</th>
						</tr>
						<% scores=scoreDao.getScoresByCidAndLevel(cid, "D");
							for(int i=0;i<scores.size();i++){
							Student student=studentDao.getStudentBySId(scores.get(i).getSid());		
						%>
						<% if(i%4==0){ %><tr>
						<% }else if(i%4==1){ %><tr class="success">
						<% }else if(i%4==2){ %><tr class="error">
						<% }else if(i%4==3){ %><tr class="warning">
						<% } %>
							<td>
								<input type="hidden" name="cid" value="<%=cid%>">
								<%=student.getUsername() %>
							</td>
							<td>
								<%=student.getSname() %>
							</td>
							<td>
								<%=student.getClassid() %>
							</td>
							<td>
								<%=scores.get(i).getTimecard_part() %>
							</td>
							<td>
								<%=scores.get(i).getHomework_part() %>
							</td>
							<td>
								<%=scores.get(i).getTimecard_part()+scores.get(i).getHomework_part() %>
							</td>
						</tr>
						<%} %>
						<tr>
							<th colspan="7" align="center">
								等级E
							</th>
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
								平时成绩
							</th>
							<th>
								作业成绩
							</th>
							<th>
								得分
							</th>
						</tr>
						<% scores=scoreDao.getScoresByCidAndLevel(cid, "E");
							for(int i=0;i<scores.size();i++){
							Student student=studentDao.getStudentBySId(scores.get(i).getSid());		
						%>
						<% if(i%4==0){ %><tr>
						<% }else if(i%4==1){ %><tr class="success">
						<% }else if(i%4==2){ %><tr class="error">
						<% }else if(i%4==3){ %><tr class="warning">
						<% } %>
							<td>
								<input type="hidden" name="cid" value="<%=cid%>">
								<%=student.getUsername() %>
							</td>
							<td>
								<%=student.getSname() %>
							</td>
							<td>
								<%=student.getClassid() %>
							</td>
							<td>
								<%=scores.get(i).getTimecard_part() %>
							</td>
							<td>
								<%=scores.get(i).getHomework_part() %>
							</td>
							<td>
								<%=scores.get(i).getTimecard_part()+scores.get(i).getHomework_part() %>
							</td>
						</tr>
						<%} %>
						<%
							SkillDao skillDao=new SkillDao();
							ArrayList<Skill> skills=skillDao.getSkillsByCid(cid);
						%>
						<tr>
							<th colspan="7" align="center">
								技能掌握程度
							</th>
						</tr>
						<tr>
							<th>
								技能点
							</th>
							<th>
								名称
							</th>
							<th>
								描述
							</th>
							<th>
								学生熟练度
							</th>
						</tr>
						<% 
							for(int i=0;i<skills.size();i++){	
						%>
						<% if(i%4==0){ %><tr>
						<% }else if(i%4==1){ %><tr class="success">
						<% }else if(i%4==2){ %><tr class="error">
						<% }else if(i%4==3){ %><tr class="warning">
						<% } %>
							<td>
								<input type="hidden" name="cid" value="<%=cid%>">
								<%=skills.get(i).getSkill_id()%>
							</td>
							<td>
								<%=skills.get(i).getSkill_name()%>
							</td>
							<td>
								<%=skills.get(i).getSkill_info()%>
							</td>
							<td>
								<%=skills.get(i).getDegree()/skills.get(i).getNum()%>
							</td>
						</tr>
						<%} %>
					<% if (exportToExcel == null) {  
				    %>  
				    <tr>
				    	<th>
				    		<a href="report.jsp?exportToExcel=YES">Export to Excel</a>  
				    	<th>
				    </tr>
				    <%  
				        }  
				    %>  
					</tbody>
				</table>
			</div>
		</div>
	</div>
  </body>
</html>
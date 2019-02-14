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
								<a href="/CourseSystem/scoreServlet?method=getScore&cid=<%=cid%>">生成或更新成绩列表</a>
							</th>
						</tr>
						<tr>
							<th colspan="7" align="center">
								<a href="score.jsp?level=A">等级A</a>==
								<a href="score.jsp?level=B">等级B</a>==
								<a href="score.jsp?level=C">等级C</a>==
								<a href="score.jsp?level=D">等级D</a>==
								<a href="score.jsp?level=E">等级E</a>
							</th>
						</tr>
					</thead>
					<tbody>
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
							<th>
								等级
							</th>
						</tr>
						<% for(int i=0;i<scores.size();i++){
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
							<td>
								 <%=scores.get(i).getLevel() %>
							</td>
						</tr>
						<%} %>
						<tr>
							<td colspan="7"><a href="right.jsp">返回上一页</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
  </body>
</html>
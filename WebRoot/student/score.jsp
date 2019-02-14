<%@page import="com.course.dao.*"%>
<%@page import="com.course.bean.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%  ScoreDao scoreDao=new ScoreDao();
	Student student=(Student)session.getAttribute("student");
	int cid=0;
	if(request.getParameter("cid")==null){
		cid=(Integer)session.getAttribute("cid");
	}else{
		cid=Integer.parseInt(request.getParameter("cid"));
		session.setAttribute("cid", cid);
	}
	ArrayList<Score> scores=null;
	String level=request.getParameter("level");
	scores=scoreDao.getScoresByCid(cid);
	
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
							while(scores.get(i).getSid()!=student.getSid()&&i<scores.size()-1){
								i++;
							}
						%>
						<tr class="success">
							<td>
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
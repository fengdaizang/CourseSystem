<%@page import="com.course.dao.*"%>
<%@page import="com.course.bean.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% Student student=(Student)request.getSession().getAttribute("student");
	int cid=Integer.parseInt(request.getParameter("cid"));
	TimeCardDao timeCardDao=new TimeCardDao();
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
								出勤次数
							</th>
							<th>
								缺勤次数
							</th>
						</tr>
					</thead>
					<tbody>
						<% 
							TimeCard timeCard=new TimeCard();
							timeCard=timeCardDao.getTimeCardBySidAndCid(student.getSid(), cid);
						%>
						<tr class="success">
							<td>
								<%=student.getSid() %>
							</td>
							<td>
								<%=student.getUsername() %>
							</td>
							<td>
								<%=student.getClassid() %>
							</td>
							<td>
								 <%=timeCard.getCheckin() %>
							</td>
							<td>
								 <%=timeCard.getCheckout() %>
							</td>
						</tr>
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
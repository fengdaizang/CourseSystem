package com.course.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.course.bean.Homework;
import com.course.dao.HomeworkDao;
import com.course.utils.StringUtils;
import com.course.utils.TimeUtils;

public class HomeworkServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public HomeworkServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String method=request.getParameter("method");
		HomeworkDao homeworkDao=new HomeworkDao();
		
		
		//添加作业
		if(method.equals("addHomework")){
			String title=StringUtils.change(request.getParameter("title"));
			String content=StringUtils.change(request.getParameter("content"));
			String deadline=request.getParameter("deadline");
			int cid=Integer.parseInt(request.getParameter("cid"));
			
			Homework homework=new Homework();
			homework.setCid(cid);
			homework.setContent(content);
			homework.setDeadline(deadline);
			homework.setTitle(title);
			homework.setCreate_time(TimeUtils.getCurrentTime());
			
			homeworkDao.addHomework(homework);
			
			response.sendRedirect("teacher/homework.jsp?cid="+cid);
		//修改作业
		}else if(method.equals("editHomework")){
			String title=StringUtils.change(request.getParameter("title"));
			String content=StringUtils.change(request.getParameter("content"));
			String deadline=request.getParameter("deadline");
			int cid=Integer.parseInt(request.getParameter("cid"));
			
			Homework homework=new Homework();
			homework.setCid(cid);
			homework.setContent(content);
			homework.setDeadline(deadline);
			homework.setTitle(title);
			
			int hw_id=Integer.parseInt(request.getParameter("hw_id"));
			
			homework.setHw_id(hw_id);
			
			homeworkDao.editHomework(homework);
			
			response.sendRedirect("teacher/homework.jsp?cid="+cid);
		//删除作业
		}else if(method.equals("deleteHomework")){
			int cid=Integer.parseInt(request.getParameter("cid"));
			
			int hw_id=Integer.parseInt(request.getParameter("hw_id"));
			
			homeworkDao.deleteHomework(hw_id);
			
			response.sendRedirect("teacher/homework.jsp?cid="+cid);
		}
		
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}

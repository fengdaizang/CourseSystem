package com.course.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.course.dao.SkillDao;
import com.course.dao.TaskDao;

public class TaskServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public TaskServlet() {
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
		TaskDao taskDao=new TaskDao();
		SkillDao skillDao=new SkillDao();
		
		//作业评分
		if(method.equals("addScore")){
			int task_id=Integer.parseInt(request.getParameter("task_id"));
			int cid=Integer.parseInt(request.getParameter("cid"));
			int score=Integer.parseInt(request.getParameter("score"));
			
			String level="";
			if(score>=90){
				level="A";
			}else if(score>=80){
				level="B";
			}else if(score>=70){
				level="C";
			}else if(score>=60){
				level="D";
			}else{
				level="E";
			}
			
			taskDao.addTaskScore(task_id, score,level);
			
			int skill_id=Integer.parseInt(request.getParameter("skill_id"));
			int degree=Integer.parseInt(request.getParameter("degree"));
			skillDao.addDegree(skill_id, degree);
			
			
			response.sendRedirect("teacher/task.jsp?cid="+cid);
			
		}
		
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

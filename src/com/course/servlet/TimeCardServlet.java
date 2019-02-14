package com.course.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.course.bean.Course;
import com.course.bean.Student;
import com.course.dao.CourseDao;
import com.course.dao.StudentDao;
import com.course.dao.TimeCardDao;

public class TimeCardServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public TimeCardServlet() {
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
		TimeCardDao timeCardDao=new TimeCardDao();
		CourseDao courseDao=new CourseDao();
		StudentDao studentDao=new StudentDao();
		
		//出勤
		if(method.equals("checkin")){
			int sid=Integer.parseInt(request.getParameter("sid"));
			int cid=Integer.parseInt(request.getParameter("cid"));
			
			timeCardDao.check(sid, cid, 1, 0);
			
			response.sendRedirect("teacher/timecard.jsp");
		//缺勤
		}else if(method.equals("checkout")){
			int sid=Integer.parseInt(request.getParameter("sid"));
			int cid=Integer.parseInt(request.getParameter("cid"));
			
			timeCardDao.check(sid, cid, 0, 1);
			response.sendRedirect("teacher/timecard.jsp");
		//考勤情况查看
		}else if(method.equals("timeCardInfo")){
			int cid=Integer.parseInt(request.getParameter("cid"));
			Course course=courseDao.getCoursesByCid(cid);
			ArrayList<Student> students=studentDao.getStudentsByClassid(course.getClassid());
			
			request.getSession().setAttribute("students", students);
			request.getSession().setAttribute("course", course);
			
			response.sendRedirect("teacher/timecardInfo.jsp");
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

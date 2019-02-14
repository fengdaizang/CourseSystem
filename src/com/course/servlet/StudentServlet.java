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
import com.course.bean.TimeCard;
import com.course.dao.CourseDao;
import com.course.dao.StudentDao;
import com.course.dao.TimeCardDao;
import com.course.utils.StringUtils;

public class StudentServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public StudentServlet() {
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
		CourseDao courseDao=new CourseDao();
		StudentDao studentDao=new StudentDao();
		TimeCardDao timeCardDao=new TimeCardDao();
		
		//用户退出登录
		if(method.equals("logout")){
			request.getSession().setAttribute("student", null);
			response.sendRedirect("index.jsp");
		//考勤-得到对应课程-对应班级-对应学生
		}else if(method.equals("timecard")){
			int cid=Integer.parseInt(request.getParameter("cid"));
			Course course=courseDao.getCoursesByCid(cid);
			ArrayList<Student> students=studentDao.getStudentsByClassid(course.getClassid());
			
			request.getSession().setAttribute("students", students);
			request.getSession().setAttribute("course", course);
			TimeCard timeCard=timeCardDao.getTimeCardBySidAndCid(students.get(0).getSid(), cid);
			
			int time=1;
			if(timeCard.getCid()!=0){
				time=timeCard.getCheckin()+timeCard.getCheckout()+1;
			}
			request.getSession().setAttribute("time", time);
			
			response.sendRedirect("teacher/timecard.jsp");
		//学生修改个人信息	
		}else if(method.equals("modifyInfo")){
			String sname=StringUtils.change(request.getParameter("sname"));
			int age=Integer.parseInt(request.getParameter("age"));
			int sex=Integer.parseInt(request.getParameter("sex"));
			int sid=Integer.parseInt(request.getParameter("sid"));
			
			studentDao.modifyInfo(sname, age, sex, sid);
			
			Student student=studentDao.getStudentBySId(sid);
			
			request.getSession().setAttribute("student", student);
			
			response.sendRedirect("student/right.jsp");
			
		//学生修改密码	
		}else if(method.equals("modifyPassword")){
			String password=request.getParameter("sname");
			int sid=Integer.parseInt(request.getParameter("sid"));
			
			studentDao.modifyPassword(password, sid);
			
			Student student=studentDao.getStudentBySId(sid);
			
			request.getSession().setAttribute("student", student);
			
			response.sendRedirect("student/right.jsp");
			
			
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

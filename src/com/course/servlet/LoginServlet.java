package com.course.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.course.bean.Admin;
import com.course.bean.Course;
import com.course.bean.Designer;
import com.course.bean.Student;
import com.course.bean.Teacher;
import com.course.dao.AdminDao;
import com.course.dao.CourseDao;
import com.course.dao.DesignerDao;
import com.course.dao.StudentDao;
import com.course.dao.TeacherDao;

public class LoginServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LoginServlet() {
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
		
		String type=request.getParameter("type");
		StudentDao studentDao=new StudentDao();
		TeacherDao teacherDao=new TeacherDao();
		CourseDao courseDao=new CourseDao();
		DesignerDao designerDao=new DesignerDao();
		AdminDao adminDao=new AdminDao();
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		//学生登录
		if(type.equals("1")){
			Student student=studentDao.studentLogin(username, password);
			if(student.getUsername()!=null){
				request.getSession().setAttribute("student", student);
				
				ArrayList<Course> courses=courseDao.getCoursesByClassid(student.getClassid());
				request.getSession().setAttribute("courses", courses);
				
				response.sendRedirect("student/index.jsp");
			}else{
				request.getSession().setAttribute("msg", "用户名，密码或者身份不匹配，请重新登录");
				
				response.sendRedirect("index.jsp");
			}
		//教师登录
		}else if(type.equals("2")){
			Teacher teacher=teacherDao.teacherLogin(username, password);
			if(teacher.getUsername()!=null){
				request.getSession().setAttribute("teacher", teacher);
				
				ArrayList<Course> courses=courseDao.getCoursesByTid(teacher.getTid());
				request.getSession().setAttribute("courses", courses);
				
				response.sendRedirect("teacher/index.jsp");
			}else{
				request.getSession().setAttribute("msg", "用户名，密码或者身份不匹配，请重新登录");
				
				response.sendRedirect("index.jsp");
			}
			
		//设计者登录
		}else if(type.equals("3")){
			Designer designer=designerDao.designerLogin(username, password);
			if(designer.getUsername()!=null){
				request.getSession().setAttribute("designer", designer);
				
				ArrayList<Course> courses=courseDao.getCourses();
				request.getSession().setAttribute("courses", courses);
				
				response.sendRedirect("designer/index.jsp");
			}else{
				request.getSession().setAttribute("msg", "用户名，密码或者身份不匹配，请重新登录");
				
				response.sendRedirect("index.jsp");
			}
		//管理员登录
		}else if(type.equals("4")){
			Admin admin=adminDao.adminLogin(username, password);
			if(admin.getUsername()!=null){
				request.getSession().setAttribute("admin", admin);
				
				response.sendRedirect("admin/index.jsp");
			}else{
				request.getSession().setAttribute("msg", "用户名，密码或者身份不匹配，请重新登录");
				
				response.sendRedirect("index.jsp");
			}
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

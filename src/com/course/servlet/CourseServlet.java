package com.course.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.course.bean.Course;
import com.course.dao.CourseDao;
import com.course.utils.StringUtils;

public class CourseServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public CourseServlet() {
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
		//修改课程
		if(method.equals("editCourse")){
			String ctime=StringUtils.change(request.getParameter("ctime"));
			int cid=Integer.parseInt(request.getParameter("cid"));
			int classid=Integer.parseInt(request.getParameter("classid"));
			String cname=StringUtils.change(request.getParameter("cname"));
			int teacherid=Integer.parseInt(request.getParameter("teacherid"));
			
			Course course=new Course();
			course.setCid(cid);
			course.setClassid(classid);
			course.setCname(cname);
			course.setCtime(ctime);
			course.setTeacherid(teacherid);
			
			courseDao.editCourse(course);
			
			ArrayList<Course> courses=courseDao.getCourses();
			request.getSession().setAttribute("courses", courses);
			
			response.sendRedirect("designer/course.jsp");
		//添加课程
		}else if(method.equals("addCourse")){
			String ctime=StringUtils.change(request.getParameter("ctime"));
			int classid=Integer.parseInt(request.getParameter("classid"));
			String cname=StringUtils.change(request.getParameter("cname"));
			int teacherid=Integer.parseInt(request.getParameter("teacherid"));
			
			Course course=new Course();
			course.setClassid(classid);
			course.setCname(cname);
			course.setCtime(ctime);
			course.setTeacherid(teacherid);
			
			courseDao.addCourse(course);
			
			ArrayList<Course> courses=courseDao.getCourses();
			request.getSession().setAttribute("courses", courses);
			
			response.sendRedirect("designer/course.jsp");
		//删除课程
		}else if(method.equals("deleteCourse")){
			int cid=Integer.parseInt(request.getParameter("cid"));
			
			courseDao.deleteCourse(cid);
			
			ArrayList<Course> courses=courseDao.getCourses();
			request.getSession().setAttribute("courses", courses);
			
			response.sendRedirect("designer/course.jsp");
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

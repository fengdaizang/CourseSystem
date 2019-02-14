package com.course.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.course.bean.Teacher;
import com.course.dao.TeacherDao;
import com.course.utils.StringUtils;

public class TeacherServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public TeacherServlet() {
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
		
		TeacherDao teacherDao=new TeacherDao();
		
		String method=request.getParameter("method");
		//修改个人信息
		if(method.equals("modifyInfo")){
			String tname=StringUtils.change(request.getParameter("tname"));
			String tphone=request.getParameter("tphone");
			String temail=request.getParameter("temail");
			int tid=Integer.parseInt(request.getParameter("tid"));
			int sex=Integer.parseInt(request.getParameter("sex"));
			
			teacherDao.modifyInfo(tname, tphone, temail, sex, tid);
			
			Teacher teacher=teacherDao.getTeacherByTid(tid);
			
			request.getSession().setAttribute("teacher", teacher);
			
			response.sendRedirect("teacher/right.jsp");
		//修改密码	
		}else if(method.equals("modifyPassword")){

			String password=request.getParameter("password");
			int tid=Integer.parseInt(request.getParameter("tid"));
			
			teacherDao.modifyPassword(password, tid);
			
			Teacher teacher=teacherDao.getTeacherByTid(tid);
			
			request.getSession().setAttribute("teacher", teacher);
			
			response.sendRedirect("teacher/right.jsp");
		//退出登录
		}else if(method.equals("logout")){
			request.getSession().setAttribute("teacher", null);
			response.sendRedirect("index.jsp");
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

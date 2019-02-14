package com.course.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.course.bean.Designer;
import com.course.bean.Student;
import com.course.bean.Teacher;
import com.course.dao.DesignerDao;
import com.course.dao.StudentDao;
import com.course.dao.TeacherDao;
import com.course.utils.StringUtils;

public class AdminServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AdminServlet() {
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
		StudentDao studentDao=new StudentDao();
		TeacherDao teacherDao=new TeacherDao();
		DesignerDao designerDao=new DesignerDao();
		
		//删除学生
		if(method.equals("deleteStudent")){
			int sid=Integer.parseInt(request.getParameter("sid"));
			studentDao.deleteStudent(sid);
			response.sendRedirect("admin/student.jsp");
		//修改学生
		}else if(method.equals("editStudent")){
			String sname=StringUtils.change(request.getParameter("sname"));
			int age=Integer.parseInt(request.getParameter("age"));
			int sex=Integer.parseInt(request.getParameter("sex"));
			int sid=Integer.parseInt(request.getParameter("sid"));
			
			studentDao.modifyInfo(sname, age, sex, sid);
			
			response.sendRedirect("admin/student.jsp");
		//添加学生	
		}else if(method.equals("addStudent")){
			String sname=StringUtils.change(request.getParameter("sname"));
			String username=StringUtils.change(request.getParameter("username"));
			String password=StringUtils.change(request.getParameter("password"));
			int age=Integer.parseInt(request.getParameter("age"));
			int sex=Integer.parseInt(request.getParameter("sex"));
			int classid=Integer.parseInt(request.getParameter("classid"));
			
			Student student=new Student();
			student.setAge(age);
			student.setClassid(classid);
			student.setPassword(password);
			student.setSex(sex);
			student.setSname(sname);
			student.setUsername(username);
			
			studentDao.addStudent(student);
			
			response.sendRedirect("admin/student.jsp");
		//删除教师
		}else if(method.equals("deleteTeacher")){
			int tid=Integer.parseInt(request.getParameter("tid"));
			teacherDao.deleteTeacher(tid);
			response.sendRedirect("admin/teacher.jsp");
		//修改教师
		}else if(method.equals("editTeacher")){
			String tname=StringUtils.change(request.getParameter("tname"));
			String tphone=request.getParameter("tphone");
			String temail=request.getParameter("temail");
			int tid=Integer.parseInt(request.getParameter("tid"));
			int sex=Integer.parseInt(request.getParameter("sex"));
			
			teacherDao.modifyInfo(tname, tphone, temail, sex, tid);
			
			response.sendRedirect("admin/teacher.jsp");
		//添加老师
		}else if(method.equals("addTeacher")){
			String tname=StringUtils.change(request.getParameter("tname"));
			String username=StringUtils.change(request.getParameter("username"));
			String password=StringUtils.change(request.getParameter("password"));
			int sex=Integer.parseInt(request.getParameter("sex"));
			String tphone=StringUtils.change(request.getParameter("tphone"));
			String temail=StringUtils.change(request.getParameter("temail"));
			
			Teacher teacher=new Teacher();
			teacher.setPassword(password);
			teacher.setSex(sex);
			teacher.setTemail(temail);
			teacher.setTname(tname);
			teacher.setTphone(tphone);
			teacher.setUsername(username);
			
			teacherDao.addTeacher(teacher);
			
			response.sendRedirect("admin/teacher.jsp");
		//删除设计者
		}else if(method.equals("deleteDesigner")){
			int did=Integer.parseInt(request.getParameter("did"));
			designerDao.deleteDesigner(did);
			response.sendRedirect("admin/designer.jsp");
		//修改设计者
		}else if(method.equals("editDesigner")){
			String dname=StringUtils.change(request.getParameter("dname"));
			String dphone=request.getParameter("dphone");
			String demail=request.getParameter("demail");
			int did=Integer.parseInt(request.getParameter("did"));
			int dsex=Integer.parseInt(request.getParameter("dsex"));
			
			designerDao.modifyInfo(dname, dphone, demail, dsex, did);
			
			response.sendRedirect("admin/designer.jsp");
		//添加设计者
		}else if(method.equals("addDesigner")){
			String dname=StringUtils.change(request.getParameter("dname"));
			String username=StringUtils.change(request.getParameter("username"));
			String password=StringUtils.change(request.getParameter("password"));
			int dsex=Integer.parseInt(request.getParameter("dsex"));
			String dphone=StringUtils.change(request.getParameter("dphone"));
			String demail=StringUtils.change(request.getParameter("demail"));
			
			Designer designer=new Designer();
			designer.setDemail(demail);
			designer.setDname(dname);
			designer.setDphone(dphone);
			designer.setDsex(dsex);
			designer.setPassword(password);
			designer.setUsername(username);
			
			designerDao.addDesigner(designer);
			
			response.sendRedirect("admin/designer.jsp");
		//退出登录
		}else if(method.equals("logout")){
			request.getSession().setAttribute("admin", null);
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

package com.course.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.course.bean.Skill;
import com.course.dao.SkillDao;
import com.course.utils.StringUtils;

public class SkillServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SkillServlet() {
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
		SkillDao skillDao=new SkillDao();
		
		
		//添加作业
		if(method.equals("addSkill")){
			String skill_name=StringUtils.change(request.getParameter("skill_name"));
			String skill_info=StringUtils.change(request.getParameter("skill_info"));
			int cid=Integer.parseInt(request.getParameter("cid"));
			
			Skill skill=new Skill();
			skill.setCid(cid);
			skill.setSkill_info(skill_info);
			skill.setSkill_name(skill_name);
			
			skillDao.addSkill(skill);
			
			response.sendRedirect("teacher/skill.jsp?cid="+cid);
		//修改作业
		}else if(method.equals("editSkill")){
			String skill_name=StringUtils.change(request.getParameter("skill_name"));
			String skill_info=StringUtils.change(request.getParameter("skill_info"));
			int cid=Integer.parseInt(request.getParameter("cid"));
			
			Skill skill=new Skill();
			skill.setCid(cid);
			skill.setSkill_info(skill_info);
			skill.setSkill_name(skill_name);
			
			int skill_id=Integer.parseInt(request.getParameter("skill_id"));
			
			skill.setSkill_id(skill_id);
			
			skillDao.editSkill(skill);
			
			response.sendRedirect("teacher/skill.jsp?cid="+cid);
		//删除作业
		}else if(method.equals("deleteHomework")){
			int cid=Integer.parseInt(request.getParameter("cid"));
			
			int skill_id=Integer.parseInt(request.getParameter("skill_id"));
			
			skillDao.deleteSkill(skill_id);
			
			response.sendRedirect("teacher/skill.jsp?cid="+cid);
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

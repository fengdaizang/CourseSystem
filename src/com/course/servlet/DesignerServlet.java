package com.course.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.course.bean.Designer;
import com.course.dao.DesignerDao;
import com.course.utils.StringUtils;

public class DesignerServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DesignerServlet() {
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

		DesignerDao designerDao=new DesignerDao();
		
		String method=request.getParameter("method");
		//修改个人信息
		if(method.equals("modifyInfo")){
			String dname=StringUtils.change(request.getParameter("dname"));
			String dphone=request.getParameter("dphone");
			String demail=request.getParameter("demail");
			int did=Integer.parseInt(request.getParameter("did"));
			int dsex=Integer.parseInt(request.getParameter("dsex"));
			
			designerDao.modifyInfo(dname, dphone, demail, dsex, did);
			
			Designer designer=designerDao.getDesignerByDid(did);
			
			request.getSession().setAttribute("designer", designer);
			
			response.sendRedirect("designer/right.jsp");
		//修改密码	
		}else if(method.equals("modifyPassword")){

			String password=request.getParameter("password");
			int did=Integer.parseInt(request.getParameter("did"));
			
			designerDao.modifyPassword(password, did);
			
			Designer designer=designerDao.getDesignerByDid(did);
			
			request.getSession().setAttribute("designer", designer);
			
			response.sendRedirect("designer/right.jsp");
		//退出登录
		}else if(method.equals("logout")){
			request.getSession().setAttribute("designer", null);
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

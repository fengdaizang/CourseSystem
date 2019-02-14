package com.course.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.course.bean.Course;
import com.course.bean.Homework;
import com.course.bean.Percent;
import com.course.bean.Score;
import com.course.bean.Student;
import com.course.bean.Task;
import com.course.bean.TimeCard;
import com.course.dao.CourseDao;
import com.course.dao.HomeworkDao;
import com.course.dao.PercentDao;
import com.course.dao.ScoreDao;
import com.course.dao.StudentDao;
import com.course.dao.TaskDao;
import com.course.dao.TimeCardDao;

public class ScoreServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ScoreServlet() {
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
		HomeworkDao homeworkDao=new HomeworkDao();
		TaskDao taskDao=new TaskDao();
		ScoreDao scoreDao=new ScoreDao();
		StudentDao studentDao=new StudentDao();
		PercentDao percentDao=new PercentDao();
		CourseDao courseDao=new CourseDao();
		
		//生成成绩
		if(method.equals("getScore")){
			int cid=Integer.parseInt(request.getParameter("cid"));
			Course course=courseDao.getCoursesByCid(cid);
			scoreDao.deleteScore(cid);
			ArrayList<Student> students=studentDao.getStudentsByClassid(course.getClassid());
			Percent percent=percentDao.getPercentByCid(cid);
			for (Student student : students) {
				TimeCard timeCard=timeCardDao.getTimeCardBySidAndCid(student.getSid(), cid);
				double timecard_count=timeCard.getCheckin()*100.00/(timeCard.getCheckin()+timeCard.getCheckout());
				
				double homework_count=0.0;
				ArrayList<Homework> homeworks=homeworkDao.getHomeworksByCid(cid);
				for (Homework homework : homeworks) {
					Task task=taskDao.getTaskBySidAndHw_id(student.getSid(), homework.getHw_id());
					homework_count+=task.getScore();
				}
				homework_count=homework_count*1.0/homeworks.size();
				
				double timecard_part=timecard_count*10/percent.getTimecard_part();
				double homework_part=homework_count*10/percent.getHomework_part();
				
				double score=timecard_part+homework_part;
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
				
				Score score2=new Score();
				score2.setCid(cid);
				score2.setHomework_part((int)homework_part);
				score2.setLevel(level);
				score2.setSid(student.getSid());
				score2.setTimecard_part((int)timecard_part);
				
				scoreDao.addScore(score2);
			}
			
			response.sendRedirect("teacher/score.jsp");
			
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

package com.course.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.course.bean.Course;
import com.course.utils.DBUtils;

public class CourseDao {
	private DBUtils dbUtils=new DBUtils();
	
	private Course getBean(ResultSet rs) throws SQLException{
		Course course=new Course();
		
		course.setCid(rs.getInt("cid"));
		course.setClassid(rs.getInt("classid"));
		course.setCname(rs.getString("cname"));
		course.setTeacherid(rs.getInt("teacherid"));
		course.setCtime(rs.getString("ctime"));
		
		return course;		
	}
	/**
	 * 通过班级id得到所有的课程信息----学生
	 * @param classesId
	 * @return
	 */
	public ArrayList<Course> getCoursesByClassid(int classid){
		ArrayList<Course> courses=new ArrayList<Course>();
		String sql="select * from course where classid="+classid;
		ResultSet rSet=dbUtils.doQuery(sql);
		
		if(rSet!=null){
			try {
				while(rSet.next()){
					courses.add(getBean(rSet));
				}
				rSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return courses;
	}
	/**
	 * 通过教师id得到所有的课程信息----老师
	 * @param classesId
	 * @return
	 */
	public ArrayList<Course> getCoursesByTid(int tid){
		ArrayList<Course> courses=new ArrayList<Course>();
		String sql="select * from course where teacherId="+tid;
		ResultSet rSet=dbUtils.doQuery(sql);
		
		if(rSet!=null){
			try {
				while(rSet.next()){
					courses.add(getBean(rSet));
				}
				rSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return courses;
	}
	/**
	 * 通过id得到课程信息
	 * @param id
	 * @return
	 */
	public Course getCoursesByCid(int cid){
		Course course=new Course();
		String sql="select * from course where cid="+cid;
		ResultSet rSet=dbUtils.doQuery(sql);
		
		if(rSet!=null){
			try {
				while(rSet.next()){
					course=getBean(rSet);
				}
				rSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return course;
	}
	/**
	 * 得到所有课程
	 * @return
	 */
	public ArrayList<Course> getCourses(){
		ArrayList<Course> courses=new ArrayList<Course>();
		String sql="select * from course ";
		ResultSet rSet=dbUtils.doQuery(sql);
		
		if(rSet!=null){
			try {
				while(rSet.next()){
					courses.add(getBean(rSet));
				}
				rSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return courses;
	}
	
	/**
	 * 编辑课程信息
	 * @param course
	 * @return
	 */
	public int editCourse(Course course){
		String sql="update course set ctime='"+course.getCtime()
				+"',cname='"+course.getCname()
				+"',teacherid="+course.getTeacherid()
				+",classid="+course.getClassid()
				+" where cid="+course.getCid();
		
		try {
			dbUtils.doUpdate(sql);
			return 	1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	/**
	 * 添加课程
	 * @param course
	 * @return
	 */
	public int addCourse(Course course){
		String sql="insert into course(ctime,cname,teacherid,classid) values('"
				+course.getCtime()+"','"+course.getCname()+"',"+course.getTeacherid()
				+","+course.getClassid()+")";
		
		try {
			dbUtils.doUpdate(sql);
			return 	1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	/**
	 * 删除课程
	 * @param id
	 * @return
	 */
	public int deleteCourse(int cid){
		String sql="delete from course where cid="+cid;
		
		try {
			dbUtils.doUpdate(sql);
			return 	1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
}

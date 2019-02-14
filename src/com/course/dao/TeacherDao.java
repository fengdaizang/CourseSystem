package com.course.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.course.bean.Teacher;
import com.course.utils.DBUtils;

public class TeacherDao {
	private DBUtils dbUtils=new DBUtils();
	
	private Teacher getBean(ResultSet rs) throws SQLException{
		Teacher teacher=new Teacher();
		
		teacher.setPassword(rs.getString("password"));
		teacher.setSex(rs.getInt("sex"));
		teacher.setTemail(rs.getString("temail"));
		teacher.setTid(rs.getInt("tid"));
		teacher.setTname(rs.getString("tname"));
		teacher.setTphone(rs.getString("tphone"));
		teacher.setUsername(rs.getString("username"));
		
		return teacher;
		
	}
	/**
	 * 教师登录
	 * @param username
	 * @param password
	 * @return
	 */
	public Teacher teacherLogin(String username,String password){
		Teacher teacher=new Teacher();
		
		String sql="select * from teacher where username='"
				+username+"' and password='"+password+"'";
		
		ResultSet rSet=dbUtils.doQuery(sql);
		
		if(rSet!=null){
			try {
				while(rSet.next()){
					teacher=getBean(rSet);
				}
				rSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return teacher;
	}
	/**
	 * 通过tid得到教师信息
	 * @param tid
	 * @return
	 */
	public Teacher getTeacherByTid(int tid){
		Teacher teacher=new Teacher();
		
		String sql="select * from teacher where tid="+tid;
		
		ResultSet rSet=dbUtils.doQuery(sql);
		
		if(rSet!=null){
			try {
				while(rSet.next()){
					teacher=getBean(rSet);
				}
				rSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return teacher;
	}
	/**
	 * 得到所有的老师信息
	 * @return
	 */
	public ArrayList<Teacher> getTeachers(){
		ArrayList<Teacher> teachers=new ArrayList<Teacher>();
		
		String sql="select * from teacher";
		
		ResultSet rSet=dbUtils.doQuery(sql);
		
		if(rSet!=null){
			try {
				while(rSet.next()){
					teachers.add(getBean(rSet));
				}
				rSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return teachers;
	}
	/**
	 * 修改老师信息
	 * @param tname
	 * @param tphone
	 * @param temail
	 * @param sex
	 * @param tid
	 */
	public void modifyInfo(String tname,String tphone,String temail,int sex,int tid){
		String sql="update teacher set tname='"+tname+"',sex="+sex
				+",tphone='"+tphone+"',temail='"+temail+"' where tid="+tid;
		
		try {
			dbUtils.doUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 修改密码
	 * @param password
	 * @param sid
	 */
	public void modifyPassword(String password,int tid){
		String sql="update teacher set password='"+password+"' where tid="+tid;
		
		try {
			dbUtils.doUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 删除教师	
	 * @param tid
	 */
	public void deleteTeacher(int tid){
		String sql="delete from teacher where tid="+tid;
		
		try {
			dbUtils.doUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 添加教师
	 * @param tea
	 */
	public void addTeacher(Teacher tea){
		String sql="insert into teacher(username,password,tname,tphone,sex,temail) values('"
				+tea.getUsername()+"','"+tea.getPassword()+"','"
				+tea.getTname()+"','"+tea.getTphone()+"',"
				+tea.getSex()+",'"+tea.getTemail()+"')";
		
		try {
			dbUtils.doUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}

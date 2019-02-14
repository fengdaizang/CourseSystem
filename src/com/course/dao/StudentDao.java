package com.course.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.course.bean.Student;
import com.course.utils.DBUtils;

public class StudentDao {
	private DBUtils dbUtils=new DBUtils();
	
	private Student getBean(ResultSet rs) throws SQLException{
		Student student=new Student();
		
		student.setAge(rs.getInt("age"));
		student.setClassid(rs.getInt("classid"));
		student.setPassword(rs.getString("password"));
		student.setSex(rs.getInt("sex"));
		student.setSid(rs.getInt("sid"));
		student.setSname(rs.getString("sname"));
		student.setUsername(rs.getString("username"));
		
		return student;
	}
	/**
	 * 学生登录
	 * @param sno
	 * @param password
	 * @return
	 */
	public Student studentLogin(String username,String password){
		Student student=new Student();
		String sql="select * from student where username='"
				+username+"' and password='"+password+"'";
		
		ResultSet rSet=dbUtils.doQuery(sql);
		
		if(rSet!=null){
			try {
				while(rSet.next()){
					student=getBean(rSet);
				}
				rSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return student;
	}
	/**
	 * 通过班级id得到学生
	 * @param classesId
	 * @return
	 */
	public ArrayList<Student> getStudentsByClassid(int classid){
		ArrayList<Student> students=new ArrayList<Student>();
		String sql="select * from student where classid="+classid;
		ResultSet rSet=dbUtils.doQuery(sql);
		
		if(rSet!=null){
			try {
				while(rSet.next()){
					students.add(getBean(rSet));
				}
				rSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return students;
	}
	/**
	 * 通过班级id得到学生
	 * @param classesId
	 * @return
	 */
	public ArrayList<Student> getStudents(){
		ArrayList<Student> students=new ArrayList<Student>();
		String sql="select * from student";
		ResultSet rSet=dbUtils.doQuery(sql);
		
		if(rSet!=null){
			try {
				while(rSet.next()){
					students.add(getBean(rSet));
				}
				rSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return students;
	}
	/**
	 * 通过id得到学生信息
	 * @param id
	 * @return
	 */
	public Student getStudentBySId(int sid){
		Student student=new Student();
		String sql="select * from student where sid="+sid;
		ResultSet rSet=dbUtils.doQuery(sql);
		
		if(rSet!=null){
			try {
				while(rSet.next()){
					student=getBean(rSet);
				}
				rSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return student;
	}
	/**
	 * 修改个人信息
	 * @param sname
	 * @param age
	 * @param sex
	 * @param sid
	 */
	public void modifyInfo(String sname,int age,int sex,int sid){
		String sql="update student set sname='"+sname+"',sex="+sex
				+",age="+age+" where sid="+sid;
		
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
	public void modifyPassword(String password,int sid){
		String sql="update student set password='"+password+"' where sid="+sid;
		
		try {
			dbUtils.doUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 删除学生
	 * @param sid
	 */
	public void deleteStudent(int sid){
		String sql="delete from student where sid="+sid;
		
		try {
			dbUtils.doUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 添加学生
	 * @param stu
	 */
	public void addStudent(Student stu){
		String sql="insert into student(username,password,sname,age,sex,classid) values('"
				+stu.getUsername()+"','"+stu.getPassword()+"','"
				+stu.getSname()+"',"+stu.getAge()+","
				+stu.getSex()+","+stu.getClassid()+")";
		
		try {
			dbUtils.doUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

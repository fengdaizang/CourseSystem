package com.course.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.course.bean.Classes;
import com.course.utils.DBUtils;

public class ClassesDao {
	private DBUtils dbUtils=new DBUtils();
	
	private Classes getBean(ResultSet rs) throws SQLException{
		Classes classes=new Classes();
		
		classes.setClass_intro(rs.getString("class_intro"));
		classes.setCollege_name(rs.getString("college_name"));
		classes.setId(rs.getInt("id"));
		classes.setMajor_name(rs.getString("major_name"));
		
		return classes;
	}
	/**
	 * 得到所有的班级信息
	 * @return
	 */
	public ArrayList<Classes> getClasses(){
		ArrayList<Classes> classes=new ArrayList<Classes>();
		
		String sql="select * from classes";
		
		ResultSet rSet=dbUtils.doQuery(sql);
		
		if(rSet!=null){
			try {
				while(rSet.next()){
					classes.add(getBean(rSet));
				}
				rSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return classes;
	}
}

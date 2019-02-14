package com.course.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.course.bean.Admin;
import com.course.utils.DBUtils;

public class AdminDao {
	private DBUtils dbUtils=new DBUtils();
	
	private Admin getBean(ResultSet rs) throws SQLException{
		Admin admin=new Admin();
		
		admin.setAid(rs.getInt("aid"));
		admin.setPassword(rs.getString("password"));
		admin.setUsername(rs.getString("username"));
		
		return admin;
	}
	/**
	 * 管理员登录
	 * @param username
	 * @param password
	 * @return
	 */
	public Admin adminLogin(String username,String password){
		Admin admin=new Admin();
		
		String sql="select * from admin where username='"
				+username+"' and password='"+password+"'";
		
		ResultSet rSet=dbUtils.doQuery(sql);
		
		if(rSet!=null){
			try {
				while(rSet.next()){
					admin=getBean(rSet);
				}
				rSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return admin;
	}
	
}

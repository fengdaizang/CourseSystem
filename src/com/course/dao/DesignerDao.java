package com.course.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.course.bean.Designer;
import com.course.utils.DBUtils;

public class DesignerDao {
	private DBUtils dbUtils=new DBUtils();
	
	private Designer getBean(ResultSet rs) throws SQLException{
		Designer designer=new Designer();
		
		designer.setDemail(rs.getString("demail"));
		designer.setDid(rs.getInt("did"));
		designer.setDname(rs.getString("dname"));
		designer.setDphone(rs.getString("dphone"));
		designer.setDsex(rs.getInt("dsex"));
		designer.setPassword(rs.getString("password"));
		designer.setUsername(rs.getString("username"));
		
		return designer;
	}
	/**
	 * 设计者登录
	 * @param username
	 * @param password
	 * @return
	 */
	public Designer designerLogin(String username,String password){
		Designer designer=new Designer();
		String sql="select * from designer where username='"
				+username+"' and password='"+password+"'";
			
		ResultSet rSet=dbUtils.doQuery(sql);
		if(rSet!=null){
			try {
				while(rSet.next()){
					designer=getBean(rSet);
				}
				rSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
			
		return designer;
	}
	/**
	 * 得到所有设计者
	 * @return
	 */
	public ArrayList<Designer> getDesigners(){
		ArrayList<Designer> designers=new ArrayList<Designer>();
		String sql="select * from designer";
		ResultSet rSet=dbUtils.doQuery(sql);
		
		if(rSet!=null){
			try {
				while(rSet.next()){
					designers.add(getBean(rSet));
				}
				rSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return designers;
	}
	/**
	 * 通过did得到设计者信息
	 * @param did
	 * @return
	 */
	public Designer getDesignerByDid(int did){
		Designer designer=new Designer();
		
		String sql="select * from designer where did="+did;
		
		ResultSet rSet=dbUtils.doQuery(sql);
		
		if(rSet!=null){
			try {
				while(rSet.next()){
					designer=getBean(rSet);
				}
				rSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return designer;
	}
	/**
	 * 修改密码
	 * @param password
	 * @param did
	 */
	public void modifyPassword(String password,int did){
		String sql="update designer set password='"+password+"' where did="+did;
		
		try {
			dbUtils.doUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 修改个人信息
	 * @param dname
	 * @param dphone
	 * @param demail
	 * @param dsex
	 * @param did
	 */
	public void modifyInfo(String dname,String dphone,String demail,int dsex,int did){
		String sql="update designer set dname='"+dname+"',dsex="+dsex
				+",dphone='"+dphone+"',demail='"+demail+"' where did="+did;
		
		try {
			dbUtils.doUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 删除设计者
	 * @param did
	 */
	public void deleteDesigner(int did){
		String sql="delete from designer where did="+did;
		
		try {
			dbUtils.doUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 添加设计者
	 * @param des
	 */
	public void addDesigner(Designer des){
		String sql="insert into designer(username,password,dname,dphone,dsex,demail) values('"
				+des.getUsername()+"','"+des.getPassword()+"','"
				+des.getDname()+"','"+des.getDphone()+"',"
				+des.getDsex()+",'"+des.getDemail()+"')";
		
		try {
			dbUtils.doUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

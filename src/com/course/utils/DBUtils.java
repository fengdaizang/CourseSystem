package com.course.utils;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class DBUtils {
	private String driver="com.mysql.jdbc.Driver";
	private String url="jdbc:mysql:///coursesys";
	private String user="root";
	private String password="123456";
	
	private Connection connection;
	private Statement statement;
	/**
	 * 连接数据库
	 * @return
	 * @throws SQLException
	 */
	public Connection getConnection() throws Exception{
		Class.forName(driver);
		connection=(Connection) DriverManager.getConnection(url,user,password);
	
		return connection;
	}
	/**
	 * 执行查询语句
	 * @param sql
	 * @return
	 * @throws SQLException
	 */
	public ResultSet doQuery(String sql){
		try {
			connection = getConnection();
			statement = (Statement) connection.createStatement();
			return statement.executeQuery(sql);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * 执行增删改
	 * @param sql
	 * @return
	 * @throws SQLException
	 */
	public int doUpdate(String sql)	throws Exception{
		connection=getConnection();
		statement=(Statement) connection.createStatement();
		
		return statement.executeUpdate(sql);
	}
	/**
	 * 释放资源
	 */
	public void dispose(){
		try {
			if(statement!=null)
				statement.close();
			if(connection!=null)
				connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}
}

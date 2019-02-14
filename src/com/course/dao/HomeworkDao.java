package com.course.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.course.bean.Homework;
import com.course.utils.DBUtils;

public class HomeworkDao {
	private DBUtils dbUtils=new DBUtils();
	
	private Homework getBean(ResultSet rs) throws SQLException{
		Homework homework=new Homework();
		
		homework.setCid(rs.getInt("cid"));
		homework.setContent(rs.getString("content"));
		homework.setCreate_time(rs.getString("create_time"));
		homework.setDeadline(rs.getString("deadline"));
		homework.setHw_id(rs.getInt("hw_id"));
		homework.setTitle(rs.getString("title"));
		
		return homework;
		
	}
	/**
	 * 通过cid得到作业列表
	 * @param cid
	 * @return
	 */
	public ArrayList<Homework> getHomeworksByCid(int cid){
		ArrayList<Homework> homeworks=new ArrayList<Homework>();
		String sql="select * from homework where cid="+cid;
		ResultSet rSet=dbUtils.doQuery(sql);
		
		if(rSet!=null){
			try {
				while(rSet.next()){
					homeworks.add(getBean(rSet));
				}
				rSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return homeworks;
		
	}
	
	/**
	 * 添加作业
	 * @param percent
	 */
	public void addHomework(Homework homework){
		String sql="insert into homework(cid,title,content,deadline) values("
				+homework.getCid()+",'"+homework.getTitle()+"','"
				+homework.getContent()+"','"+homework.getDeadline()+"')";
		
		try {
			dbUtils.doUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 删除作业
	 * @param hw_id
	 */
	public void deleteHomework(int hw_id){
		String sql="delete from homework where hw_id="+hw_id;
		
		try {
			dbUtils.doUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 修改作业
	 * @param homework
	 */
	public void editHomework(Homework homework){
		String sql="update homework set title='"+homework.getTitle()
				+"',content='"+homework.getContent()+
				"',deadline='"+homework.getDeadline()
				+"' where hw_id="+homework.getHw_id();
		try {
			dbUtils.doUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

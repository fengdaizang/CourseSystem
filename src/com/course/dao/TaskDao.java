package com.course.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.course.bean.Task;
import com.course.utils.DBUtils;

public class TaskDao {
	private DBUtils dbUtils=new DBUtils();
	
	private Task getBean(ResultSet rs) throws SQLException{
		Task task=new Task();
		
		task.setFile_url(rs.getString("file_url"));
		task.setHw_id(rs.getInt("hw_id"));
		task.setScore(rs.getInt("score"));
		task.setSid(rs.getInt("sid"));
		task.setTask_id(rs.getInt("task_id"));
		
		return task;
	}
	
	public Task getTaskBySidAndHw_id(int sid,int hw_id){
		
		Task task=new Task();
		String sql="select * from task where sid="+sid+" and hw_id="+hw_id;
		ResultSet rSet=dbUtils.doQuery(sql);
		
		if(rSet!=null){
			try {
				while(rSet.next()){
					task=getBean(rSet);
				}
				rSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return task;
	}
	/**
	 * 学生上传作业
	 * @param task
	 */
	public void stuUploadTask(Task task){
		Task t=getTaskBySidAndHw_id(task.getSid(),task.getHw_id());
		String sql="";
		
		if(t.getTask_id()<=0){
			sql="insert into task(task_id,sid,hw_id,file_url) values("
					+task.getTask_id()+","+task.getSid()
					+","+task.getHw_id()+",'"+task.getFile_url()+"')";
		}else{
			sql="update task set file_url='"+task.getFile_url()
					+"' where task_id="+t.getTask_id();
		}
		
		try {
			dbUtils.doUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 通过作业标号得到所有学生作业
	 * @param hw_id
	 * @return
	 */
	public ArrayList<Task> getTasksByHw_id(int hw_id){
		
		ArrayList<Task> tasks=new ArrayList<Task>();
		String sql="select * from task where hw_id="+hw_id;
		ResultSet rSet=dbUtils.doQuery(sql);
		
		if(rSet!=null){
			try {
				while(rSet.next()){
					tasks.add(getBean(rSet));
				}
				rSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return tasks;
	}
	/**
	 * 添加成绩
	 * @param task_id
	 * @param score
	 */
	public void addTaskScore(int task_id,int score,String level){
		String sql="update task set score="+score
					+",level='"+level+"' where task_id="+task_id;
		
		try {
			dbUtils.doUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}

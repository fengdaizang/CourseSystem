package com.course.bean;

public class Task {
	private int task_id;
	private int sid;
	private int hw_id;
	private String file_url;
	private int score;
	public int getTask_id() {
		return task_id;
	}
	public void setTask_id(int task_id) {
		this.task_id = task_id;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getHw_id() {
		return hw_id;
	}
	public void setHw_id(int hw_id) {
		this.hw_id = hw_id;
	}
	public String getFile_url() {
		return file_url;
	}
	public void setFile_url(String file_url) {
		this.file_url = file_url;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	
}

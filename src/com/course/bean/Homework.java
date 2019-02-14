package com.course.bean;

public class Homework {
	private int hw_id;
	private int cid;
	private String title;
	private String content;
	private String deadline;
	private String create_time;
	public int getHw_id() {
		return hw_id;
	}
	public void setHw_id(int hw_id) {
		this.hw_id = hw_id;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDeadline() {
		return deadline;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}
	
}

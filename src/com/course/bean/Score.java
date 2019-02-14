package com.course.bean;

public class Score {
	private int score_id;
	private int cid;
	private int sid;
	private int timecard_part;
	private int homework_part;
	private String level;
	public int getScore_id() {
		return score_id;
	}
	public void setScore_id(int score_id) {
		this.score_id = score_id;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public double getTimecard_part() {
		return timecard_part;
	}
	public int getHomework_part() {
		return homework_part;
	}
	public void setHomework_part(int homework_part) {
		this.homework_part = homework_part;
	}
	public void setTimecard_part(int timecard_part) {
		this.timecard_part = timecard_part;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	
	
}

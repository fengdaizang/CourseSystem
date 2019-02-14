package com.course.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.course.bean.Score;
import com.course.utils.DBUtils;

public class ScoreDao {
	private DBUtils dbUtils=new DBUtils();
	
	private Score getBean(ResultSet rs) throws SQLException{
		Score score=new Score();
		
		score.setCid(rs.getInt("cid"));
		score.setHomework_part(rs.getInt("homework_part"));
		score.setLevel(rs.getString("level"));
		score.setScore_id(rs.getInt("score_id"));
		score.setTimecard_part(rs.getInt("timecard_part"));
		score.setSid(rs.getInt("sid"));
		
		return score;
	}
	/**
	 * 得到所有的成绩信息
	 * @param cid
	 * @return
	 */
	public ArrayList<Score> getScoresByCid(int cid){
		ArrayList<Score> scores=new ArrayList<Score>();
		String sql="select * from score where cid="+cid;
		ResultSet rSet=dbUtils.doQuery(sql);
		
		if(rSet!=null){
			try {
				while(rSet.next()){
					scores.add(getBean(rSet));
				}
				rSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return scores;
		
	}
	/**
	 * 添加成绩
	 * @param score
	 */
	public void addScore(Score score) {
		String sql="insert into score(cid,sid,timecard_part,homework_part,level) values("
				+score.getCid()+","+score.getSid()+","
				+score.getTimecard_part()+","
				+score.getHomework_part()+",'"
				+score.getLevel()+"')";
		System.out.println(sql);
		try {
			dbUtils.doUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 得到所有的成绩信息
	 * @param cid
	 * @return
	 */
	public ArrayList<Score> getScoresByCidAndLevel(int cid,String level){
		ArrayList<Score> scores=new ArrayList<Score>();
		String sql="select * from score where cid="+cid+" and level='"+level+"'";
		ResultSet rSet=dbUtils.doQuery(sql);
		
		if(rSet!=null){
			try {
				while(rSet.next()){
					scores.add(getBean(rSet));
				}
				rSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return scores;
		
	}
	/**
	 * 删除老记录
	 * @param cid
	 */
	public void deleteScore(int cid) {
		String sql="delete from into where cid="+cid;
		System.out.println(sql);
		try {
			dbUtils.doUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

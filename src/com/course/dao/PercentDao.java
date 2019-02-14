package com.course.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.course.bean.Percent;
import com.course.utils.DBUtils;

public class PercentDao {
	private DBUtils dbUtils=new DBUtils();
	
	private Percent getBean(ResultSet rs) throws SQLException{
		Percent percent=new Percent();
		
		percent.setCid(rs.getInt("cid"));
		percent.setHomework_part(rs.getInt("homework_part"));
		percent.setPid(rs.getInt("pid"));
		percent.setTimecard_part(rs.getInt("timecard_part"));
		
		return percent;
		
	}
	/**
	 * 通过cid得到百分比信息
	 * @param cid
	 * @return
	 */
	public Percent getPercentByCid(int cid){
		Percent percent=new Percent();
		String sql="select * from percent where cid="+cid;
		ResultSet rSet=dbUtils.doQuery(sql);
		
		if(rSet!=null){
			try {
				while(rSet.next()){
					percent=getBean(rSet);
				}
				rSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return percent;
	}
	/**
	 * 添加或修改成绩百分比
	 * @param percent
	 */
	public void addPercent(Percent percent){
		Percent per=getPercentByCid(percent.getCid());
		String sql="";
		
		if(per.getCid()<=0){
			sql="insert into percent(cid,timecard_part,homework_part) values("
					+percent.getCid()+","+percent.getTimecard_part()+","+percent.getHomework_part()+")";
		}else{
			sql="update percent set timecard_part="+percent.getTimecard_part()
					+",homework_part=+"+percent.getHomework_part()
					+" where cid="+percent.getCid();
		}
		
		try {
			dbUtils.doUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

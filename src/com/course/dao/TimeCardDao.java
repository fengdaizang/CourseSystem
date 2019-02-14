package com.course.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.course.bean.TimeCard;
import com.course.utils.DBUtils;

public class TimeCardDao {
	private DBUtils dbUtils=new DBUtils();
	
	private TimeCard getBean(ResultSet rs) throws SQLException{
		TimeCard timeCard=new TimeCard();
		
		timeCard.setCheckin(rs.getInt("checkin"));
		timeCard.setCheckout(rs.getInt("checkout"));
		timeCard.setCid(rs.getInt("cid"));
		timeCard.setSid(rs.getInt("sid"));
		timeCard.setTc_id(rs.getInt("tc_id"));
		
		return timeCard;
	}
	/**
	 * 通过sid cid 得到点到信息
	 * @param sid
	 * @param cid
	 * @return
	 */
	public TimeCard getTimeCardBySidAndCid(int sid,int cid){
		TimeCard timeCard=new TimeCard();
		String sql="select * from timecard where sid="+sid+" and cid="+cid;
		ResultSet rSet=dbUtils.doQuery(sql);
		
		if(rSet!=null){
			try {
				while(rSet.next()){
					timeCard=getBean(rSet);
				}
				rSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return timeCard;
	}
	
	/**
	 * 点到
	 * @param sid
	 * @param cid
	 * @param checkin
	 * @param checkout
	 */
	public void check(int sid,int cid,int checkin,int checkout){
		
		TimeCard timeCard=getTimeCardBySidAndCid(sid, cid);
		String sql="";
		
		if(timeCard.getCid()<=0){
			sql="insert into timecard(checkin,checkout,cid,sid) values("
					+checkin+","+checkout+","+cid+","+sid+")";
		}else{
			sql="update timecard set checkin=checkin+"+checkin+",checkout=checkout+"+checkout+" where tc_id="+timeCard.getTc_id();
		}
		
		try {
			dbUtils.doUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
}

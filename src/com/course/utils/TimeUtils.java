package com.course.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtils {
	/**
	 * 返回两个时间的天数差
	 * @param createTime
	 * @param nowTime
	 * @return
	 */
	public static int countTime(String createTime,String nowTime){  
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now=new Date();
		Date date=new Date();
		try {
			now = df.parse(createTime);
			date = df.parse(nowTime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		long l=date.getTime()-now.getTime();
		int day=(int) (l/(24*60*60*1000));
		
		return day;
	}
	/**
	 * 得到当前时间
	 * @return
	 */
	public static String getCurrentTime(){
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		
		return sdf.format(date);
	}
	
	
}

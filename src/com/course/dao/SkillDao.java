package com.course.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.course.bean.Skill;
import com.course.utils.DBUtils;

public class SkillDao {
	private DBUtils dbUtils=new DBUtils();
	
	private Skill getBean(ResultSet rs) throws SQLException{
		Skill skill=new Skill();
		
		skill.setCid(rs.getInt("cid"));
		skill.setDegree(rs.getInt("degree"));
		skill.setNum(rs.getInt("num"));
		skill.setSkill_id(rs.getInt("skill_id"));
		skill.setSkill_info(rs.getString("skill_info"));
		skill.setSkill_name(rs.getString("skill_name"));
		
		return skill;
	}
	/**
	 * 通过cid得到技能列表
	 * @param cid
	 * @return
	 */
	public ArrayList<Skill> getSkillsByCid(int cid){
		ArrayList<Skill> skills=new ArrayList<Skill>();
		String sql="select * from skill where cid="+cid;
		ResultSet rSet=dbUtils.doQuery(sql);
		
		if(rSet!=null){
			try {
				while(rSet.next()){
					skills.add(getBean(rSet));
				}
				rSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return skills;
		
	}
	
	/**
	 * 添加技能
	 * @param skill
	 */
	public void addSkill(Skill skill){
		String sql="insert into skill(cid,skill_name,skill_info) values("
				+skill.getCid()+",'"+skill.getSkill_name()+"','"
				+skill.getSkill_info()+"')";
		
		try {
			dbUtils.doUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 删除技能
	 * @param skill_id
	 */
	public void deleteSkill(int skill_id){
		String sql="delete from skill where skill_id="+skill_id;
		
		try {
			dbUtils.doUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 修改技能
	 * @param skill
	 */
	public void editSkill(Skill skill){
		String sql="update skill set skill_name='"+skill.getSkill_name()
				+"',skill_info='"+skill.getSkill_info()
				+"' where skill_id="+skill.getSkill_id();
		try {
			dbUtils.doUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 添加技能熟悉度
	 * @param skill_id
	 * @param degree
	 */
	public void addDegree(int skill_id,int degree){
		String sql="update skill set degree=degree+"+degree
				+",num=num+1 where skill_id="+skill_id;
		try {
			dbUtils.doUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

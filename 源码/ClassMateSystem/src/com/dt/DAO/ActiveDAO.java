package com.dt.DAO;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

import com.dt.bean.*;
import com.dt.jdbcconnect.JDBCConnect;
public class ActiveDAO {
	//对活动信息的数据库操作
	//包括信息的添加，修改，查找
	//插入数据
	public static int insert(ActiveInfo info){
		String sql = "INSERT INTO active_info(active_name, active_id, student_id, active_type, active_descripe, active_context, post_date, Isfinish) VALUES('" + info.getActiveName() + "', active_seq.NEXTVAL, " + info.getStudentID() + ", " + info.getActiveType() + ", '" + info.getActiveDesc() + "', '" + info.getActiveContext() + "', to_char(SYSDATE, 'yyyy/mm/dd'), 0)";
		return JDBCConnect.executerUpdata(sql);
	}
	
	//对活动信息进行更新
	public static int update(int ActiveID, float ActiveCost){
		String sql = "update active_info set active_cost = " + ActiveCost + ", isfinish = 1 where active_id = " + ActiveID;
		return JDBCConnect.executerUpdata(sql);
	}
	
	//从数据库中获取所有的数据
	public static List<ActiveInfo> getAllActiveInfo(){
		String sql = "select * from active_info";
		return getActiveInfo(sql);
	}
	
	//根据活动的isFinish来获取数据库中的数据
	public static List<ActiveInfo> getActiveInfoBaseIsFinish(int isFinish){
		String sql = "select * from active_info where isfinish = " + isFinish;
		return getActiveInfo(sql);
	}
	
	//根据活动的desc来获取数据库中的信息
	public static List<ActiveInfo> getActiveInfoBaseDesc(String desc){
		String sql = "select * from active_info where active_descripe like '" + desc + "'";
		return getActiveInfo(sql);
	}
	
	//根据活动的desc和isFinish来过去数据库中的数据
	public static List<ActiveInfo> getActiveInfoBaseDescAndIsFinish(String desc, int isFinish){
		String sql = "select * from active_info where active_descripe = '" + desc + "' and isfinish = " + isFinish; 
		return getActiveInfo(sql);
	}
	
	//根据活动的ID号来获取信息
	public static ActiveInfo getActiveInfoBaseActiveID(int ActiveID){
		String sql = "select * from active_info where active_id = " + ActiveID;
		return getActiveInfo(sql).get(0);
	}
	
	private static List<ActiveInfo> getActiveInfo(String sql){
		List<ActiveInfo> infoList = new ArrayList<ActiveInfo>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet set = null;
		try{
			conn = JDBCConnect.getConnection();
			stmt = conn.createStatement();
			set = stmt.executeQuery(sql);
			while(set.next()){
				ActiveInfo info =new ActiveInfo();
				//在这里获取的信息展示在网页上是，只有关于信息的标题，发布人，发布时间，是否结束，操作
				info.setActiveID(set.getInt("active_id"));
				info.setActiveName(set.getString("active_name"));
				info.setStudentName(StudentDAO.queryStudentName(set.getInt("student_id")));
				info.setActiveContext(set.getString("active_context"));
				info.setPost_date(set.getString("post_date"));
				info.setIsFinish(set.getInt("isfinish"));
				info.setActiveType(set.getInt("active_type"));
				info.setActiveDesc(set.getString("active_descripe"));
				infoList.add(info);
			}
		}catch(SQLException e){
			System.err.println("数据库链接有问题");
			e.printStackTrace();
		}
		return infoList;
	}
}

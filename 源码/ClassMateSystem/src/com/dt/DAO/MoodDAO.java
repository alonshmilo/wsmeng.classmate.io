package com.dt.DAO;

import java.sql.*;
import java.util.*;

import com.dt.bean.*;
import com.dt.jdbcconnect.JDBCConnect;

public class MoodDAO {
	
	public static int insert(MoodInfo info){
		String sql = "insert into mood_info values(mood_seq.nextval, '" + info.getMoodContext() + "', " + info.getStudentID() + ", to_char(sysdate, 'yy/mm/dd/hh'), '" + info.getStudentName() + "')";
		return JDBCConnect.executerUpdata(sql);
	}
	
	public static int delete(int StudentID){
		String sql = "delete from mood_info where student_id = " + StudentID;
		return JDBCConnect.executerUpdata(sql);
	}
	
	public static List<MoodInfo> getAllMoodInfo(){
		List<MoodInfo> infoList = new ArrayList<MoodInfo>();
		String sql = "select * from mood_info order by mood_id desc";
		Connection conn = null;
		Statement stmt = null;
		ResultSet set = null;
		try{
			conn = JDBCConnect.getConnection();
			stmt = conn.createStatement();
			set = stmt.executeQuery(sql);
			while(set.next()){
				MoodInfo info = new MoodInfo();
				info.setMoodID(set.getInt("mood_id"));
				info.setMoodContext(set.getString("mood_context"));
				info.setPostDate(set.getString("post_date"));
				info.setStudentID(set.getInt("student_id"));
				info.setStudentName(set.getString("student_name"));
				infoList.add(info);
			}
		}catch(SQLException e){
			System.err.println("数据库连接有问题");
			e.printStackTrace();
		}
		return infoList;
	}
}

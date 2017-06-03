package com.dt.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

import com.dt.bean.*;
import com.dt.jdbcconnect.JDBCConnect;

public class WordsDAO {
	public static int insert(WordsInfo info){
		String sql = "insert into words_info values(words_seq.NEXTVAL, '" + info.getWordsContext() + "', " + info.getGuestID() + ", " + info.getParentID() + ", " + info.getHostID() + ", to_char(SYSDATE, 'yy/mm/dd/hh'), '" + info.getStudentName() + "')";
		return JDBCConnect.executerUpdata(sql);
	}
	
	public static int delete(int StudentID){
		String sql = "delete from words_info where guest_id = " + StudentID;
		return JDBCConnect.executerUpdata(sql);
	}
	
	public static List<WordsInfo> getAllWordsInfoBaseHostID(int HostID){
		String sql = "select * from words_info where host_id = " + HostID + " order by words_id desc";
		return getAllWordsInfo(sql);
	}
	
	private static List<WordsInfo> getAllWordsInfo(String sql){
		List<WordsInfo> infoList = new ArrayList<WordsInfo>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet set = null;
		try{
			conn = JDBCConnect.getConnection();
			stmt = conn.createStatement();
			set = stmt.executeQuery(sql);
			while(set.next()){
				WordsInfo info = new WordsInfo();
				info.setGuestID(set.getInt("guest_id"));
				info.setHostID(set.getInt("host_id"));
				info.setParentID(set.getInt("parent_id"));
				info.setWordsContext(set.getString("words_context"));
				info.setWordsID(set.getInt("words_id"));
				info.setStudentName(set.getString("student_name"));
				info.setPostDate(set.getString("post_date"));
				infoList.add(info);
			}
		}catch(SQLException e){
			System.err.println("数据库连接有问题");
			e.printStackTrace();
		}
		return infoList;
	}
}

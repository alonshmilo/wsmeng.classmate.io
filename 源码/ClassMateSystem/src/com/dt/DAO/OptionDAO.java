package com.dt.DAO;
import com.dt.bean.*;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import java.sql.*;

import com.dt.jdbcconnect.JDBCConnect;
public class OptionDAO {
	public static int insert(OptionInfo info){
		String sql = "insert into options values(option_seq.nextval, " + info.getQuestionID() + ", '" + info.getOptionContent() + "')";
		return JDBCConnect.executerUpdata(sql);
	}
	
	public static int delete(int questionID){
		String sql = "delete from options where question_id = " + questionID;
		return JDBCConnect.executerUpdata(sql);
	}
	
	public static List<OptionInfo> findAll(int questionID){
		String sql = "select * from options where question_id = " + questionID;
		List<OptionInfo> infos = new ArrayList<OptionInfo>();
		Connection conn = null;;
		Statement stmt = null;
		ResultSet set = null;
		try {
			conn = JDBCConnect.getConnection();
			stmt = conn.createStatement();
			set = stmt.executeQuery(sql);
			while(set.next()){
				OptionInfo info = new OptionInfo();
				info.setOptionsID(set.getInt("select_id"));
				info.setOptionContent(set.getString("select_content"));
				infos.add(info);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return infos;
	}
	
}

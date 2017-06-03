package com.dt.DAO;

import com.dt.bean.QuestionInfo;
import com.dt.jdbcconnect.JDBCConnect;

import java.util.*;
import java.sql.*;

import oracle.jdbc.OracleTypes;

public class QuestionDAO {
	public static int insert(QuestionInfo info){
		String sql = "call insertQuestion(?, ?, ?, ?)";
		Connection conn = null;
		CallableStatement cs = null;
		int result = 0;
		try {
			conn = JDBCConnect.getConnection();
			cs = conn.prepareCall(sql);
			cs.setString(1, info.getQuestionName());
			cs.setInt(2, info.getReportID());
			cs.setInt(3, info.getTypeID());
			cs.registerOutParameter(4, OracleTypes.INTEGER);
			cs.execute();
			result = cs.getInt(4);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static int delete(int questionID){
		String sql = "delete from question where question_id = " + questionID;
		return JDBCConnect.executerUpdata(sql);
	}
	
	public static List<QuestionInfo> findByTypeIDAndReportID(int ReportID, int TypeID){
		String sql = "select question_name, question_id from question where report_id = " + ReportID + " and type_id = " + TypeID;
		return findAll(sql);
	}
	
	private static List<QuestionInfo> findAll(String sql){
		List<QuestionInfo> infos = new ArrayList<QuestionInfo>();
		Connection conn = null;
		Statement st = null;
		ResultSet set = null;
		try {
			conn = JDBCConnect.getConnection();
			st = conn.createStatement();
			set = st.executeQuery(sql);
			while(set.next()){
				QuestionInfo info = new QuestionInfo();
				info.setQuestionName(set.getString("question_name"));
				info.setQuestionID(set.getInt("question_id"));
				infos.add(info);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				conn.close();
				st.close();
				set.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return infos;
	}
	
	public static void main(String[] args){
		
	}
	
}

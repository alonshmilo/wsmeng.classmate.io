package com.dt.DAO;

import java.util.*;
import java.sql.*;

import oracle.jdbc.internal.OracleTypes;

import com.dt.bean.QuestionReportInfo;
import com.dt.jdbcconnect.JDBCConnect;

public class QuestionReportDAO {
	public static int insert(QuestionReportInfo report){
		String sql = "call insert_and_return(?, ?, ?, ?, ?, ?)";
		Connection conn = null;
		CallableStatement cs = null;
		int result = 0;
		try {
			conn = JDBCConnect.getConnection();
			cs = conn.prepareCall(sql);
			cs.setString(1, report.getReportTitle());
			cs.setString(2, report.getStudentName());
			cs.setInt(3, report.getStudentID());
			cs.setString(4, report.getPostDate());
			cs.setString(5, report.getEndDate());
			cs.registerOutParameter(6, OracleTypes.INTEGER);
			cs.execute();
			result = cs.getInt(6);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static List<QuestionReportInfo> findAll(){
		String sql = "select * from questionreport";
		List<QuestionReportInfo> infos = new ArrayList<QuestionReportInfo>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet set = null;
		try {
			conn = JDBCConnect.getConnection();
			stmt = conn.createStatement();
			set = stmt.executeQuery(sql);
			while(set.next()){
				QuestionReportInfo info = new QuestionReportInfo();
				info.setReportID(set.getInt("report_id"));
				info.setReportTitle(set.getString("report_title"));
				info.setStudentID(set.getInt("student_id"));
				info.setStudentName(set.getString("student_name"));
				info.setPostDate(set.getString("post_date"));
				info.setEndDate(set.getString("end_date"));
				infos.add(info);
			}
		} catch (SQLException e) {
			System.out.println("请检数据库是否打开，或检查数据库语句");
			e.printStackTrace();
		}finally{
			try {
				conn.close();
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return infos;
	}
	
	public static void main(String[] args){
		QuestionReportInfo report = new QuestionReportInfo();
		report.setStudentName("于涛");
		report.setReportTitle("关于大学生的毕业问题");
		report.setStudentID(2024);
		report.setPostDate("2017/5/29");
		report.setEndDate("2017/6/29");
		System.out.println(insert(report));
	}
}

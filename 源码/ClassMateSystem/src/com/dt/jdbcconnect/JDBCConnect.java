package com.dt.jdbcconnect;
import java.sql.*;
public final class JDBCConnect {
	private static String db_driver = "oracle.jdbc.driver.OracleDriver";
	private static String db_url = "jdbc:oracle:thin:@localhost:1521:";
	public static Connection getConnection() throws SQLException{
		return getConnection("orcl", "hr", "weishimeng111000");
	}
	public static Connection getConnection(String db_name, String db_user, String db_password) throws SQLException{
		try {
			Class.forName(db_driver);
		} catch (ClassNotFoundException e) {
			System.err.println("jdbc类加载器没有找到，请确定类加载器的位置");
			e.printStackTrace();
		}
		return DriverManager.getConnection(db_url + db_name, db_user, db_password);
	}
	public static int executerUpdata(String sql){
		Connection conn = null;
		Statement stmt = null;
		int count = -1;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			count = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			System.err.println("数据库没有正确打开，请稍后再试");
			e.printStackTrace();
		}finally{
			try {
				if(conn != null){
					conn.close();
				}
				if(stmt != null){
					stmt.close();
				}
			} catch (SQLException e) {
				System.err.println("没有正确关闭Connection, Statement");
				e.printStackTrace();
			}
		}
		return count;
	}
}

package com.dt.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import com.dt.bean.*;
import com.dt.jdbcconnect.JDBCConnect;

public class StudentDAO {
	//对学生表信息的处理，增删改查
	//增加学生信息
	public static int insert(StudentInfo studentInfo, AdressInfo adressInfo){
		//在插入学生之前的准备,获得地址的ID（无论改地址是否存在，在执行该语句之后都会返回一个地址）
		String password = "123456789";
		if(studentInfo.getPassword() != null){
			password = studentInfo.getPassword();
		}
		int address_ID = AdressDAO.getAdressID(adressInfo);
		String sql = "insert into student_info values(student_seq.nextval, '" + studentInfo.getStudent_name() + "', '" + studentInfo.getStudent_phone() + "', '" + studentInfo.getStudent_email() + "', " + address_ID + ", '" + password + "', 0)";
		return JDBCConnect.executerUpdata(sql);
	}
	
	//根据学生的ID来删除学生的信息
	public static int delete(int Student_ID){
		String sql = "delete from student_info where student_id = " + Student_ID;
		MoodDAO.delete(Student_ID);
		WordsDAO.delete(Student_ID);
		ImageDAO.delete(Student_ID);
		return JDBCConnect.executerUpdata(sql);
	}
	
	//修改学生的信息
	public static int change(StudentInfo studentInfo){
		String sql = "update student_info set student_password = '" + studentInfo.getPassword() + "', student_email = '" + studentInfo.getStudent_email() + "',student_phone = '" + studentInfo.getStudent_phone() + "' where student_id = " + studentInfo.getStudent_id();
		return JDBCConnect.executerUpdata(sql);
	}
	
	//根据学生的ID获取单个学生的信息
	public static StudentInfo queryStudentInfo(int student_ID){
		StudentInfo info = new StudentInfo();
		String sql = "select student_email, student_name, student_phone, adress_id, student_grade from student_info where student_id = " + student_ID;
		Connection conn = null;
		Statement stmt = null;
		ResultSet set = null;
		try{
			conn = JDBCConnect.getConnection();
			stmt = conn.createStatement();
			set = stmt.executeQuery(sql);
			while(set.next()){
				info.setStudent_email(set.getString("student_email"));
				info.setStudent_name(set.getString("student_name"));
				info.setStudent_phone(set.getString("student_phone"));
				info.setAddress_id(set.getInt("adress_id"));
				info.setStudent_grade(set.getInt("student_grade"));
			}
		}catch(SQLException e){
			System.err.println("数据库连接有问题");
			e.printStackTrace();
		}
		return info;
	}
	
	//要获取所有学生的ID， 姓名，EMAIL， PHONE， GRADE, Adress_ID
	public static List<Map<StudentInfo, AdressInfo>> getAllStudentInfo(){
		List<Map<StudentInfo, AdressInfo>> infoList = new ArrayList<Map<StudentInfo, AdressInfo>>();
		String sql = "select student_id, student_name, student_email, student_phone, student_grade, adress_id from student_info";
		Connection conn = null;
		Statement stmt = null;
		ResultSet set = null;
		try{
			conn = JDBCConnect.getConnection();
			stmt = conn.createStatement();
			set = stmt.executeQuery(sql);
			while(set.next()){
				Map<StudentInfo, AdressInfo> var = new HashMap<StudentInfo, AdressInfo>();
				StudentInfo studentInfo = new StudentInfo();
				AdressInfo adressInfo = new AdressInfo();
				studentInfo.setStudent_id(set.getInt("student_id"));
				studentInfo.setStudent_name(set.getString("student_name"));
				studentInfo.setStudent_email(set.getString("student_email"));
				studentInfo.setStudent_grade(set.getInt("student_grade"));
				studentInfo.setStudent_phone(set.getString("student_phone"));
				adressInfo = AdressDAO.getAdressInfo(set.getInt("adress_id"));
				var.put(studentInfo, adressInfo);
				infoList.add(var);
			}
		}catch(SQLException e){
			System.err.println("数据库连接有问题");
			e.printStackTrace();
		}
		return infoList;
	}
	
	public static StudentLoginInfo queryPassword(String student_email){
		String sql = "select student_password, student_name, student_grade, student_id from student_info where student_email = '" + student_email + "'";
		Connection conn = null;
		Statement stmt = null;
		ResultSet set = null;
		StudentLoginInfo info = new StudentLoginInfo();
		try{
			conn = JDBCConnect.getConnection();
			stmt = conn.createStatement();
			set = stmt.executeQuery(sql);
			while(set.next()){
				info.setStudent_password(set.getString("student_password"));
				info.setStudent_grade(set.getInt("student_grade"));
				info.setStudent_ID(set.getInt("student_id"));
				info.setStudent_name(set.getString("student_name"));
			}
		}catch(SQLException e){
			System.err.println("数据库链接有问题");
			e.printStackTrace();
		}
		return info;
	}
	
	public static String queryStudentName(int StudentID){
		String sql = "select student_name from student_info where student_id = " + StudentID;
		Connection conn = null;
		Statement stmt = null;
		ResultSet set = null;
		String studentName = null;
		try{
			conn = JDBCConnect.getConnection();
			stmt = conn.createStatement();
			set = stmt.executeQuery(sql);
			while(set.next()){
				studentName = set.getString("student_name");
			}
		}catch(SQLException e){
			System.err.println("数据库链接有问题");
			e.printStackTrace();
		}
		return studentName;
	}
	
	//通过用户的ID来查询该用户的等级普通用户还是管理员
	public static int queryGrade(int Student_ID){
		String sql = "select student_grade from student_info where student_id = " + Student_ID;
		Connection conn = null;
		Statement stmt = null;
		ResultSet set = null;
		//默认为普通用户
		int grade = 0;
		try{
			conn = JDBCConnect.getConnection();
			stmt = conn.createStatement();
			set = stmt.executeQuery(sql);
			while(set.next()){
				grade = set.getInt("student_grade");
			}
		}catch(SQLException e){
			System.err.println("数据库打开有问题");
			e.printStackTrace();
		}
		return grade;
	}
	
	public static int queryStudentIDBaseStudentEmail(String StudentEmail){
		String sql = "select student_id from student_info where student_email = '" + StudentEmail + "'";
		Connection conn = null;
		Statement stmt = null;
		ResultSet set = null;
		int StudentID = 0;
		try{
			conn = JDBCConnect.getConnection();
			stmt = conn.createStatement();
			set = stmt.executeQuery(sql);
			while(set.next()){
				StudentID = set.getInt("student_id");
			}
		}catch(SQLException e){
			System.err.println("数据库打开有问题");
			e.printStackTrace();
		}
		return StudentID;
	}

	public static List<StudentInfo> getStudentInfo(){
		List<StudentInfo> infoList = new ArrayList<StudentInfo>();
		String sql = "select student_email, student_name from student_info";
		Connection conn = null;
		Statement stmt = null;
		ResultSet set = null;
		try{
			conn = JDBCConnect.getConnection();
			stmt = conn.createStatement();
			set = stmt.executeQuery(sql);
			while(set.next()){
				StudentInfo studentInfo = new StudentInfo();
				studentInfo.setStudent_email(set.getString("student_email"));
				studentInfo.setStudent_name(set.getString("student_name"));
				infoList.add(studentInfo);
			}
		}catch(SQLException e){
			System.err.println("数据库连接有问题");
			e.printStackTrace();
		}
		return infoList;
	}
	
}

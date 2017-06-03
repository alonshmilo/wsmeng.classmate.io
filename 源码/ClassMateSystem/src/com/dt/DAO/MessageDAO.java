package com.dt.DAO;
import java.util.*;
import java.sql.*;
import com.dt.bean.*;
import com.dt.jdbcconnect.JDBCConnect;
public final class MessageDAO {
	//对信息的处理方式，增删查
	//新增信息到数据库中,使用该函数时，在页面中必须出现学生的ID
	public static int insert(MessageInfo info){
		String sql = "insert into message_info values(message_seq.nextval, '" + info.getMessage_title() + "', '" + info.getMessage_Context() + "', " + info.getStudent_ID() + ", '" +info.getMessage_Type() + "', to_char(SYSDATE, 'yyyy/mm/dd'))";
		return JDBCConnect.executerUpdata(sql);
	}
	
	//根据信息的ID对信息进行修改
	public static int update(int MessageID, String Message_Context){
		String sql = "update message_info set message_context = '" + Message_Context + "' where message_id = " + MessageID;
		return JDBCConnect.executerUpdata(sql);
	}
	
	public static int delete(int MessageID){
		String sql = "delete from message_info where message_id = " + MessageID;
		return JDBCConnect.executerUpdata(sql);
	}
	
	//获取数据库中的所有信息，不根据任何进行分类
	public static List<MessageInfo> getAllMessageInfo(){
		String sql = "select * from Message_Info";
		return getAllMessageBaseSQL(sql);
	}
	
	//按照不同的信息类型分类来获取信息
	public static List<MessageInfo> getMessageBaseType(String MessageType){
		String sql = "select * from Message_Info where message_type = '" + MessageType + "'";
		return getAllMessageBaseSQL(sql);
	}
	
	//根据信息的Title来进行模糊查询
	public static List<MessageInfo> getMessageBaseTitle(String MessageTitle){
		String sql = "select * from message_info where message_title like '%" + MessageTitle + "%'";
		return getAllMessageBaseSQL(sql);
	}
	
	//根据信息分类和Title来获取数据库中的信息
	public static List<MessageInfo> getMessageBaseTitleAndType(String MessageType, String MessageTitle){
		String sql = "select * from message_info where message_title like '%" + MessageTitle + "%' and message_type = '" + MessageType + "'";
		return getAllMessageBaseSQL(sql);
	}
	
	//根据信息的ID来获取信息
	public static MessageInfo getMessageBaseMessageID(int MessageID){
		String sql = "select * from message_info where message_id = " + MessageID;
		return getAllMessageBaseSQL(sql).get(0);
	}
	private static List<MessageInfo> getAllMessageBaseSQL(String sql){
		List<MessageInfo> infoList = new ArrayList<MessageInfo>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet set = null;
		try{
			conn = JDBCConnect.getConnection();
			stmt = conn.createStatement();
			set = stmt.executeQuery(sql);
			while(set.next()){
				MessageInfo messageInfo =new MessageInfo();
				String studentName = null;
				messageInfo.setMessage_ID(set.getInt("message_id"));
				messageInfo.setMessage_title(set.getString("message_title"));
				messageInfo.setMessage_Context(set.getString("message_context"));
				messageInfo.setStudent_ID(set.getInt("student_id"));
				studentName = StudentDAO.queryStudentName(set.getInt("student_id"));
				messageInfo.setStudent_Name(studentName);
				messageInfo.setMessage_Type(set.getString("message_type"));
				messageInfo.setPostDate(set.getString("post_date"));
				infoList.add(messageInfo);
			}
		}catch(SQLException e){
			System.err.println("数据库链接有问题");
			e.printStackTrace();
		}
		return infoList;
	}
}

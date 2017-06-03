package com.dt.DAO;

import java.sql.*;
import java.io.*;

import com.dt.bean.ImageInfo;
import com.dt.jdbcconnect.JDBCConnect;

public class ImageDAO {
	
	public static int delete(int StudentID){
		String sql = "delete from image_info where student_id = " + StudentID;
		return JDBCConnect.executerUpdata(sql);
	}

	//项数据库中插入图片
	public static boolean insert(ImageInfo info) throws Exception{
		String sql = "insert into image_info values(image_seq.nextval, ?, " + info.getStudentID() + ", '" + info.getStudentName() + "')";
		Connection conn = JDBCConnect.getConnection();
		PreparedStatement pst = conn.prepareStatement(sql);
		InputStream is = new FileInputStream(info.getImagePath());
		pst.setBinaryStream(1, is, is.available());
		boolean isSuccess = pst.execute();
		return isSuccess;
	}
	
	public static ImageInfo download(int StudentID) throws Exception{
		String sql = "select * from image_info where student_id = " + StudentID;
		Connection conn = JDBCConnect.getConnection();
		Statement st = conn.createStatement();
		ResultSet set = st.executeQuery(sql);
		ImageInfo info = new ImageInfo();
		while(set.next()){
			info.setImageID(set.getInt("image_id"));
			info.setImageContext(set.getBlob("image_context"));
			info.setStudentID(StudentID);
			info.setStudentName(set.getString("student_name"));
		}
		return info;
	}
	
	
}

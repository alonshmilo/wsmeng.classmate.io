package com.dt.DAO;

import com.dt.bean.AdressInfo;
import com.dt.jdbcconnect.JDBCConnect;

import java.sql.*;
public class AdressDAO {
	//对地址的增查
	//地址不具有删除功能，因为地址的主键在studentinfo表中有可能被多次引用
	//基于上述理由，同样该类也不具有修改地址的能力
	//增加一条地址，在原地址栏中没有找到
	public static int insert(AdressInfo info){
		String sql = "insert into adress_info values(address_seq.nextval, '" + info.getAdress_City() + "', '" + info.getAdress_Down() + "', '" + info.getAdress_Number() + "')";
		return JDBCConnect.executerUpdata(sql);
	}
	
	//根据地址的信息获得改地址的ID号，在对学生进行操作的时候，学生表里只有地址的ID，
	//所以，希望在将学生的信息展示在网页中是，以详细地址的方式展示出来
	public static AdressInfo getAdressInfo(int Adress_ID){
		String sql = "select adress_city, adress_down, adress_number from adress_info where adress_id = " + Adress_ID;
		Connection conn = null;
		Statement stmt = null;
		ResultSet set = null;
		AdressInfo info = new AdressInfo();
		try {
			conn = JDBCConnect.getConnection();
			stmt = conn.createStatement();
			set = stmt.executeQuery(sql);
			while(set.next()){
				info.setAdress_City(set.getString("adress_city"));
				info.setAdress_Down(set.getString("adress_down"));
				info.setAdress_Number(set.getString("adress_number"));
			}
		} catch (SQLException e) {
			System.err.println("数据库打开有问题，请稍后重试");
			e.printStackTrace();
		}
		return info;
	}
	
	//同样在有信息的学生进行注册是，有可能或产生新的地址，所以在这里我们要更据详细的地址信息
	//来获得改地址的ID，如果 该地址没有查到ID号，那么就尅确定改地址不存在，此时就需要进行
	//地址的插入
	public static int getAdressID(AdressInfo info){
		String sql = "select adress_id from adress_info where adress_city = '" + info.getAdress_City() + "' and adress_down = '" + info.getAdress_Down() + "' and adress_number = '" + info.getAdress_Number() + "'";
		Connection conn = null;
		Statement stmt = null;
		ResultSet set = null;
		//如果返回的是-1则表示没有在表中找到改地址，所以要重新生成一个地址
		int adress_id = -1;
		try{
			conn = JDBCConnect.getConnection();
			stmt = conn.createStatement();
			set = stmt.executeQuery(sql);
			while(set.next()){
				adress_id = set.getInt("adress_id");
			}
		}catch(SQLException e){
			System.err.println("数据库链接有问题，确定数据库监听器是否打开");
			e.printStackTrace();
		}
		if(adress_id != -1){
			return adress_id;
		}else{
			//在地址表中没有该地址，所以选择插入该地址
			 insert(info);
			 return getCurrentAdressID();
		}
	}
	//当执行完插入语句之后，立即获得当前地址的ID
	private static int getCurrentAdressID(){
		String sql = "select max(adress_id) max from adress_info";
		Connection conn = null;
		Statement stmt = null;
		ResultSet set = null;
		int adress_id = -1;
		try{
			conn = JDBCConnect.getConnection();
			stmt = conn.createStatement();
			set = stmt.executeQuery(sql);
			while(set.next()){
				adress_id = set.getInt("max");
			}
		}catch(SQLException e){
			System.err.println("数据库链接有问题");
			e.printStackTrace();
		}
		return adress_id;
	}
}

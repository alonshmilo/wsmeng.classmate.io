package com.dt.bean;

public class MessageInfo {
	private int Message_ID;
	private String Message_title;
	private String Message_Context;
	private int Student_ID;
	private String Message_Type;
	private String PostDate;
	public String getMessage_Type() {
		return Message_Type;
	}
	public void setMessage_Type(String message_Type) {
		Message_Type = message_Type;
	}
	public String getPostDate() {
		return PostDate;
	}
	public void setPostDate(String postDate) {
		PostDate = postDate;
	}
	//发布人
	private String Student_Name;
	public String getStudent_Name() {
		return Student_Name;
	}
	public void setStudent_Name(String student_Name) {
		Student_Name = student_Name;
	}
	public MessageInfo(){
		
	}
	public int getMessage_ID() {
		return Message_ID;
	}
	public void setMessage_ID(int message_ID) {
		Message_ID = message_ID;
	}
	public String getMessage_title() {
		return Message_title;
	}
	public void setMessage_title(String message_title) {
		Message_title = message_title;
	}
	public String getMessage_Context() {
		return Message_Context;
	}
	public void setMessage_Context(String message_Context) {
		Message_Context = message_Context;
	}
	public int getStudent_ID() {
		return Student_ID;
	}
	public void setStudent_ID(int student_ID) {
		Student_ID = student_ID;
	}
}

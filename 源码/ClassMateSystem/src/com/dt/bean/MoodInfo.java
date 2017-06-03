package com.dt.bean;

public class MoodInfo {
	private int MoodID;
	private String MoodContext;
	private int StudentID;
	private String PostDate;
	private String StudentName;
	public int getMoodID() {
		return MoodID;
	}
	public void setMoodID(int moodID) {
		MoodID = moodID;
	}
	public String getMoodContext() {
		return MoodContext;
	}
	public void setMoodContext(String moodContext) {
		MoodContext = moodContext;
	}
	public int getStudentID() {
		return StudentID;
	}
	public void setStudentID(int studentID) {
		StudentID = studentID;
	}
	public String getPostDate() {
		return PostDate;
	}
	public void setPostDate(String postDate) {
		PostDate = postDate;
	}
	public String getStudentName() {
		return StudentName;
	}
	public void setStudentName(String studentName) {
		StudentName = studentName;
	}
}

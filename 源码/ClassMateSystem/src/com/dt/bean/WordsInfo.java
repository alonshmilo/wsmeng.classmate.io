package com.dt.bean;

public class WordsInfo {
	private int WordsID;
	private int GuestID;
	private int HostID;
	private int ParentID;
	private String WordsContext;
	private String StudentName;
	private String PostDate;
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
	public int getWordsID() {
		return WordsID;
	}
	public void setWordsID(int wordsID) {
		WordsID = wordsID;
	}
	public int getGuestID() {
		return GuestID;
	}
	public void setGuestID(int guestID) {
		GuestID = guestID;
	}
	public int getHostID() {
		return HostID;
	}
	public void setHostID(int hostID) {
		HostID = hostID;
	}
	public int getParentID() {
		return ParentID;
	}
	public void setParentID(int parentID) {
		ParentID = parentID;
	}
	public String getWordsContext() {
		return WordsContext;
	}
	public void setWordsContext(String wordsContext) {
		WordsContext = wordsContext;
	}
}

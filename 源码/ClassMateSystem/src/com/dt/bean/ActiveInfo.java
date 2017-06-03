package com.dt.bean;

public final class ActiveInfo {
	private String ActiveName;
	private int ActiveID;
	private int StudentID;
	private float ActiveCost;
	private int ActiveType;
	private String ActiveDesc;
	private String ActiveContext;
	private String StudentName;
	private int isFinish;
	private String post_date;
	public String getPost_date() {
		return post_date;
	}
	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}
	public int getIsFinish() {
		return isFinish;
	}
	public void setIsFinish(int isFinish) {
		this.isFinish = isFinish;
	}
	public String getStudentName() {
		return StudentName;
	}
	public void setStudentName(String studentName) {
		StudentName = studentName;
	}
	public String getActiveName() {
		return ActiveName;
	}
	public void setActiveName(String activeName) {
		ActiveName = activeName;
	}
	public int getActiveID() {
		return ActiveID;
	}
	public void setActiveID(int activeID) {
		ActiveID = activeID;
	}
	public int getStudentID() {
		return StudentID;
	}
	public void setStudentID(int studentID) {
		StudentID = studentID;
	}
	public float getActiveCost() {
		return ActiveCost;
	}
	public void setActiveCost(float activeCost) {
		ActiveCost = activeCost;
	}
	public int getActiveType() {
		return ActiveType;
	}
	public void setActiveType(int activeType) {
		ActiveType = activeType;
	}
	public String getActiveDesc() {
		return ActiveDesc;
	}
	public void setActiveDesc(String activeDesc) {
		ActiveDesc = activeDesc;
	}
	public String getActiveContext() {
		return ActiveContext;
	}
	public void setActiveContext(String activeContext) {
		ActiveContext = activeContext;
	}
	
}
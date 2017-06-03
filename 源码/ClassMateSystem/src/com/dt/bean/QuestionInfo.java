package com.dt.bean;

public class QuestionInfo {
	private int QuestionID;
	private String QuestionName;
	private int MustAnswer;
	private int TypeID;
	private int ReportID;
	public int getQuestionID() {
		return QuestionID;
	}
	public int getReportID() {
		return ReportID;
	}
	public void setReportID(int reportID) {
		ReportID = reportID;
	}
	public void setQuestionID(int questionID) {
		QuestionID = questionID;
	}
	public String getQuestionName() {
		return QuestionName;
	}
	public void setQuestionName(String questionName) {
		QuestionName = questionName;
	}
	public int getMustAnswer() {
		return MustAnswer;
	}
	public void setMustAnswer(int mustAnswer) {
		MustAnswer = mustAnswer;
	}
	public int getTypeID() {
		return TypeID;
	}
	public void setTypeID(int typeID) {
		TypeID = typeID;
	}
}

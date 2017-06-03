package com.dt.bean;

public class OptionInfo {
	private int optionsID;
	private int questionID;
	private String optionContent;
	public int getOptionsID() {
		return optionsID;
	}
	public void setOptionsID(int optionsID) {
		this.optionsID = optionsID;
	}
	public int getQuestionID() {
		return questionID;
	}
	public void setQuestionID(int questionID) {
		this.questionID = questionID;
	}
	public String getOptionContent() {
		return optionContent;
	}
	public void setOptionContent(String optionContent) {
		this.optionContent = optionContent;
	}
	public String toString(){
		return "题目号：" + questionID + ", 选项内容： " + optionContent; 
	}
}

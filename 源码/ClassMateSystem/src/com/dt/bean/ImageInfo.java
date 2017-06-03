package com.dt.bean;
import java.sql.*;

public class ImageInfo {

	private int ImageID;
	private Blob ImageContext;
	private int StudentID;
	private String StudentName;
	private String imagePath;
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public int getImageID() {
		return ImageID;
	}
	public void setImageID(int imageID) {
		ImageID = imageID;
	}
	public Blob getImageContext() {
		return ImageContext;
	}
	public void setImageContext(Blob imageContext) {
		ImageContext = imageContext;
	}
	public int getStudentID() {
		return StudentID;
	}
	public void setStudentID(int studentID) {
		StudentID = studentID;
	}
	public String getStudentName() {
		return StudentName;
	}
	public void setStudentName(String studentName) {
		StudentName = studentName;
	}
}

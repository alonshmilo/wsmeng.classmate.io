package com.dt.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dt.bean.*;
import com.dt.DAO.*;

public class PostWordsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public PostWordsServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	private String StudentEmail = null;
	private int GuestID;
	private int HostID;
	private String WordsContext = null;
	private String StudentName = null;
	private WordsInfo info = null;
	
	private void getValue(HttpServletRequest request){
		info = new WordsInfo();
		StudentEmail = request.getParameter("STUDENT_EMAIL");
		GuestID = Integer.valueOf(request.getParameter("GUEST_ID"));
		WordsContext = request.getParameter("WORDS_CONTEXT");
		StudentName = request.getParameter("STUDENT_NAME");
		getHostID();
		info.setGuestID(GuestID);
		info.setHostID(HostID);
		info.setStudentName(StudentName);
		info.setWordsContext(WordsContext);
	}
	
	private void getHostID(){
		HostID = StudentDAO.queryStudentIDBaseStudentEmail(StudentEmail);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		getValue(request);
		int count = 0;
		count = WordsDAO.insert(info);
		if(count == 1){
			request.setAttribute("success", "发表成功");
			request.getRequestDispatcher("guestbook.jsp").forward(request, response);
		}else{
			request.setAttribute("failure", "发表失败");
			request.getRequestDispatcher("guestbook.jsp").forward(request, response);
		}
	}

}

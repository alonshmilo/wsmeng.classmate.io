package com.dt.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dt.bean.*;
import com.dt.DAO.*;

/**
 * Servlet implementation class PostMoodServlet
 */
public class PostMoodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostMoodServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	private int StudentID;
	private String StudentName = null;
	private String MoodContext = null;
	private MoodInfo info = null;
	private void getValue(HttpServletRequest request){
		info = new MoodInfo();
		StudentID = Integer.valueOf(request.getParameter("STUDENT_ID"));
		StudentName = request.getParameter("STUDENT_NAME");
		MoodContext = request.getParameter("MOOD_CONTEXT");
		info.setStudentID(StudentID);
		info.setStudentName(StudentName);
		info.setMoodContext(MoodContext);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		getValue(request);
		int count = 0;
		count = MoodDAO.insert(info);
		if(count == 1){
			request.setAttribute("success", "发表成功");
			request.getRequestDispatcher("mainpage.jsp").forward(request, response);
		}else{
			request.setAttribute("failure", "发表失败");
			request.getRequestDispatcher("mainpage.jsp").forward(request, response);
		}
	}

}

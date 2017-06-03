package com.dt.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dt.bean.*;
import com.dt.DAO.*;

/**
 * Servlet implementation class ChangeUserInfoServlet
 */
public class ChangeUserInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeUserInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	StudentInfo info;
	private void getValues(HttpServletRequest request){
		info = new StudentInfo();
		info.setPassword(request.getParameter("password"));
		info.setStudent_email(request.getParameter("email"));
		info.setStudent_phone(request.getParameter("phone"));
		info.setStudent_id(Integer.parseInt(request.getParameter("student_id")));
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		getValues(request);
		int count = -1;
		count = StudentDAO.change(info);
		if(count == -1){
			response.sendRedirect("changeinfo.jsp");
		}else{
			response.sendRedirect("right.jsp");
		}
	}

}

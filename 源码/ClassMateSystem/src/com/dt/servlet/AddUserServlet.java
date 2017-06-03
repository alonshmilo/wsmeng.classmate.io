package com.dt.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dt.bean.*;
import com.dt.DAO.*;

/**
 * Servlet implementation class AddUserServlet
 */
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	private StudentInfo studentInfo = null;
	private AdressInfo adressInfo = null;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		studentInfo = new StudentInfo();
		adressInfo = new AdressInfo();
		studentInfo.setStudent_name(request.getParameter("username"));
		studentInfo.setStudent_email(request.getParameter("email"));
		studentInfo.setStudent_phone(request.getParameter("phone"));
		adressInfo.setAdress_City(request.getParameter("adress_provice"));
		adressInfo.setAdress_Down(request.getParameter("adress_city"));
		adressInfo.setAdress_Number(request.getParameter("adress_down"));
		int count = -1;
		count = StudentDAO.insert(studentInfo, adressInfo);
		if(count == 1){
			//如果插入成功，则直接返回到right.jsp界面
			response.sendRedirect("right.jsp");
		}else{
			response.sendRedirect("info.jsp");
		}
	}

}

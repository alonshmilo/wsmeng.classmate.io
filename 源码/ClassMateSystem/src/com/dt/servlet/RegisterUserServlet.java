package com.dt.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dt.DAO.StudentDAO;
import com.dt.bean.*;
/**
 * Servlet implementation class RegisterUserServlet
 */
public class RegisterUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterUserServlet() {
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
	private StudentInfo studentInfo = null;
	private AdressInfo adressInfo = null;
	private void getValueFormJSP(HttpServletRequest request){
		studentInfo = new StudentInfo();
		adressInfo = new AdressInfo();
		studentInfo.setStudent_name(request.getParameter("username"));
		studentInfo.setStudent_email(request.getParameter("email"));
		studentInfo.setStudent_phone(request.getParameter("phone"));
		studentInfo.setPassword(request.getParameter("password"));
		adressInfo.setAdress_City(request.getParameter("adress_provice"));
		adressInfo.setAdress_Down(request.getParameter("adress_city"));
		adressInfo.setAdress_Number(request.getParameter("adress_down"));
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		getValueFormJSP(request);
		int count = 0;
		count = StudentDAO.insert(studentInfo, adressInfo);
		if(count == 0){
			response.sendRedirect("register.jsp");
		}else{
			response.sendRedirect("other.jsp");
		}
	}

}

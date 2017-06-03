package com.dt.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dt.DAO.*;
import com.dt.bean.StudentLoginInfo;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public LoginServlet() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String from_name = request.getParameter("name");
		String from_password = request.getParameter("password");
		StudentLoginInfo info = null;
		info = StudentDAO.queryPassword(from_name);
		if(info.getStudent_password().equals(from_password)){
			if(info.getStudent_grade() == 1){
				//想网页传递值
				HttpSession session = request.getSession();
				session.setAttribute("ManagerName", info.getStudent_name());
				session.setAttribute("ManagerID", info.getStudent_ID());
				//管理员登陆成功后，进入到管理界面
				response.sendRedirect("user/index.jsp");
			}else{
				//普通用户跳转界面
				HttpSession session = request.getSession();
				session.setAttribute("ManagerName", info.getStudent_name());
				session.setAttribute("ManagerID", info.getStudent_ID());
				response.sendRedirect("user/test.jsp");
			}
		}else{
			request.setAttribute("promat", "邮箱或密码错误，请重新登陆！");
			request.getRequestDispatcher("other.jsp").forward(request, response);
		}
	}
}

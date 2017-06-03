package com.dt.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dt.DAO.MessageDAO;

/**
 * Servlet implementation class ChangeMessageInfo
 */
public class ChangeMessageInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeMessageInfo() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		//根据jsp传来的信息对信息进行修改，只是对信息的内容进行修改
		int MessageID = Integer.valueOf(request.getParameter("message_id"));
		String Message_Context = request.getParameter("Message_Context");
		int count = 0;
		count = MessageDAO.update(MessageID, Message_Context);
		if(count == 0){
			request.setAttribute("failure", "修改没有成功");
			request.getRequestDispatcher("ChangeMessageInfo.jsp?messageInfo_id=" + MessageID).forward(request, response);
		}else{
			response.sendRedirect("message.jsp");
		}
		
	}

}

package com.dt.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dt.DAO.MessageDAO;
import com.dt.bean.MessageInfo;

/**
 * Servlet implementation class MessagePost
 */
public class MessagePost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessagePost() {
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
	private MessageInfo info = null;
	
	private void getMessageInfo(HttpServletRequest request){
		HttpSession session = request.getSession();
		info = new MessageInfo();
		info.setMessage_title(request.getParameter("Message_Title"));
		info.setMessage_Type(request.getParameter("Message_Type"));
		info.setMessage_Context(request.getParameter("Message_Context"));
		info.setStudent_ID((int)session.getAttribute("ManagerID"));
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		getMessageInfo(request);
		int count = 0;
		count = MessageDAO.insert(info);
		if(count == 1){
			//如果发布成功
			request.setAttribute("success", "发布成功");
			request.getRequestDispatcher("message.jsp").forward(request, response);
		}else{
			request.setAttribute("failure", "发布失败");
			request.getRequestDispatcher("message.jsp").forward(request, response);
		}
	}

}

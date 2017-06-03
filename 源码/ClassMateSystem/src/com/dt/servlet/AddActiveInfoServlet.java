package com.dt.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dt.DAO.ActiveDAO;
import com.dt.bean.*;
/**
 * Servlet implementation class AddActiveInfoServlet
 */
public class AddActiveInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddActiveInfoServlet() {
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
	private ActiveInfo info = null;
	private void getValue(HttpServletRequest request){
		HttpSession session = request.getSession();
		info = new ActiveInfo();
		info.setActiveName(request.getParameter("active_name"));
		info.setActiveDesc(request.getParameter("active_descripe"));
		info.setActiveContext(request.getParameter("active_context"));
		info.setActiveType(Integer.valueOf(request.getParameter("active_type")));
		info.setStudentID((int)session.getAttribute("ManagerID"));
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		getValue(request);
		int count = 0;
		count = ActiveDAO.insert(info);
		if(count == 0){
			request.setAttribute("success", "发布成功");
			request.getRequestDispatcher("active.jsp").forward(request, response);
		}else{
			request.setAttribute("failure", "发布失败");
			request.getRequestDispatcher("active.jsp").forward(request, response);
		}
	}

}

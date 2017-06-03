package com.dt.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dt.DAO.ActiveDAO;

/**
 * Servlet implementation class ChangeActiveInfoServlet
 */
public class ChangeActiveInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeActiveInfoServlet() {
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
	private int ActiveID;
	private float ActiveCost;
	private void getValue(HttpServletRequest request){
		ActiveID = Integer.valueOf(request.getParameter("active_id"));
		ActiveCost = Float.valueOf(request.getParameter("active_cost"));
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		getValue(request);
		int count = 0;
		if(ActiveCost != 0){
			count = ActiveDAO.update(ActiveID, ActiveCost);
		}
		if(count == 0){
			request.setAttribute("failure", "没有修改成功");
			request.getRequestDispatcher("ChangeActiveInfo.jsp?params=" + ActiveID).forward(request, response);
		}else{
			response.sendRedirect("active.jsp");
		}
	}

}

package com.dt.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dt.DAO.*;

/**
 * Servlet implementation class DeleteUserServlet
 */
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUserServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    int student_id;
    private void getParams(HttpServletRequest request){
    	student_id = Integer.parseInt(request.getParameter("param1"));
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		getParams(request);
		if(StudentDAO.queryGrade(student_id) == 1){
			//若果是管理员，则不允许删除动作
			String url = "right.jsp";
			request.setAttribute("promat", "该用户是管理员不允许删除");
			request.getRequestDispatcher(url).forward(request, response);
		}else{
			//如果是普通用户则可以进行删除动作
			int count = -1;
			count = StudentDAO.delete(student_id);
			if(count == -1){
				String url = "right.jsp";
				request.setAttribute("nodelete", "没有完成删除动作");
				request.getRequestDispatcher(url).forward(request, response);
			}else{
				response.sendRedirect("right.jsp");
			}
		}		
	}
}

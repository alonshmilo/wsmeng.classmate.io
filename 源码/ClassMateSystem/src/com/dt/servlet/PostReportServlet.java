package com.dt.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dt.DAO.QuestionReportDAO;
import com.dt.bean.QuestionReportInfo;

/**
 * Servlet implementation class PostReportServlet
 */
public class PostReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostReportServlet() {
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
	private QuestionReportInfo info = null;
	private void getValue(HttpServletRequest request){
		info = new QuestionReportInfo();
		info.setReportTitle(request.getParameter("reportName"));
		info.setPostDate(request.getParameter("postdate"));
		info.setEndDate(request.getParameter("enddate"));
		HttpSession session = request.getSession();
		info.setStudentName((String)session.getAttribute("ManagerName"));
		info.setStudentID((int)session.getAttribute("ManagerID"));
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		getValue(request);
		int report_id = 0;
		report_id = QuestionReportDAO.insert(info);
		if(report_id == 0){
			//该主题的问卷，没有发布成功
			HttpSession session = request.getSession();
			session.setAttribute("postMessage", "该主题没有发布成功");
			response.sendRedirect("questionReport.jsp");
		}else{
			//发表成功
			HttpSession session = request.getSession();
			//发表成功后，奥从数据库中读取到该问卷的ID号
			session.setAttribute("reportID", report_id);
			session.setAttribute("postMessage", "该主题发布成功,请向该主题添加问题");
			response.sendRedirect("questionReport.jsp");
		}
	}

}

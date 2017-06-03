package com.dt.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dt.DAO.QuestionDAO;
import com.dt.bean.QuestionInfo;

/**
 * Servlet implementation class PostQuestionServlet
 */
public class PostGapQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostGapQuestionServlet() {
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
	private String questionName;
	private QuestionInfo info = null;
	private void getValue(HttpServletRequest request){
		info = new QuestionInfo();
		questionName = request.getParameter("question_name");
		HttpSession session = request.getSession();
		info.setQuestionName(questionName);
		info.setReportID((int)session.getAttribute("reportID"));
		info.setTypeID(3);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		getValue(request);
		int questionID = 0;
		questionID = QuestionDAO.insert(info);
		HttpSession session = request.getSession();
		if(questionID != 0){
			session.setAttribute("gapMessage", "发布成功，请继续发布问题");
			response.sendRedirect("gapQuestion.jsp");
		}else{
			session.setAttribute("gapMessage", "没有发布成功，请重新发布");
			response.sendRedirect("gapQuestion.jsp");
		}
	}

}

package com.dt.servlet;

import java.io.IOException;

import com.dt.DAO.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dt.bean.*;
/**
 * Servlet implementation class PostMultipleQuestionServlet
 */
public class PostMultipleQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostMultipleQuestionServlet() {
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
	private String[] Options = null;
	private QuestionInfo info = null;
	int questionID = 0;
	private void getValue(HttpServletRequest request){
		questionName = request.getParameter("question_name");
		Options = request.getParameterValues("options");
		info = new QuestionInfo();
		info.setQuestionName(questionName);
		HttpSession session = request.getSession();
		info.setReportID((int)session.getAttribute("reportID"));
		info.setTypeID(2);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		getValue(request);
		questionID = QuestionDAO.insert(info);
		HttpSession session = request.getSession();
		if(questionID != 0){
			for(String option : Options){
				OptionInfo inf = new OptionInfo();
				inf.setQuestionID(questionID);
				inf.setOptionContent(option);
				int count = 0;
				count = OptionDAO.insert(inf);
				if(count != 0){
					//do nothing
				}else{
					session.setAttribute("multipleMessage", "发布失败，请重新发布");
					OptionDAO.delete(questionID);
					QuestionDAO.delete(questionID);
					response.sendRedirect("multipleQuestion.jsp");
				}
			}
			session.setAttribute("multipleMessage", "发布成功，请继续发布");
			response.sendRedirect("multipleQuestion.jsp");
		}else{
			session.setAttribute("multipleMessage", "发布失败，请重新发布");
			response.sendRedirect("multipleQuestion.jsp");
		}
	}

}

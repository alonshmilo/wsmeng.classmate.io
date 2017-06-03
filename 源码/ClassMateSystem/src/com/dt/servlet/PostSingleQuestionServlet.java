package com.dt.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.dt.DAO.OptionDAO;
import com.dt.DAO.QuestionDAO;
import com.dt.bean.*;
/**
 * Servlet implementation class PostSingleQuestionServlet
 */
public class PostSingleQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostSingleQuestionServlet() {
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
	private int questionID = 0;
	QuestionInfo info = null;
	private void getValue(HttpServletRequest request){
		questionName = request.getParameter("question_name");
		Options = request.getParameterValues("options");
		info = new QuestionInfo();
		HttpSession session = request.getSession();
		info.setQuestionName(questionName);
		info.setReportID((int)session.getAttribute("reportID"));
		info.setTypeID(1);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		getValue(request);
		HttpSession session = request.getSession(); 
		questionID = QuestionDAO.insert(info);
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
					session.setAttribute("singleMessage", "发布失败，请重新发布");
					OptionDAO.delete(questionID);
					QuestionDAO.delete(questionID);
					response.sendRedirect("singleQustion.jsp");
				}
			}
			session.setAttribute("singleMessage", "发布成功，请继续发布");
			response.sendRedirect("singleQustion.jsp");
		}else{
			session.setAttribute("singleMessage", "发布失败，请重新发布");
			response.sendRedirect("singleQustion.jsp");
		}
	}

}

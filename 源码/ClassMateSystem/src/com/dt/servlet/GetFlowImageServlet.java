package com.dt.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dt.DAO.ImageDAO;
import com.dt.bean.ImageInfo;

/**
 * Servlet implementation class GetFlowImageServlet
 */
public class GetFlowImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetFlowImageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int StudentID = Integer.valueOf(request.getParameter("StudentID"));
		response.reset();
		response.setContentType("image/jpeg/png");
		ServletOutputStream outs = response.getOutputStream();
		InputStream is = null;
		ImageInfo info = null;
		try {
			info = ImageDAO.download(StudentID);
		} catch (Exception e) {
			System.out.println("数据库链接有问题，请检查SQL语句");
			e.printStackTrace();
		}
		try {
			is = info.getImageContext().getBinaryStream();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		byte[] bytes = new byte[1024];
		int len = -0;
		while((len = is.read(bytes)) != -1){
			outs.write(bytes);
		}
		outs.close();
	}

}

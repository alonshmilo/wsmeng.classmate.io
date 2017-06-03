package com.dt.servlet;

import java.io.*;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.*;

import com.dt.DAO.ImageDAO;
import com.dt.bean.*;

/**
 * Servlet implementation class GetImageServlet
 */
public class GetImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetImageServlet() {
        super();
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
		response.reset();
		response.setContentType("image/jpg/png");
		ServletOutputStream outs = response.getOutputStream();
		HttpSession session = request.getSession();
		int StudentID = (int)session.getAttribute("ManagerID");
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
		int len = 0;
		while((len = is.read(bytes)) != -1){
			outs.write(bytes);
		}
		outs.close();
	}

}

package com.dt.servlet;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dt.DAO.ImageDAO;
import com.dt.bean.ImageInfo;
import com.dt.utils.Base64ToImage;

/**
 * Servlet implementation class UploadImageServlet
 */
public class UploadImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadImageServlet() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String src = request.getParameter("img");
		String imagePath = "f://test.jpg";
		Base64ToImage.GenerateImageFormBase64(src.substring(23), imagePath);
		ImageInfo info = new ImageInfo();
		info.setImagePath(imagePath);
		info.setStudentID((int) session.getAttribute("ManagerID"));
		info.setStudentName((String) session.getAttribute("ManagerName"));
		try {
			ImageDAO.insert(info);
		} catch (Exception e) {
			System.out.println("数据库没有打开，或检查数据库语句");
			e.printStackTrace();
		}
		File file = new File(imagePath);
		if(file.exists())
			file.delete();
	}

}

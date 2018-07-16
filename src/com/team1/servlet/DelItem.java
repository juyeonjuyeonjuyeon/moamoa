package com.team1.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team1.dao.ItemDAO;

/**
 * Servlet implementation class DelItem
 */
@WebServlet("/DelItem")
public class DelItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelItem() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// u_idx 값이 넘어 오면 user 테이블에서 삭제 처리(UserDAO에 메소드 추가)
		// u_idx 값 받기
		String item_idx = request.getParameter("item_idx");
		// UserDAO.삭제 메소드 호출
		System.out.println(item_idx);
		try {
			ItemDAO.delItem(item_idx);
			response.getWriter().println("OK");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

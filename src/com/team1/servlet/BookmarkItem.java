package com.team1.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team1.dao.ItemDAO;

/**
 * Servlet implementation class BookmarkItem
 */
@WebServlet("/BookmarkItem")
public class BookmarkItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookmarkItem() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				// item_idx, bookmark(0-no, 1-yes) 받기
		
				String item_idx = request.getParameter("item_idx");
				String bookmark = request.getParameter("bookmark");
				
				// UserDAO.북마크 추가 메소드 호출
				System.out.println(bookmark);
				System.out.println(item_idx);
				try {
					ItemDAO.bookmarkItem(Integer.parseInt(bookmark), item_idx);
					response.getWriter().println("OK");
				} catch (Exception e) {
					e.printStackTrace();
				}
	}

}

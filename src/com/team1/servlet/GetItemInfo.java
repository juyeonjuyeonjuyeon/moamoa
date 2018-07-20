package com.team1.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.team1.dao.ItemDAO;
import com.team1.vo.ItemVO;

/**
 * Servlet implementation class GetItemInfo
 */
@WebServlet("/GetItemInfo")
public class GetItemInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetItemInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String item_idx = request.getParameter("item_idx");
		try {
			ItemVO ivo = ItemDAO.getItemInfo(item_idx);
			//int uIdx = vo.getU_idx();
			String link = "/" + ivo.getLink();
			String imgSrc = "/" + ivo.getImgSrc();
			String itemName = "/" + ivo.getItemName();
			String itemPrice = "/" + ivo.getItemPrice();
			String tagColor = "/" + ivo.getTagColor();
			String bookmark = "/" + ivo.getBookmark();
			String userMail = "/" + ivo.getUserMail();
			
			//확인용
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/plain; charset=UTF-8");
			/*PrintWriter out = response.getWriter();
			out.println("<img style='width:50px;height:50px' src=' "+imgSrc+" '>"+
					"<br><br>userMail-"+userMail+
					"<br><br>link-"+link+
					"<br><br> name-"+itemName+
					"<br><br> price-"+itemPrice+
					"<br><br> tag-"+tagColor+
					"<br><br> bookmark-"+bookmark);*/
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

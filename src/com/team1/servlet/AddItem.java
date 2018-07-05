package com.team1.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddItem
 */
@WebServlet("/AddItem")
public class AddItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddItem() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	/*protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}*/

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String link = request.getParameter("link");
		String itemName = request.getParameter("itemName");
		String itemPrice = request.getParameter("itemPrice");
		String tagColor = request.getParameter("tagColor");
		String bookmark = request.getParameter("bookmark");
		
		response.setContentType("text/html);charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("link-"+link+"\n name-"+itemName+"\n price-"+itemPrice+"\n tag-"+tagColor+"\n bookmark-"+bookmark);
		
	}

}

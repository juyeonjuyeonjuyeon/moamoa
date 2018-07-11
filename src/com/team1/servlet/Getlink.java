package com.team1.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

/**
 * Servlet implementation class Getlink
 */
@WebServlet("/Getlink")
public class Getlink extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Getlink() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 *//*
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
		*/
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*한글 깨짐 해결*/
		request.setCharacterEncoding("UTF-8");
		
		/*input에서 String으로 받아옴*/
		String link = request.getParameter("link");
		
		/*link에서 값 가져오기*/
		Connection.Response resp = 
				Jsoup.connect(link)
                .method(Connection.Method.POST)
                .execute();
		Document document = resp.parse();

		String imgSrc = document.select("div.thumbBox img").attr("src");
		
		Element name = document.select("div.heading h2").first();
		String strName = name.text();

		Element price = document.select("strong.sale_price").first();
		String strPrice = price.text();
		
		/*itemPrice 정수화
		String[] array = strPrice.split(",");
		strPrice = array.toString();*/
		
		System.out.println(imgSrc);
		System.out.println(strName);
		System.out.println(strPrice);
		
		request.setAttribute("imgSrc", imgSrc);
		request.setAttribute("itemName", imgSrc);
		request.setAttribute("itmePrice", imgSrc);
		
		ServletContext context = getServletContext();
		RequestDispatcher dispatcher = context.getRequestDispatcher("/addItem.jsp");
		dispatcher.forward(request, response);
		
	}
		
}


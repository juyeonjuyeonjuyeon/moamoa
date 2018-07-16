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

import com.google.gson.Gson;
import com.team1.vo.ItemVO;

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
/*-------------------------------추가 : link 값에 http://없을 때 붙여주는 메서드
 * ------------------------------추가 : link 에러 나면 else로 넘기기-------------------------------*/
		/*link에서 값 가져오기*/
		
		/*Connection.Response resp = 
				Jsoup.connect(link)
                .method(Connection.Method.POST)
                .execute();
		Document document = resp.parse();*/
		String agent = "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML,like Gecko) Chrome/67.0.3396.99 Safari/537.36";
		Document document = Jsoup.connect(link).userAgent(agent).get();
		
		String imgSrc, itemName, itemPrice;
		Element img,name,price;
		
		//11번가 -ok
		if(link.contains("11st.co.kr")) {
			imgSrc = document.select("div.thumbBox img").attr("src");
			itemName = document.select("div.heading h2").first().text();
			itemPrice = document.select("strong.sale_price").first().text();
		//옥션-no
		}else if(link.contains("auction.co.kr")) {
			imgSrc = document.select("div.thumb-gallery li.on img").first().attr("src");
			itemName = document.select("title").first().text();
			itemPrice = document.select("span.price_original").first().text();
			
		//지마켓-no
		}else if(link.contains("gmarket.co.kr")) {
			imgSrc = document.select("div.thumb-gallery li.on img").first().attr("src");
			itemName = document.select("title").first().text();
			itemPrice = document.select("span.price_original").first().text();
		//자라 -가격 no
		}else if(link.contains("zara.com")) {
			//div#plain-image img
			imgSrc = "http:"+ document.select("a._seoImg").last().attr("href");
			itemName = document.select("h1.product-name").text();
			itemPrice = document.select("div._product-price span").text();
			itemName = itemName.replace("세부 사항", "");
			itemPrice = itemPrice.replace(" 원", "");
		// 쿠팡 - ok
		}else if(link.contains("coupang.com")) {
			itemName = document.select("h2.prod-buy-header__title").text();
			itemPrice = document.select("span.total-price strong").text();
			imgSrc = "http:"+ document.select("img.prod-image__detail").attr("src");
			itemPrice = itemPrice.replace("원", "");
		//그외 쇼핑몰
		}else {
			imgSrc = "<%=path %>/mycart/sample.jpg";
			itemName = "직접 입력해 주세요";
			itemPrice = "0";
		}
		
		/*imgSrc = document.select("div#plain-image img").attr("src");

		itemName = document.select("h1.product-name").first().text();
		
		itemPrice = document.select("div.price span").first().text();*/
	
				
			
		/*itemPrice ,없애기 */
		itemPrice = itemPrice.replace(",", "");
		
		System.out.println(imgSrc);
		System.out.println(itemName);
		System.out.println(itemPrice);
		
		/*json화*/
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json); charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		ItemVO vo = new ItemVO();
		vo.setImgSrc(imgSrc);
		vo.setItemName(itemName);
		vo.setItemPrice( Integer.parseInt(itemPrice.trim()));
		
		Gson gson = new Gson();
		String json = gson.toJson(vo);
		out.print(json);
		
		
	}
		
}


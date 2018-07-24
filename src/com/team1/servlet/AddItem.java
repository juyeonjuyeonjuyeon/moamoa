package com.team1.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import com.team1.dao.ItemDAO;
import com.team1.dao.UserDAO;
import com.team1.vo.ItemVO;

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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("null")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String site = "addItem.jsp";
		/*한글 깨짐 해결*/
		request.setCharacterEncoding("UTF-8");
		
		/*input에서 String으로 받아옴*/
		String link = request.getParameter("link");
		String imgSrc = request.getParameter("imgSrc");
		String itemName = request.getParameter("itemName");
		String itemPrice = request.getParameter("itemPrice");
		String tagColor = request.getParameter("tagColor");
		String bookmark = request.getParameter("bookmark");
		String userMail = request.getParameter("userMail");
		
		System.out.println(itemPrice);
		System.out.println(imgSrc);
		System.out.println(itemName);
		/*if(imgSrc.equals("0")) {
			imgSrc = "0";
		}*/
		if(itemName.equals("0")) {
			itemName = "0";
		}
		if((itemPrice == null) && itemPrice.equals("0")) {
			itemPrice = "0";
		}
		if(bookmark == null) {
			bookmark = "0";
		}

		
		/*서블릿 확인 출력*/
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		
		/*itemPrice 정수화
		String[] array = itemPrice.split(",");
		itemPrice = array.toString();*/
		
		/*System.out.println("--------------");
		System.out.println(link);
		System.out.println(imgSrc);
		System.out.println(itemName);
		System.out.println(itemPrice);
		System.out.println(tagColor);
		System.out.println(bookmark);*/
		/*DB연결*/
		ItemVO ivo = new ItemVO();
		ivo.setLink(link);
		ivo.setImgSrc(imgSrc);
		ivo.setItemName(itemName);
		ivo.setItemPrice(Integer.parseInt(itemPrice.trim()));
		ivo.setTagColor(tagColor);
		ivo.setBookmark(Integer.parseInt(bookmark.trim()));
		ivo.setUserMail(userMail);
		
		/*DB 성공여부 테스트 출력*/
		try {
			ItemDAO.InsertItem(ivo);
			out.println("<script>");
			out.println("alert('" + "저장되었습니다" + "');");
			out.println("history.back(-1);");
			//out.println("location.reload();");
			out.println("</script>");
			//response.sendRedirect(site);
			//test
			/*out.println("<h1><a href='addItem.jsp' style='text-decoration:none;color:green;'>"
					+ "아이템 저장 성공</a></h1>");	
			out.println("<img style='width:50px;height:50px' src=' "+imgSrc+" '>"+
					"<br><br>userMail-"+userMail+
					"<br><br>link-"+link+
					"<br><br> name-"+itemName+
					"<br><br> price-"+itemPrice+
					"<br><br> tag-"+tagColor+
					"<br><br> bookmark-"+bookmark);*/
			
		} catch (Exception e) {
			out.println("<h1><a href='addItem.jsp' style='text-decoration:none;color:green;'>"
					+ "아이템 저장 실패</a></h1>");	
			out.println("<img style='width:50px;height:50px' src=' "+imgSrc+" '>"+
					"<br><br>userMail-"+userMail+
					"<br><br>link-"+link+
					"<br><br> name-"+itemName+
					"<br><br> price-"+itemPrice+
					"<br><br> tag-"+tagColor+
					"<br><br> bookmark-"+bookmark);
			e.printStackTrace();
		}
		
	}

}

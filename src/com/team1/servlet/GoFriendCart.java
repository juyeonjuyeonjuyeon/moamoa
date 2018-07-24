package com.team1.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team1.dao.ItemDAO;
import com.team1.dao.UserDAO;
import com.team1.vo.ItemVO;
import com.team1.vo.UserVO;

/**
 * Servlet implementation class GoFriendCart
 */
@WebServlet("/GoFriendCart")
public class GoFriendCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoFriendCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String site = "mycart/friendCart.jsp";
		
		/*한글 깨짐 해결*/
		request.setCharacterEncoding("UTF-8");
		
		/*input에서 String으로 받아옴*/
		String friendID = request.getParameter("friendID");
		
		/*서블릿 확인 출력*/
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		/*DB연결*/
		//친구아이디 존재 확인
		try {
			if (UserDAO.EmailCheck(friendID)) {
				ArrayList<ItemVO> itemList = ItemDAO.getItem();
				// getList를 브라우저(jsp)에서 전달을 해줘야 하는데
				// 전달 할 수 있는 방법이 뭐가있을까
				request.setAttribute("itemList", itemList); // userList 이름으로 저장
				RequestDispatcher dis = request.getRequestDispatcher(site);
				dis.forward(request, response);
				//response.getWriter().append("YES");
				System.out.println(friendID+"존재");
				//response.sendRedirect(site);
			}else {
				site = "mycart/mycart.jsp";
				response.sendRedirect(site);
			}
		} catch (Exception e) {
			System.out.println("존재하지 않음");
			site = "mycart/mycart.jsp";
			response.sendRedirect(site);
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

package com.team1.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team1.dao.ItemDAO;
import com.team1.vo.ItemVO;

/**
 * Servlet implementation class SortServlet
 */
@WebServlet("/SortServlet")
public class SortServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SortServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//a 태그에서 넘어오는 sort 값 저장
		String sort = request.getParameter("sort");
		System.out.println(sort);
		
		//sort 값을 인트값으로 저장하기 위한 변수
		int iSort = 0;
		//System.out.println(ckval);
		//String path = request.getContextPath();
		//System.out.println(path);
		String site = "mycart/mycart.jsp";
		
		if(sort != null) {
			iSort = Integer.parseInt(sort);
		}
		
		//sort 값이 1또는 2가 아니면 자동으로 위에서 선언된 0 값이 된다.
		try {
			ArrayList<ItemVO> itemList = ItemDAO.getItem(iSort);
			// getList를 브라우저(jsp)에서 전달을 해줘야 하는데
			// 전달 할 수 있는 방법이 뭐가있을까
			request.setAttribute("itemList", itemList); // userList 이름으로 저장
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher dis = request.getRequestDispatcher(site);
		dis.forward(request, response);
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

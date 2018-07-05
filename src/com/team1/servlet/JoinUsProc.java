package com.team1.servlet;

import java.io.IOException;
import java.io.PrintWriter;

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
 * Servlet implementation class JoinUsProc
 */
@WebServlet("/JoinUsProc")
public class JoinUsProc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinUsProc() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*한글 깨짐 해결*/
		request.setCharacterEncoding("UTF-8");//한글 깨짐 해결
		
		/*input에서 String으로 받아옴*/
		// name, phone, email, pw
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		
		/*서블릿 확인 출력*/
		response.setCharacterEncoding("UTF-8");//???해결
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		System.out.println("이름: " + name);
		/*DB연결*/
		UserVO uvo = new UserVO();
		uvo.setName(name);
		uvo.setPhone(phone);
		uvo.setEmail(userId);
		uvo.setPw(userPw);
		
		/*DB 성공여부 테스트 출력*/
		try {
			UserDAO.InsertUser(uvo);
			out.println("<h1>아이템 저장 성공</h1>");			
		} catch (Exception e) {
			out.println("실패: " + name +  "<br>");
			e.printStackTrace();
		}
	}

}

package com.team1.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team1.dao.UserDAO;
import com.team1.vo.UserVO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginProc")
public class LoginProc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginProc() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("login dao");
		// userid 와 userpw를 전달 받아서 eamil, pw
		String email = request.getParameter("userId");
		String pw = request.getParameter("userPw");
		// 잘 넘어 오는지 확인용
		System.out.println("email: "  + email);
		// UserVO 를 전달 해도 되고
		UserVO vo = new UserVO();
		vo.setEmail(email);
		vo.setPw(pw);
		
		String path = request.getContextPath();
		PrintWriter out = response.getWriter();  // 화면 출력
		
		
		try {
//			if (UserDAO.getUser(vo)) {
			UserVO uvo  = UserDAO.getUser(email, pw);
			if (vo.getEmail().equals(uvo.getEmail()) && vo.getPw().equals(uvo.getPw())) {

				HttpSession session = request.getSession();
				session.setAttribute("email", uvo.getEmail());  
				session.setAttribute("pw", uvo.getPw());
				session.setAttribute("name", uvo.getName());
				// 로그인 성공
				//out.println("YES");
				System.out.println("y");

			} else {
				// 로그인 실패
				//out.println("NO");
				System.out.println("n");

			}
			
			response.sendRedirect(path + "/main/main.jsp");
			
			//RequestDispatcher dis = request.getRequestDispatcher("main/main.jsp");
			//dis.forward(request, response);
			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

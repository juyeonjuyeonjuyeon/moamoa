package com.team0.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team0.dao.UserDAO;
import com.team0.vo.UserVO;

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
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
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
			if (uvo != null) {
				// 로그인 성공시 유지 시켜 주기 위해 세션 값 설정
				HttpSession session = request.getSession();
				session.setAttribute("email", uvo.getEmail());   // 값을 저장
				session.setAttribute("name", uvo.getName());   // 값을 저장
				// 로그인 성공
				out.println("YES");
				//response.sendRedirect(path + "/main.tm0");
			} else {
				// 로그인 실패
				out.println("NO");
				//response.sendRedirect(path + "/login.tm0");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}   // vo를 담아서 전달.
		
		// email, pw 만 전달 해도 되고
//		UserDAO.getUser(email, pw);   // String 값 전달
		
		// UserDAO 에 InsertUser 매소드를 만든거 처럼
		// UserDAO 클래스 안에 InsertUser 매소드 밑에
		// getUser 라는 매소드를 만들어서 그 매소드에서
		// DB 에서 select 쿼리 문으로 이메일 과 패스워드를 검색
		// 쿼리는 : select * from user where email = ?
		// ID가 있는 사용자 정보를 받아 와서 
		// 검색 결과를 비교 해서 ID / PW 체크 후 
		// 맞으면 맞다 라고 하고 페이지 이동
		// 틀리면 틀리다라고 하고 다시 로그인 
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

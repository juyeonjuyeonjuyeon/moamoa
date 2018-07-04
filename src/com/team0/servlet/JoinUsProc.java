package com.team0.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team0.dao.UserDAO;
import com.team0.vo.UserVO;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		// name, phone, email, pw
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		
		// 확인용
		System.out.println("이름: " + name);
		
		UserVO uvo = new UserVO();
		uvo.setName(name);
		uvo.setEmail(email);
		uvo.setPw(pw);
		
		// static 으로 만들어서 바로 사용 가능
		// 원래는 객체 생성 후 만듬.
		//response.setContentType("text/plain; charset=UTF-8");
		PrintWriter out = response.getWriter();

		try {
			UserDAO.InsertUser(uvo);
			out.println("OK");			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			out.println("이름: " + name +  "<br>");
			e.printStackTrace();
		}
		
		// DB 연결 해서 데이터 삽입 
		// DB 커넥터 (jar 파일 라이브러리 )
		// 우리 DB는 Mysql 이다.
		// DAO(클래스) 를 만들어서 데이터 삽입 쿼리를 넣는 
		// 실행 매소드 생성
		// 이 클래스 안에는 테이블 정보(컬럼값)을 담는
		// 클래스가 필요(VO / DTO)
		
//		response.setContentType("text/html; charset=UTF-8");
//		PrintWriter out = response.getWriter();
//		out.println("이름: " + name +  "<br>");
//		out.println("메일: " + email +  "<br>");
//		out.println("비번: " + pw +  "<br>");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

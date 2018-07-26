package com.team1.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team1.dao.UserDAO;
import com.team1.vo.UserVO;

/**
 * Servlet implementation class UpdateUser
 */
@WebServlet("/UpdateUser")
public class UpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		/*한글 깨짐 해결*/
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String u_idx = request.getParameter("u_idx");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		
		UserVO uvo = new UserVO();
		uvo.setU_idx(Integer.parseInt(u_idx));
		uvo.setName(name);
		uvo.setPhone(phone);
		uvo.setEmail(email);
		uvo.setPw(pw);
		System.out.println(name);
		System.out.println(phone);
		System.out.println(email);
		System.out.println(pw);
		
		/*DB 성공여부 테스트 출력*/
		try {
			UserDAO.updateInfo(uvo);
			out.println("OK");
		/*	out.println(
			"<h1>회원정보가 수정되었습니다 "+name+"님.</h1>"
			+"<p>즐거운 쇼핑 되세요</p>"*/
					/*);	*/
		} catch (Exception e) {
			/*out.println("실패: " + name +  "<br>");*/
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

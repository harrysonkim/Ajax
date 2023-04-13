package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dto.Member;
import dto.Person;

@WebServlet("/ajax/test02")
public class ajaxTestController02 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("/ajax/test02 [GET]");
		
		
		req.getRequestDispatcher(req.getContextPath() + "/WEB-INF/views/ajax/test02.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("/ajax/test02 [POST]");
		
		//========================================================
		
//		// 응답 방법 1.
//		resp.getWriter().append("직접응답");
//		
//		// 응답 방법 2.
//		resp.sendRedirect("리다이렉트 URL응답" + "?쿼리 스트링");
//		
//		// 응답 방법 3.
//		req.setAttribute("응답 데이터", "View로 보낼 데이터");
//		req.getRequestDispatcher("View 응답").forward(req, resp);	
//		
//		// 위 3가지 방법 중 1개만 써야한다
		
		//=========================================================
		
		List<Member> list = new ArrayList<>();
		
		list.add( new Member("A", "Alice") );
		list.add( new Member("B", "Bob") );
		list.add( new Member("C", "Clare") );
		
		req.setAttribute("list", list);
		
		// JSP(View)를 이용한 AJAX응답
		req.getRequestDispatcher("/WEB-INF/views/ajax/result.jsp").forward(req, resp);
		
		
		
		
	}
	
	
	
}

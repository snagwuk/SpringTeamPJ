package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import model.User;

public class AdminCheckInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private WebApplicationContext context;

	@Override

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		int position = user.getPosition();
		if (position != 0) {
			//관리자가 아닐 때
			response.setContentType("text/html; charset=UTF-8");			 
			PrintWriter out = response.getWriter();			 
			out.println("<script>alert('권한이 없습니다.'); history.go(-1); </script>");			 
			out.flush();
			return false;
		}

		return true;
	}
}

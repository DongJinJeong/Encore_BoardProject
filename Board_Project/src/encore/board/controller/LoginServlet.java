package encore.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import encore.board.dao.UserDAO;
import encore.board.vo.UserVO;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		UserDAO dao = new UserDAO();
		UserVO vo = new UserVO();
		//로그인
		vo.setUserID(request.getParameter("id"));
		vo.setUserPassword(request.getParameter("pw")); 
		
		PrintWriter out = response.getWriter();
		
		int user = dao.getUser(vo.getUserID(),vo.getUserPassword());
		
		if (user == -1) {
			// 아이디가 없을 때 회원 가입으로 가기 response.sendRedirect()
			out.println("<script>alert('가입되지 않은 아이디입니다');");
			out.println("history.back()");
			out.println("</script>");
			out.flush();
		} else if (user == 0) {
			// 비밀번호 불일치 할 때 비밀번호 찾기로 가기 response.sendRedirect() 
			out.println("<script>alert('비밀번호가 틀렸습니다.');");
			out.println("history.back()");
			out.println("</script>");
			out.flush();
		} else if (user == 1) {
			// 로그인 성공 시 자유게시판 페이지로 이동 response.sendRedirect("main.jsp")
			out.println("<script>alert('로그인에 성공했습니다.');");
			out.println("location.href='main.jsp'");
			session.setAttribute("id", vo.getUserID());
			out.println("</script>");
		}
	}

}

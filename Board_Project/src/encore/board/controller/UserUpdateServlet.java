package encore.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import encore.board.dao.UserDAO;
import encore.board.vo.UserVO;




@WebServlet("/UserUpdateServlet")
public class UserUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		UserDAO dao = new UserDAO();
		
		UserVO user = new UserVO();
		user.setUserID(request.getParameter("id"));
		user.setUserPassword(request.getParameter("userPassword"));
		user.setUserName(request.getParameter("name"));
		user.setUserEmail(request.getParameter("email"));
		user.setUserGender(request.getParameter("gender"));
		
		dao.updateUser(user);
		
		out.println("<script>alert('수정이 완료되었습니다.');");
		out.println("location.href='main.jsp';");
		out.println("</script>");
	}

}

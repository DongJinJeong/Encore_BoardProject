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

@WebServlet("/UserDeleteServlet")
public class UserDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		UserDAO userDAO = new UserDAO();
		UserVO userVO = userDAO.getUserInfo(request.getParameter("id"));
		String userPassword = userVO.getUserPassword();
		String userCheckPassword = request.getParameter("userPassword");
		
		
		if (userPassword.equals(userCheckPassword)) {
			userDAO.deleteUser(userVO);
		} else {
			response.sendRedirect("userDelete.jsp");
		}
		
		PrintWriter out = response.getWriter();
		out.println("<script>alert('회원탈퇴가 완료되었습니다.');");
		out.println("location.href='logout.jsp';");
		out.println("</script>");
	}

}

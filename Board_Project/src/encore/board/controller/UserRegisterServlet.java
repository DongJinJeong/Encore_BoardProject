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

@WebServlet("/UserRegisterServlet")
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		UserDAO userdao = new UserDAO();
		UserVO userVO = new UserVO();
		
		String userID = null;
		String userPassword = request.getParameter("userPassword"); 
		String checkPassword = request.getParameter("checkPassword");
		
		userVO.setUserID(request.getParameter("id"));
		userVO.setUserPassword(userPassword);
		userVO.setUserName(request.getParameter("name"));
		userVO.setUserGender(request.getParameter("gender"));
		userVO.setUserEmail(request.getParameter("email"));
		
		
		if(session.getAttribute("id") != null){
			userID = (String)session.getAttribute("id");
		}
		if(userVO.getUserID() == null || userVO.getUserPassword() == null || userVO.getUserName() == null
				|| userVO.getUserGender() == null || userVO.getUserEmail() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('모두 입력이 되었는지 확인해 주세요.')");
			script.println("history.back()");
			script.println("</script>");
		}else {
			UserDAO userDAO = new UserDAO();
			int result = userDAO.addUser(userVO);
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 가입된 아이디입니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('가입이 완료되었습니다.')");
				script.println("location.href='login.jsp'");
				script.println("</script>");
			}
		}
	}
}

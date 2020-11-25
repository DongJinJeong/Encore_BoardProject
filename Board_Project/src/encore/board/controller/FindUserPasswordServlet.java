package encore.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import encore.board.dao.UserDAO;

@WebServlet("/FindUserPasswordServlet")
public class FindUserPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		UserDAO userDAO = new UserDAO();
		
		String password = userDAO.findUserPasswordById(id);
		
		request.setAttribute("password", password);
		RequestDispatcher rd = request.getRequestDispatcher("showPassword.jsp");
		rd.forward(request, response);
	}

}

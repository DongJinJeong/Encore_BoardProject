package encore.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import encore.board.dao.RepleDAO;
import encore.board.vo.RepleVO;

@WebServlet("/RepleWriteServlet")
public class RepleWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String userId = request.getParameter("userId");
		String content = request.getParameter("reple");
		
		RepleVO repleVO = new RepleVO();
		repleVO.setBoardNo(boardNo);
		repleVO.setUserId(userId);
		repleVO.setContent(content);
		
		RepleDAO repleDAO = new RepleDAO();
		repleDAO.addReple(repleVO);
		
		response.sendRedirect("BoardDetailServlet?boardNo=" + boardNo);
	}
}

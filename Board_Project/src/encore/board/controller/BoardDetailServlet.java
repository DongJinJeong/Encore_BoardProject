package encore.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import encore.board.dao.BoardDAO;
import encore.board.dao.RepleDAO;
import encore.board.vo.BoardVO;
import encore.board.vo.RepleVO;

@WebServlet("/BoardDetailServlet")
public class BoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		BoardDAO boardDAO = new BoardDAO();
		BoardVO boardVO = boardDAO.getBoard(boardNo);
		
		request.setAttribute("boardVO", boardVO);
		
		List<RepleVO> repleList = new ArrayList<RepleVO>(); 
		RepleDAO repleDAO = new RepleDAO();
		
		for (RepleVO repleVO : repleDAO.getRepleList()) {
			if (boardNo == repleVO.getBoardNo()) {
				repleList.add(repleVO);
			}
		}
		
		request.setAttribute("repleList", repleList);
		
		RequestDispatcher rd = request.getRequestDispatcher("boardDetail.jsp");
		rd.forward(request, response);
	}

}

package encore.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import encore.board.dao.BoardDAO;
import encore.board.vo.BoardVO;

@WebServlet("/BoardUpdateServlet")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		BoardDAO boardDAO = new BoardDAO();
		BoardVO board = new BoardVO();
		String userID = null;
		
		HttpSession session = request.getSession();
		
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		
		if(session.getAttribute("id") != null){
			userID = (String)session.getAttribute("id");
		}
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		} 
		// 글 번호를 받아와 int 타입으로 바꿈
		int board_no = 0;
		if(request.getParameter("board_no") != null){
			board_no = Integer.parseInt(request.getParameter("board_no"));
		}
		// 글 번호 못받았을 때
		if(board_no == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href='board.jsp'");
			script.println("</script>");
		}
		BoardVO boardVO = new BoardDAO().getBoard(board_no);
		if(!userID.equals(boardVO.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href='board.jsp'");
			script.println("</script>");
		}else{
		
			if(request.getParameter("title") == "" || request.getParameter("content") == "" 
					|| request.getParameter("title").equals("") || request.getParameter("content").equals("")){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 모두 되지 않았습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				int result = boardDAO.update(board_no, request.getParameter("title"), request.getParameter("content"));
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 수정에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href='board.jsp'");
					script.println("</script>");
				}
			}
		}
	}

}

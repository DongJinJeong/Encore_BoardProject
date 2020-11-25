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

@WebServlet("/BoardWriteServlet")
public class BoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		
		BoardVO board = new BoardVO();
		BoardDAO boardDAO = new BoardDAO();
		String userID = null;
		
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("id") != null){ 
		userID = (String)session.getAttribute("id"); 
		}
		
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("history.back()");
			script.println("</script>");
		} else{
			if(board.getTitle() == "" || board.getContent() == ""){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else{
				
				int result = boardDAO.write(board.getTitle(), userID, board.getContent());
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				} else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href='board.jsp'");
					script.println("</script>");
				}
			}
		}
	}

}

package com.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.board.*;

public class insertBoardCommand implements Command{
	
	public void execute(HttpServletRequest request,HttpServletResponse response) {
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String comments = request.getParameter("comments");
		
		boardDAO dao = boardDAO.getInstance();
		boardDTO dto = new boardDTO();
		
		dto.setWriter(writer);
		dto.setTitle(title);
		dto.setComments(comments);
		int state = dao.insertBoard(dto);
		
		request.setAttribute("state", state);
		
	}
}

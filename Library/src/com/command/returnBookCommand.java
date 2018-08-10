package com.command;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.bookDAO;
import com.member.*;

public class returnBookCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String bid = request.getParameter("bid");
		bookDAO dao = bookDAO.getInstance();
		dao.returnBook(Integer.parseInt(bid));
	}	
}

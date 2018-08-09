package com.command;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.*;

public class viewBookCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
	
		String search = request.getParameter("search");
		String opt = request.getParameter("opt");
		System.out.println(search + " "+opt);
		bookDAO dao = bookDAO.getInstance();
		List<bookDTO> list = dao.getbook("1", search);
		
		request.setAttribute("list",list);
	}	
}

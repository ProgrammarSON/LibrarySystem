package com.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.member.*;

public class insertCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		memberDTO dto = new memberDTO();
		memberDAO dao = memberDAO.getInstance();
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String pw = request.getParameter("password");
		String sex = request.getParameter("sex");
		
		dto.setId(id);
		dto.setName(name);
		dto.setPassword(pw);
		dto.setSex(sex);
		
		System.out.println(id+" "+name+" "+pw+" "+sex);
		int a = dao.insertMember(dto);
		System.out.println(a);
	}

}

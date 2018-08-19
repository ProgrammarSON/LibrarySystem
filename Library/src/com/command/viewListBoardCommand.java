package com.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.board.*;
public class viewListBoardCommand implements Command{

	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		boardDAO dao = boardDAO.getInstance();
		  int page,totalpage,startpage,endpage;
	      String temp = request.getParameter("page");
	      //String member = request.getParameter("member");
	     
	      if(temp == null) page = 1;
	      else page = Integer.parseInt(temp);
	      
	      List<boardDTO> list = dao.getBoardList(page*10);
	      
	      int size = list.size()-1;
	      totalpage = list.get(size).getTotalpage();
	      list.remove(size);
	      
	      
	      if(totalpage % 10 != 0) totalpage = totalpage / 10 +1;
	      else totalpage = totalpage / 10;
	      
	      startpage = ((page-1)/10) * 10 +1;
	      endpage = startpage + 9;
	      if(endpage > totalpage) endpage = totalpage;
	      
	      request.setAttribute("list", list);
	      request.setAttribute("startpage", startpage);
	      request.setAttribute("totalpage", totalpage);
	      request.setAttribute("endpage", endpage);
	}

}

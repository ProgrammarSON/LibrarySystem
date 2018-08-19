<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.board.*" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp"/>
<%
	String id = request.getParameter("id");
	boardDAO dao = boardDAO.getInstance();
	boardDTO dto = dao.getBoard(id);
%>
<div class="layer">
<form> <!--  enctype="multipart/form-data">-->
  <div class="form-group">
    <label for="exampleFormControlInput1">제목</label>
    <input type="text" class="form-control" name="bname" value="<%=dto.getTitle() %>">
  </div>
  
  <div class="form-group">
    <label for="exampleFormControlSelect1">조회수</label>
    <input type="text" class="form-control" name="writer" value="<%=dto.getHits() %>">
  </div>
     
  
  <div class="form-group">
    <label for="exampleFormControlTextarea1">내용</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="5" cols="60" name="comments"><%=dto.getComments()%></textarea>
  </div>
  
 	<br>
	<!-- <button type="button" class="btn btn-danger" onclick="location.href='viewboardlist.do?'">돌아가기 </button>-->
	<!-- <button type="button" class="btn btn-danger" onclick="opener.location.reload()">돌아가기 </button>-->
	<button type="button" class="btn btn-danger" onclick="history.back()">돌아가기 </button>
</form>
	
</div>
<jsp:include page="footer.jsp"/>
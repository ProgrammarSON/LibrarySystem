<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
int startpage = (int)request.getAttribute("startpage");
int totalpage = (int)request.getAttribute("totalpage");;
int endpage = (int)request.getAttribute("endpage");
String keyword = request.getParameter("search");
String opt = request.getParameter("opt"); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "./bootstrap/css/bootstrap.min.css"/>
</head>
<body>

<table class="table" border="1">
		<c:forEach items="${list}" var="dto">
		<tr>
			<td>${dto.bname}</td>
			<td>${dto.writer}</td>
			<td>${dto.location}</td>
			<td>${dto.amount}</td>
			<td>${dto.comments}</td>
			<td>${dto.publisher}</td>
		</tr>
		</c:forEach>
</table><br><br>


 <ul class="pagination justify-content-center">
    
    <% if(startpage == 1) { %>

    <li class="page-item">
      <a class="page-link" href="insertbook.do?page=1&search=<%=keyword%>&opt=<%=opt%> " tabindex="-1">Previous</a>
    </li>
    <%} else {%>
    <li class="page-item">
      <a class="page-link" href="insertbook.do?page=<%=startpage-1 %>&search=<%=keyword%>&opt=<%=opt%>" tabindex="-1">Previous</a>
    </li>
    <%}%>
    <%
    	for(int i=startpage; i<=endpage; i++){
    %> 
    		<li class="page-item"><a class="page-link" href="insertbook.do?page=<%=i%>&search=<%=keyword%>&opt=<%=opt%>"><%=i%></a></li>
    	<%}%>
    
    <% if(endpage != totalpage) endpage++;%>
    <li class="page-item">
      <a class="page-link" href="insertbook.do?page=<%=endpage%>&search=<%=keyword%>&opt=<%=opt%>">Next</a>
    </li>
  </ul>
</body>
</html>
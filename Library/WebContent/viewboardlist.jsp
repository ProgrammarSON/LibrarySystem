<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String admin = (String)session.getAttribute("id");
%>

<%
int startpage = (int)request.getAttribute("startpage");
int totalpage = (int)request.getAttribute("totalpage");
int endpage = (int)request.getAttribute("endpage");
%>

<div class="container">
	<table class="table table-hover mt-3">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>작성일</th>
			<th>조회</th>
		</tr>
 	<c:forEach items="${list}" var="dto">
      <tr>
         <td>${dto.id}</td>
         <td><a href="viewboard.jsp?id=${dto.id}">${dto.title}</a></td>
         <td>${dto.writer}</td>
         <td>${dto.pdate}</td>
     	 <td>${dto.hits}</td>
      </tr>
     </c:forEach>				
	</table>
<br>
<ul class="pagination justify-content-center mt-5">
    
    <% if(startpage == 1) { %>

    <li class="page-item">
      <a class="page-link" href="viewboardlist.do?page=1" tabindex="-1">Previous</a>
    </li>
    <%} else {%>
    <li class="page-item">
      <a class="page-link" href="viewboardlist.do?page=<%=startpage-1 %>" tabindex="-1">Previous</a>
    </li>
    <%}%>
    <%
       for(int i=startpage; i<=endpage; i++){
    %> 
          <li class="page-item"><a class="page-link" href="viewboardlist.do?page=<%=i%>"><%=i%></a></li>
       <%}%>
    
    <% if(endpage != totalpage) endpage++;%>
    <li class="page-item">
      <a class="page-link" href="viewboardlist.do?page=<%=endpage%>">Next</a>
    </li>
  </ul>
<div>
	<%
		if(admin != null)
		if(admin.equals("admin")){	
	%>
	<form>
		<button type="button" class="btn btn-danger" onclick="document.location.href='writeboard.jsp'">글쓰기</button> 
	</form>
	<%} %>
</div>
</div>


<jsp:include page="footer.jsp"/>
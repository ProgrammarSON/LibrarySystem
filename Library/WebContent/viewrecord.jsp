<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.book.*" %>
<jsp:include page="header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
int startpage = (int)request.getAttribute("startpage");
int totalpage = (int)request.getAttribute("totalpage");
int endpage = (int)request.getAttribute("endpage");

%>    

<div class="container">
<table class="table table-hover mt-3">
		<tr>
			<th scope="col">책ID</th>
			<th scope="col">책이름</th>
			<th scope="col">저자</th>
			<th scope="col">출판사</th>
			<th scope="col">상태</th>
			<th scope="col">변동날짜</th>
		</tr>
      <c:forEach items="${list}" var="dto">
      <tr>
         <td>${dto.bid}</td>
         <td>${dto.bname}</td>
         <td>${dto.writer}</td>
         <td>${dto.publisher}</td>
        
        	<c:if test="${dto.state eq 'return'}"> 
         		<td style="color:red">${dto.state}</td>
         	</c:if>
         	<c:if test="${dto.state eq 'rental'}"> 
         		<td style="color:green">${dto.state}</td>
         	</c:if>
        <td>${dto.date}</td>
      </tr>
      </c:forEach>
</table><br><br>

   
<ul class="pagination justify-content-center mt-5">
    
    <% if(startpage == 1) { %>

    <li class="page-item">
      <a class="page-link" href="recordbook.do?page=1" tabindex="-1">Previous</a>
    </li>
    <%} else {%>
    <li class="page-item">
      <a class="page-link" href="recordbook.do?page=<%=startpage-1 %>" tabindex="-1">Previous</a>
    </li>
    <%}%>
    <%
       for(int i=startpage; i<=endpage; i++){
    %> 
          <li class="page-item"><a class="page-link" href="recordbook.do?page=<%=i%>"><%=i%></a></li>
       <%}%>
    
    <% if(endpage != totalpage) endpage++;%>
    <li class="page-item">
      <a class="page-link" href="recordbook.do?page=<%=endpage%>">Next</a>
    </li>
  </ul>
 </div>   


<jsp:include page="footer.jsp"></jsp:include>
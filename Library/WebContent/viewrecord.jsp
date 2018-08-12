<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="./view/header.jsp"></jsp:include>
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

</body>
</html>
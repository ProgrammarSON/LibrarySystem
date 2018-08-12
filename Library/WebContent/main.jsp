<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel = "stylesheet" href = "./bootstrap/css/bootstrap.min.css"/>
</head>
<body>
	<input type="button" class="btn" value="책 입력" onclick="location.href='./book/insertbook.jsp'">
	<input type="button" class="btn" value="책 대여" onclick="location.href='./book/rentalbook.jsp'">
	<input type="button" class="btn" value="책 반납" onclick="location.href='./book/returnbook.jsp'">
	<input type="button" class="btn" value="책 검색" onclick="location.href='./book/searchbook.jsp'">
	<input type="button" class="btn" value="회원정보 수정" onclick="location.href='./member/modifymember.jsp'">
	<input type="button" class="btn" value="로그아웃" onclick="location.href='logout.jsp'">	
</body>
</html>
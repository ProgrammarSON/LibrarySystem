<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int state = (int)request.getAttribute("state");
%>

<%
	if(state < 0) {
%>
	<script language="javascript">
		alert("전권 대여 중입니다.");
		document.location.href="./book/rentalbook.jsp";
	</script>
<%
	}else if(state == 0){ 
%>
	<script language="javascript">
		alert("책이 존재 하지 않습니다.");
		document.location.href="./book/rentalbook.jsp";
	</script>
<%	}else { %>
	<script language="javascript">
		alert("대여가 완료 되었습니다.");
		document.location.href="./book/rentalbook.jsp";
	</script>
	
<%	} %>	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
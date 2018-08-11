<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.member.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	int state = (int)request.getAttribute("state");
%>

<%
	if(state == 0) {
%>
		<script language="javascript">
			alert("비밀번호가 틀립니다.");
			document.location.href="index.jsp";
		</script>
<%
		} else if(state == -1){
		
%>
			<script language="javascript">
				alert("아이디가 틀립니다.");
				document.location.href="index.jsp";
			</script>
<%
		} else {
%>
			<script language="javascript">
				alert("로그인 되었습니다.");
				document.location.href="main.jsp";
			</script>
<%
		}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int state = (int)request.getAttribute("state");
%>

<%
	if(state == 0) {
%>
		<script language="javascript">
			alert("ȸ������ ������ �����Ͽ����ϴ�");
			//document.location.href="../member/modifymember.jsp";
			history.go(-1);
		</script>
<%} else {%>
		<script language="javascript">
			alert("ȸ������ ������ �����Ͽ����ϴ�");
			document.location.href="main.jsp";
		</script>
<%}%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>


</body>
</html>
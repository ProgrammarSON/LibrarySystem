<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int state = (int)request.getAttribute("state");
%>

<%
	if(state < 0) {
%>
	<script language="javascript">
		alert("���� �뿩 ���Դϴ�.");
		document.location.href="./book/rentalbook.jsp";
	</script>
<%
	}else if(state == 0){ 
%>
	<script language="javascript">
		alert("å�� ���� ���� �ʽ��ϴ�.");
		document.location.href="./book/rentalbook.jsp";
	</script>
<%	}else { %>
	<script language="javascript">
		alert("�뿩�� �Ϸ� �Ǿ����ϴ�.");
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
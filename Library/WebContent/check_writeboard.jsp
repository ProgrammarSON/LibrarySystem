<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>

<%
	int state = (int)request.getAttribute("state");
%>

<%
	if(state == 1) {
%>
	<script language="javascript">
		alert("게시물 작성완료");
		document.location.href="./viewboardlist.do";
	</script>
<%
	}else {
%>
	<script language="javascript">
		alert("작성 실패.");
		document.location.href="./main.jsp";
	</script>

<%} %>

<jsp:include page="footer.jsp"></jsp:include>
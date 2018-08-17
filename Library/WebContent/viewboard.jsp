<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"/>
<%
	if(session.getAttribute("ValidMem") == null)
	{
%>
	<script language="javascript">
		alert("로그인 해주세요.");
		//history.go(-1);
	</script>
<%	}%>
<div>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>작성일</th>
			<th>조회</th>
		</tr>
				
	</table>
</div><br>

<div>
	<form>
		<button type="button" class="btn btn-danger" onclick="document.location.href='writeboard.jsp'">글쓰기</button> 
	</form>
</div>


<jsp:include page="footer.jsp"/>
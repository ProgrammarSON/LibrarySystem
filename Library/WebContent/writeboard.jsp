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

<%
	String writer = (String)session.getAttribute("id");
%>

<div class="layer">
<form action="writeboard.do" method="post"> <!--  enctype="multipart/form-data">-->
  
   <div class="form-group">
    <label for="exampleFormControlSelect2">제목</label>
   	<input type="text" class="form-control" name="title">
  </div>
  
  <div class="form-group">
    <label for="exampleFormControlTextarea1">내용 </label>
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="20" cols="60" name="comments"></textarea>
  </div>
  
  <input type="hidden" name="writer" value=<%=writer%>>
 	<br>
	<button type="submit" class="btn btn-success">등록</button>
	<button type="reset" class="btn btn-secondary">다시 작성</button>
	<button type="button" class="btn btn-danger" onclick="document.location.href='main.jsp'">취소</button> 
</form>
</div>

<jsp:include page="footer.jsp"/>
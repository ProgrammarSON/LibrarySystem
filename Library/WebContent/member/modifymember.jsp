<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.member.*" %>
<%
	String id = (String)session.getAttribute("id");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel = "stylesheet" href = "../bootstrap/css/bootstrap.min.css"/>
<style>
  .layer{
   position:absolute;
   top:50%;
   left:50%;
   transform:translate(-50%, -50%)
  }
 </style>
 </head>
<body>

<div class=layer>
<form action="../modifymember.do" method="post" name="reg_frm">
 
 <div class="form-group">
    <label for="exampleFormControlSelect1">아이디</label>
    <input type="text" class="form-control" name="id" value=<%=id %>>
  </div>
 
  <div class="form-group">
    <label for="exampleFormControlSelect1">패스워드</label>
    <input type="password" class="form-control" name="password">
  </div>
  
  <div class="form-group">
    <label for="exampleFormControlSelect2">패스워드 확인</label>
   	<input type="password" class="form-control" name="pcheck">
  </div> 
 
  
  <div class="form-group">
    <label for="exampleFormControlTextarea1">설명</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="5" cols="60" name="a"></textarea>
  </div>
  <input type="submit" name ="sub" value="수정" onclick="updateInfoConfirm()" >
  <input type="reset" value="취소" onclick="javascript:window.location='../main.jsp'">
 </form>
 </div>

</body>
</html>
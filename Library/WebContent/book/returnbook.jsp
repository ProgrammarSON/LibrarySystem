<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<jsp:include page="../view/header.jsp"></jsp:include>
	<div class=layer>
	<form action ="../returnbook.do" method="post">
  		<div class="form-group">
    	<label for="exampleFormControlInput1">도서코드</label>
    	<input type="text" class="form-control" name="bid">
  		</div>
  		<button class="btn btn-primary" type="submit">Return</button>
  	</form>
  	</div>

</body>
</html>
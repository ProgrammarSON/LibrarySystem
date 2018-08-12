<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel = "stylesheet" href = "../bootstrap/css/bootstrap.min.css"/>
</head>
<body>
	<jsp:include page="../view/header.jsp"></jsp:include>
	
	<div class=layer>
	<form action ="../rentalbook.do" method="post">
  		<div class="form-group">
    	<label for="exampleFormControlInput1">도서코드</label>
    	<input type="text" class="form-control" name="bid">
  		</div>
  		<button class="btn btn-primary" type="submit">Rental</button>
  	</form>
  	</div>
	
</body>
</html>
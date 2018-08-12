<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel = "stylesheet" href = "./bootstrap/css/bootstrap.min.css"/>
<title>Insert title here</title>

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

<jsp:include page="./view/header.jsp"></jsp:include>

<div class="center-block layer">
	<form action = "login.do" method="post">
	<div class="container">
		<div class="form-group">
  			<div class="row">
  				<!-- <label class="col">ID</label> -->
    			<div class="col d-inline p-2 bg-primary text-white">ID</div>
    			<div class="col"><input type="text" class="form-control" name="id"></div>
			</div>
		</div>
		<div class="form-group">
			<div class="row">
  				<!-- <label class="col">Password</label> -->
				<div class="col d-inline p-2 bg-primary text-white">Password</div>
				<div class="col"> <input type="password" class="form-control" name="password"></div>
		</div>
		</div>
	</div>	
	<input class="btn" type="submit" value ="Login"><br>
	</form>
	<input class="btn" type="button" onclick="javascript:window.location='./member/join.jsp'" value="JOIN">
</div>
</body>
</html>
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

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Yedam-Library</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">도서입력</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">도서검색</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">도서반납</a>
      </li>
    </ul>
  </div>
</nav>

<div class="center-block layer">
	<form>
	<div class="container">
		<div class="form-group">
  			<div class="row">
  				<!-- <label class="col">ID</label> -->
    			<div class="col d-inline p-2 bg-primary text-white">ID</div>
    			<div class="col"><input type="text" class="form-control"></div>
			</div>
		</div>
		<div class="form-group">
			<div class="row">
  				<!-- <label class="col">Password</label> -->
				<div class="col d-inline p-2 bg-primary text-white">Password</div>
				<div class="col"> <input type="password" class="form-control"></div>
		</div>
		</div>
	</div>
	
	<button class="btn">로그인</button><br>
	<button class="btn">회원가입</button><br>	
	</form>
	</div>
	

		
	<script src="./bootstrap/js/bootstrap.min.js" crossorigin="anonymous"></script>
</body>
</html>
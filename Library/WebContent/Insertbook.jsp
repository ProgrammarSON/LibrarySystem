<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "./bootstrap/css/bootstrap.min.css"/>

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

<div class=layer>
<form>
  <div class="form-group">
    <label for="exampleFormControlInput1">도서명</label>
    <input type="text" class="form-control">
  </div>
  <div class="form-group">
    <label for="exampleFormControlSelect1">저자</label>
    <input type="text" class="form-control">
  </div>
  
  <div class="form-group">
    <label for="exampleFormControlSelect2">출판사</label>
   	<input type="text" class="form-control">
  </div>
  
  
  <div class="form-group">
    <label for="exampleFormControlTextarea1">설명</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="5" cols="60"></textarea>
  </div>
  <span>파일 첨부 추가 예정</span><br><br>
  	
	<button class="btn btn-primary" type="submit">Input</button>
	<input class="btn btn-primary" type="button" value="Cancel">
 
</form>
</div>
</body>
</html>
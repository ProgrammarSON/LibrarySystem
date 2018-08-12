<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel = "stylesheet" href = "./bootstrap/css/bootstrap.min.css"/></head>

<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Yedam-Library</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="../main.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="./book/insertbook.jsp">도서입력</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="./book/searchbook.jsp">도서검색</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="./book/returnbook.jsp">도서반납</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="./book/rentalbook.jsp">도서대여</a>
      </li>      
    </ul>
  </div>
</nav>

</body>
</html>
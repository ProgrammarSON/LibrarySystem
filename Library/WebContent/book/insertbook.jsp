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
   top:60%;
   left:50%;
   transform:translate(-50%, -50%)
  }
</style>
</head>
<body>

<jsp:include page="../view/header.jsp"></jsp:include>

<div class=layer>
<form action="../insertbook.do" method="post"> <!--  enctype="multipart/form-data">-->
  <div class="form-group">
    <label for="exampleFormControlInput1">도서명</label>
    <input type="text" class="form-control" name="bname">
  </div>
  <div class="form-group">
    <label for="exampleFormControlSelect1">저자</label>
    <input type="text" class="form-control" name="writer">
  </div>
  
  <div class="form-group">
    <label for="exampleFormControlSelect2">출판사</label>
   	<input type="text" class="form-control" name="publisher">
  </div>
  
   <div class="form-group">
    <label for="exampleFormControlSelect2">위치</label>
   	<input type="text" class="form-control" name="location">
  </div>
  
   <div class="form-group">
    <label for="exampleFormControlSelect2">수량</label>
   	<input type="text" class="form-control" name="amount">
  </div>
  
  <div class="form-group">
    <label for="exampleFormControlTextarea1">설명</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="5" cols="60" name="comments"></textarea>
  </div>
  
  
  
  
<!-- 	<div class="custom-file">
       	<label class="custom-file-label" for="validatedCustomFile">Choose file...</label>
    	<div class="invalid-feedback">Example invalid custom file feedback</div>
  	</div>
  	
   	<input type="file" name="fileFolder" id="fileFolder" value="File Upload" > -->
	<br>
	<input class="btn btn-primary" type="submit" value="Insert">
	<input class="btn btn-primary" type="button" value="Cancel">
 
</form>
</div>
</body>
</html>
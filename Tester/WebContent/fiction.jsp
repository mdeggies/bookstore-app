<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<title>Home</title>
<style type="text/css">
body {
	background-color: "white";
	background-attachment: fixed;
}
</style>
<title>Welcome <%=session.getAttribute("username")%></title>
</head>
<body>   
	<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Book Store</a>
    </div>
    <div>
      <ul class="nav navbar-nav">
        <li class="active"><a href="welcome.jsp">Home</a></li>
        <li><a href="mystery.jsp">Mystery</a></li>
        <li><a href="fiction.jsp">Fiction</a></li>
        <li><a href="nonfiction.jsp">Non-Fiction</a></li>
        <li><a href="horror.jsp">Horror</a></li>
        <li><a href="adult.jsp">Adult</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> <%=session.getAttribute("username")%></a></li>
        <li><a href="cart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
      </ul>
    </div>
  </div>
</nav>




<div class="container" style="width:200;height:auto">
<form role="form" action = "CartServlet" method = "post">
    <div class="jumbotron">          
  <div class="row">
    <div class="col-md-4"  >
      <a href="assets/Fiction/bird.jpg" >   
        <img src="assets/Fiction/bird.jpg"  class="thumbnail" alt="bird" style="width:700px;height:900px">
      </a>
    </div>
  </div>
  <label class="checkbox-inline">
      <input type="checkbox" value="To Kill a Mockingbird/" name = "book"> Add to Cart
    </label>
  <div class = "row">
    <div class="col-md-4">
      <a href="assets/Fiction/eragon.jpg" >
        <img src="assets/Fiction/eragon.jpg" class="thumbnail" alt="eragon" style="width:700px;height:900px">
      </a>
    </div>
  </div>
  <label class="checkbox-inline">
      <input type="checkbox" value="Eragon/" name = "book"> Add to Cart
    </label>
  <div class = "row">
    <div class="col-md-4">
      <a href="assets/Fiction/hungergames.jpg">      
        <img src="assets/Fiction/hungergames.jpg" class="thumbnail" alt="hunger" style="width:700px;height:900px">
      </a>
    </div>
  </div>
  <label class="checkbox-inline">
      <input type="checkbox" value="Hunger Games/" name = "book"> Add to Cart
    </label>
  <div class = "row">
    <div class="col-md-4">
      <a href="assets/Fiction/potter.jpg">      
        <img src="assets/Fiction/potter.jpg" class="thumbnail" alt="potter" style="width:700px;height:900px">
      </a>
    </div>
  </div>
  <label class="checkbox-inline">
      <input type="checkbox" value="Harry Potter/" name = "book"> Add to Cart
    </label>
  <div class="container">
					  			<input type="submit" class="btn btn-default btn-md" value = "Buy"></input>
					</div>
</div>
    
	
	
	
	
</form>
</div>

	

</body>
</html>
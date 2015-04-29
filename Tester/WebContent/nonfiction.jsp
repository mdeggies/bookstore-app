<%@ page import="java.io.*,java.util.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- If someone is trying to get to welcome.jsp without being logged in,
redirect them to login page -->
<%  
     if (session.getAttribute("username") == null) {  
    	    String redirectURL = "http://localhost:8080/Tester/login.jsp";
    	    response.sendRedirect(redirectURL);
     }
  %>
  
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
    <div class="col-md-4">
      <a href="assets/Nonfiction/devil.jpg" class="thumbnail"style="width:950px;height:auto" >    
        <img src="assets/Nonfiction/devil.jpg" alt="devil" >
      </a>
      
      
      
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Review</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Devil in the White City</h4>
        </div>
        <div class="modal-body">
          <p align = "center"><img src="assets/Nonfiction/devil.jpg" alt="devil" width = "500" height = "700"></p>
          <p align = "center"><img src="assets/Nonfiction/devilR.png" alt="devilR" width = "500" height = "120"></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          
        </div>
      </div>
      
    </div>
  </div>
  
  <label class="checkbox-inline">
      <input type="checkbox" value="Devil in the White City/" name = "book"> Add to Cart
    </label>
    
    </div>
    </div>
    <br />

       <div class="row">
    <div class="col-md-4">
	    <a href="assets/Nonfiction/quiet.jpg" class="thumbnail" style="width:950px;height:auto">    
	        <img src="assets/Nonfiction/quiet.jpg" alt="quiet">
	      </a>


  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal2">Review</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Quiet: The Power of the Introvert</h4>
        </div>
        <div class="modal-body">
          <p align = "center"><img src="assets/Nonfiction/quiet.jpg" alt="quiet" width = "500" height = "700"></p>
          <p align = "center"><img src="assets/Nonfiction/quietR.png" alt="quietR" width = "500" height = "120"></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>   





	 <label class="checkbox-inline">
      <input type="checkbox" value="Quiet/" name = "book"> Add to Cart
    </label>


    </div>
    </div>
     <div class="container">
					  			<input type="submit" class="btn btn-default btn-md" value = "Buy"></input>
					</div>
</div>

</form>
</div>


</body>
</html>
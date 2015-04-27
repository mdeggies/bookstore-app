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
        <li><a href="#">Mystery</a></li>
        <li><a href="#">Fiction</a></li>
        <li><a href="#">Non-Fiction</a></li>
        <li><a href="#">Horror</a></li>
        <li><a href="#">Adult</a></li>
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
      <a href="assets/matte.jpg" class="thumbnail"style="width:950px;height:auto" >    
        <img src="assets/matte.jpg" alt="matte" >
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
          <h4 class="modal-title">Matterhorn</h4>
        </div>
        <div class="modal-body">
          <p align = "center"><img src="assets/matte.jpg" alt="matte" width = "500" height = "700"></p>
          <p align = "center"><img src="assets/matteR.PNG" alt="matteR" width = "500" height = "120"></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          
        </div>
      </div>
      
    </div>
  </div>
  <label class="checkbox-inline">
      <input type="checkbox" value="Matterhorn/" name = "book"> Add to Cart
    </label>
  
  
    </div>
    </div>
    <br />
   <div class="row">
    <div class="col-md-4">
	    <a href="assets/grey.jpg" class="thumbnail" style="width:950px;height:auto">    
	        <img src="assets/grey.jpg" alt="grey">
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
          <h4 class="modal-title">Fifty Shades of Grey</h4>
        </div>
        <div class="modal-body">
          <p align = "center"><img src="assets/grey.jpg" alt="grey" width = "500" height = "700"></p>
          <p align = "center"><img src="assets/greyR.PNG" alt="greyR" width = "500" height = "120"></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>   
	     
	      
	      
	      
	      
	 <label class="checkbox-inline">
      <input type="checkbox" value="50 Shades of Grey/" name = "book"> Add to Cart
    </label>
	      
	      
    </div>
    </div>
     <br />
    <div class="row">
    <div class="col-md-4">
	    <a href="assets/dead.jpg" class="thumbnail" style="width:950px;height:auto">    
	        <img src="assets/dead.jpg" alt="grey">
	      </a>
	      
	      
	      
	       <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal3">Review</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal3" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Fifty Shades of Grey</h4>
        </div>
        <div class="modal-body">
          <p align = "center"><img src="assets/dead.jpg" alt="grey" width = "500" height = "700"></p>
          <p align = "center"><img src="assets/deadR.PNG" alt="greyR" width = "500" height = "120"></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>    
	<br />
	      
	      
	      <label class="checkbox-inline">
      <input type="checkbox" value="The Walking Dead/" name = "book"> Add to Cart
    </label>
	      
    </div>
    </div>
    <br />
    <div class="row">
    <div class="col-md-4">
	    <a href="assets/tattoo.jpg" class="thumbnail" style="width:950px;height:auto">    
	        <img src="assets/tattoo.jpg" alt="grey">
	      </a>
	      
	      
	      	       <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal4">Review</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal4" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Fifty Shades of Grey</h4>
        </div>
        <div class="modal-body">
          <p align = "center"><img src="assets/tattoo.jpg" alt="grey" width = "500" height = "700"></p>
          <p align = "center"><img src="assets/tattooR.PNG" alt="greyR" width = "500" height = "120"></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>    
	      
	      
	     <label class="checkbox-inline">
      <input type="checkbox" value="Dragon Tattoo/" name = "book"> Add to Cart
    </label>
	      
	      
	      
    </div>
    </div>
    
</div>
	<div class="container">
					  			<input type="submit" class="btn btn-default btn-md" value = "Buy"></input>
					</div>
</form>
</div>

<h4>  Hello,  !</h4>
    <form action="CartServlet" method="post"> 
    	<fieldset style="width: 300px"> 
	    	<legend>Register</legend> 
	    		<input type="radio" name="book" value="v">Female</input>
	            	<div class="container">
					  			<input type="submit" class="btn btn-default btn-md" value = "Buy"></input>
					</div>
		</fieldset>
	</form>
	

</body>
</html>
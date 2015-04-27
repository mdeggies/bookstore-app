<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<title>Register</title>
<style type="text/css">
body {
	background-color: "white";
	background-attachment: fixed;
}
</style>
<title>Register</title>
</head>
<body>    
<div class="container">
 
  <form class="form-horizontal" action = "registerServlet" method = "post" role="form">
  	<div class="form-group">
  		<div class="col-sm-10">
  			 <h2>Register</h2>
  		</div>
  	</div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="text">Username:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="user" name = "username" placeholder="Enter username">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">Password:</label>
      <div class="col-sm-10">          
        <input type="password" class="form-control" id="pwd" name = "password" placeholder="Enter password">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="text">First Name:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="fnam" name = "first_name" placeholder="Enter first name">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="text">Last Name:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="lnam" name = "last_name" placeholder="Enter last name">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="text">Address:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="adr" name = "address" placeholder="Enter address">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="text">Store Credit:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="stc" name = "store_credit" placeholder="Enter credit">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="text">Credit Card:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="card" name = "credit_card_info" placeholder="Enter card number">
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <div class="checkbox">
          <label><input type="checkbox"> Remember me</label>
        </div>
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-default" value = "Login">Submit</button>
        <button type="reset" class="btn btn-default" value = "Reset">Reset</button>
      </div>
    </div>
  </form>
</div>


</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<%@ page import="java.util.*" %>
<title>Register</title>
<style type="text/css">
body {
	background-color: "white";
	background-attachment: fixed;
}
div.font{
	font-size: 200%;
}

</style>
<title>Cart</title>
</head>
<body>
		<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Book Store</a>
    </div>
    <div>
      <ul class="nav navbar-nav">
        <li><a href="welcome.jsp">Home</a></li>
        <li><a href="mystery.jsp">Mystery</a></li>
        <li><a href="fiction.jsp">Fiction</a></li>
        <li><a href="nonfiction.jsp">Non-Fiction</a></li>
        <li><a href="horror.jsp">Horror</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="account.jsp"><span class="glyphicon glyphicon-user"></span> <%=session.getAttribute("username")%></a></li>
        <li class="active"><a href="cart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
      </ul>
    </div>
  </div>
</nav>
<div class="container">
	
		<div class="jumbotron">
		<div class = "font">
        <fieldset style="width: 600px">  
            
			<table class="table table-striped" align = "center" id = "myTable">
			    <thead>
			      <tr>
			        <th>Book</th>
			        <th>Price</th>
			      </tr>
			    </thead>
			    
			  </table>
       	</fieldset>
      
    </div>
    <table>
							  <tr>
							     <td><p id = "total"> </p></td>
							  </tr>
						  </table>
						  
	<form action="checkoutServlet" method="post">
    <div class="radio">
      <label><input type="radio" name="option" value = "card">Credit Card</label>
    </div>
    <div class="radio">
      <label><input type="radio" name="option" value = "credit">Store Credit</label>
    </div>
	<label for="card">Credit Card:</label> <input type="text"
		class="form-control" id="card" name="checkOut"
		placeholder="Enter Credit Card Number:">
    <button type="submit" class="btn btn-default" value="checkOut">Check-Out</button>
  </form>
						
  </div>   
 </div> 
  
   
   	
   	
   	<script type="text/javascript">
		var book = "Matterhorn";
		var books = {};
		books["Matterhorn"] = 12.95;
		books["50 Shades of Grey"] = 9.95;
		books["The Walking Dead"] = 7.85;
		books["Dragon Tattoo"] = 19.95;
		books[" "] = 19.95;
		var cart = "<%=session.getAttribute("cart")%>";
		var price = "<%=session.getAttribute("price")%>";
		var array = cart.split("/");
		var arrayP = price.split("/");
		//array.splice(0, 2);
		var b = "book";
		var n = 1;
		var l = array.length;
		var total = 0;
		var rows = 3;
		for (var x = 0; x < array.length - 1; x++){
			var table = document.getElementById("myTable");
			var row = table.insertRow(x + 1);
			var cell1 = row.insertCell(0);
			var cell2 = row.insertCell(1);
			cell1.innerHTML = array[x];
			cell2.innerHTML = arrayP[x];
			total = total + parseFloat(arrayP[x]);
		}
		document.getElementById("total").innerHTML = "Total: " + total;

		
	</script>
  	 
</body>
</html>

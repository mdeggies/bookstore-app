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
<title>Insert title here</title>
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
        <li><a href="account.jsp"><span class="glyphicon glyphicon-user"></span> <%=session.getAttribute("username")%></a></li>
        <li><a href="cart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
      </ul>
    </div>
  </div>
</nav>
<div class="container">
	<div class = "font">
	<form action="cartServlet" method="post">  
		<div class="jumbotron">
        <fieldset style="width: 600px">  
            <legend>Account</legend>  
			<table class="table table-striped" align = "center" id = "myTable">
			    <thead>
			      <tr>
			        
			      </tr>
			    </thead>
			  </table>
       	</fieldset>
       	
   	
 <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-primary btn-md" data-toggle="modal" data-target="#myModal2">Review</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close"  data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Fifty Shades of Grey</h4>
        </div>
        <div class="modal-body">
        			<table align = "center">
						  <fieldset style="width: 600px">  
			              
						<table class="table table-striped" id = "myTable2">
						    <thead>
						      <tr>
						        <th>Book</th>
						        <th>Price</th>
						      </tr>
						    </thead>
						  </table>
				
			       	</fieldset>
			      </table> 	
			       	<script type="text/javascript">
							var book = "Matterhorn";
							var books = {};
							books["Matterhorn"] = 12.95;
							books[" 50 Shades of Grey"] = 9.95;
							books[" The Walking Dead"] = 7.85;
							books[" Dragon Tattoo"] = 19.95;
							books[" "] = 19.95;
							var cart = "<%=session.getAttribute("cart")%>";
							var array = cart.split("/");
							//array.splice(0, 2);
							var b = "book";
							var n = 1;
							var l = array.length;
							var rows = 3;
							for (var x = 0; x < array.length - 1; x++){
								var table = document.getElementById("myTable2");
								var row = table.insertRow(x + 1);
								var cell1 = row.insertCell(0);
								var cell2 = row.insertCell(1);
								cell1.innerHTML = array[x];
								cell2.innerHTML = books[array[x]];
								
							}
					
							
						</script>
          <p align = "center"><img src="assets/greyR.PNG" alt="greyR" width = "500" height = "120"></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>   
  
  
   	</div>
   	</form>
   </div>
   	</div>
   	
   	
   	<script type="text/javascript">
		var book = "Matterhorn";
		var books = {};
		books["Matterhorn"] = 12.95;
		books[" 50 Shades of Grey"] = 9.95;
		books[" The Walking Dead"] = 7.85;
		books[" Dragon Tattoo"] = 19.95;
		books[" "] = 19.95;
		var title = {};
		title[0] = "Username:";
		title[1] = "Password:";
		title[2] = "First Name:";
		title[3] = "Last Name:";
		title[4] = "Address:";
		title[5] = "Store Credit:";
		title[6] = "Credit Card Number:";
		var cart = "<%=session.getAttribute("account")%>";
		var array = cart.split("/");
		//array.splice(0, 2);
		var b = "book";
		var n = 1;
		var l = array.length;
		var rows = 3;
		for (var x = 0; x < array.length; x++){
			var table = document.getElementById("myTable");
			var row = table.insertRow(x + 1);
			var cell1 = row.insertCell(0);
			var cell2 = row.insertCell(1);
			cell2.innerHTML = array[x];
			cell1.innerHTML = title[x];
			
		}

		
	</script>
  	 
</body>
</html>

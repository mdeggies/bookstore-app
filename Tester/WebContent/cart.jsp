<%@ include file="header.jsp" %>
	
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
    <p><b> Total with tax <%= session.getAttribute("totalPrice")%> </b>.</p>
							  <tr>
							     <td><p id = "totalPrice" > </p></td>
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
  
  
   	</div>
   	</form>
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

<%@ include file="footer.jsp" %>

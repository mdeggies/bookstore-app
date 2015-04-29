<%@ include file="header.jsp" %>
	<div class = "font">
	<form action="cartServlet" method="post">  
		<div class="jumbotron">
        <fieldset style="width: 600px">  
            
			<table class="table table-striped" align = "center" id = "myTable">
			    <thead>
			      <tr>
			        <th>Book</th>
			        <th>Price</th>
			      </tr>
			    </thead>
			    <table>
							  <tr>
							     <td><p id = "total"> </p></td>
							  </tr>
						  </table>
			  </table>
       	</fieldset>   
  	
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
 
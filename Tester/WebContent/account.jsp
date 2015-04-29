<%@ include file="header.jsp" %>
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
  	 
<%@ include file="footer.jsp" %>


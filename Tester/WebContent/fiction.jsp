<%@ include file="header.jsp" %>
<form role="form" action = "CartServlet" method = "post">
    <div class="jumbotron">        
  <div class="row">
    <div class="col-md-4">
      <a href="assets/Fiction/matte.jpg" class="thumbnail"style="width:950px;height:auto" >    
        <img src="assets/Fiction/matte.jpg" alt="matte" >
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
          <p align = "center"><img src="assets/Fiction/matte.jpg" alt="matte" width = "500" height = "700"></p>
          <p align = "center"><img src="assets/Fiction/matteR.PNG" alt="matteR" width = "500" height = "120"></p>
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
	    <a href="assets/Fiction/bird.jpg" class="thumbnail" style="width:950px;height:auto">    
	        <img src="assets/Fiction/bird.jpg" alt="bird">
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
          <h4 class="modal-title">To Kill a Mockingbird</h4>
        </div>
        <div class="modal-body">
          <p align = "center"><img src="assets/Fiction/bird.jpg" alt="bird" width = "500" height = "700"></p>
          <p align = "center"><img src="assets/Fiction/birdR.png" alt="birdR" width = "500" height = "120"></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>   





	 <label class="checkbox-inline">
      <input type="checkbox" value="To Kill a Mockingbird/" name = "book"> Add to Cart
    </label>


    </div>
    </div>
     <div class="container">
					  			<input type="submit" class="btn btn-default btn-md" value = "Buy"></input>
					</div>
</div>

</form>

<%@ include file="footer.jsp" %>

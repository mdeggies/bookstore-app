<%@ page import="java.io.*,java.util.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- If someone is trying to get to welcome.jsp without being logged in,
redirect them to login page . -->
<%  
     if (session.getAttribute("username") == null) {  
    	    String redirectURL = "http://localhost:8080/Tester/login.jsp";
    	    response.sendRedirect(redirectURL);
     }
  %>

<%@ include file="header.jsp" %>
<form role="form" action = "CartServlet" method = "post">
    <div class="jumbotron">        
  <div class="row">
    <div class="col-md-4">
      <a href="assets/Mystery/ruleoffour.jpeg" class="thumbnail"style="width:950px;height:auto" >    
        <img src="assets/Mystery/ruleoffour.jpeg" alt="ruleoffour" >
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
          <h4 class="modal-title">The Rule of Four</h4>
        </div>
        <div class="modal-body">
          <p align = "center"><img src="assets/Mystery/ruleoffour.jpeg" alt="ruleoffour" width = "500" height = "700"></p>
          <p align = "center"><img src="assets/Mystery/ruleoffourR.png" alt="ruleoffourR" width = "500" height = "120"></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          
        </div>
      </div>
      
    </div>
  </div>
  
  <label class="checkbox-inline">
      <input type="checkbox" value="The Rule of Four/" name = "book"> Add to Cart
    </label>
    
    </div>
    </div>
    <br />

       <div class="row">
    <div class="col-md-4">
	    <a href="assets/Mystery/tattoo.jpg" class="thumbnail" style="width:950px;height:auto">    
	        <img src="assets/Mystery/tattoo.jpg" alt="tattoo">
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
          <h4 class="modal-title">The Girl with the Dragon Tattoo</h4>
        </div>
        <div class="modal-body">
          <p align = "center"><img src="assets/Mystery/tattoo.jpg" alt="tattoo" width = "500" height = "700"></p>
          <p align = "center"><img src="assets/Mystery/tattooR.PNG" alt="tattooR" width = "500" height = "120"></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>   





	 <label class="checkbox-inline">
      <input type="checkbox" value="The Girl with the Dragon Tattoo/" name = "book"> Add to Cart
    </label>


    </div>
    </div>
     <div class="container">
					  			<input type="submit" class="btn btn-default btn-md" value = "Buy"></input>
					</div>
</div>

</form>


<%@ include file="footer.jsp" %>

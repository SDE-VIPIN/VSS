<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Feedback Page</title>
<link rel="icon" href="/VehicleServiceStation/images/favicon.png">
<%@include file="/common/common_css.html" %>
<style>

body{
	background-image: url('/VehicleServiceStation/images/handshake.jpg'); 
  	background-repeat: no-repeat;
 	background-attachment: fixed;
  	background-size: cover;
  	background-size: 100% 100%;
  		
  	
}

.col-form-label {
    margin-left: 25px;
}

.form-div{
	border: solid black;
	border-radius: 15%;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%,-50%);
    width: 40%;
    height: 40%;
      backdrop-filter: blur(0px) saturate(133%);
    -webkit-backdrop-filter: blur(0px) saturate(133%);
    background-color: rgba(238, 243, 248, 0.65);
    border-radius: 12px;
    border: 1px solid rgba(255, 255, 255, 0.125);
}

.star {
    font-size: 24px;
    color: black;
    cursor: pointer;
}

.star.yellow {
    color: yellow;
}

.form-control {
    border: 2px solid black; 
}


</style>


</head>
<body>

<%
	String message = (String)request.getAttribute("msg");
%>



<%@include file="/common/common_header.html" %>

<!-- main body starts here-->
<div class="form-div" >

<form method="post" action="/VehicleServiceStation/UserFeedBack" style="padding: 20px 20px; background-color:">

  <div class="row mb-3">
    <label for="inputName" class="col-sm-3 col-form-label fw-bold">Name</label>
    <div class="col-sm-8">
      <input type="text" class="form-control"  oninput="validateInput(event)"  id="inputName" name="userName" required="required">
    </div>
  </div>
	
	
  <div class="row mb-3">
    <label for="inputEmail3" class="col-sm-3 col-form-label fw-bold">Email</label>
    <div class="col-sm-8">
      <input type="email" class="form-control" id="inputEmail" name="userMail" required="required">
    </div>
  </div>
  
  <div class="row mb-3">
    <label for="inputEmail3" class="col-sm-3 col-form-label fw-bold">Your Remark</label>
    <div class="col-sm-8">
      <input type="text" class="form-control" id="inputRemark" name="userRemark"required="required">
    </div>
  </div>
  
  
  <input type="hidden" id="rating" name="userRating" value="0">
  <div class="row mb-3">
    <label for="inputEmail3" class="col-sm-3 col-form-label fw-bold">Rate us</label>
    <div class="col-sm-8">
    <i class="star far fa-star" onclick="changeColor(1)"></i>
    <i class="star far fa-star" onclick="changeColor(2)"></i>
    <i class="star far fa-star" onclick="changeColor(3)"></i>
    <i class="star far fa-star" onclick="changeColor(4)"></i>
    <i class="star far fa-star" onclick="changeColor(5)"></i>
    </div>
  </div>
  
  <div class="d-grid col-6 mx-auto">
  <button type="submit" class="btn btn-primary fw-semibold">Submit</button></div>
  
 
 <!-- feedback message servlet to jsp page starts here -->
 
 <% 
if(message != null){
	
%>

<div class="alert alert-danger alert-dismissible fade show" role="alert">
  <strong><%= message %></strong>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>

<%} %>
 
 <!-- feedback message servlet to jsp page ends here -->
 
</form>
</div>
<!-- main body ends here-->

<script>
function changeColor(rating) {
    var stars = document.querySelectorAll('.star');
    
    document.getElementById('rating').value = rating;
    
    stars.forEach(function(star, index) {
        if (index < rating) {
            star.classList.add('yellow');
        } else {
            star.classList.remove('yellow');
        }
    });
}
</script>

<script>
function validateInput(event) {
  const input = event.target.value;
  const regex = /^[a-zA-Z ]*$/; // Regular expression to match only characters and space
  if (!regex.test(input)) {
    // If input contains anything other than characters and space, remove them
    event.target.value = input.replace(/[^a-zA-Z ]/g, '');
    alert("Only alphabets are allowed");
  }
}
</script>

<!-- footer starts here -->

	<div class="text-center p-3 fixed-bottom"
		style="background-color: #561c24; color: #ffffff;">
		© 2024 Copyright: All rights reserved by <a style="color: #ffffff;"
			href="#">VSS</a></div>

<!-- footer ends here -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="/VehicleServiceStation/common/validation.js"></script>
</body>
</html>
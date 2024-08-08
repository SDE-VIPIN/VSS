<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Client Registration</title>

<%@include file="/common/common_css.html"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
	

	$(document).ready(function(){
		$("#clientId").on("input", function(){
			 //document.getElementById("userId").value
	        $("#ajaxmsg").text(""); // Clear the message when input is being typed
	    });
	    $("#clientId").change(function(){
	       // alert("hello")
	        // console.log($(this).val());
	        var client_id = $(this).val();//it will fetch the value from input text
	        
	        $.ajax({
	            url: "/VehicleServiceStation/Client_Registration",
	            
	            type : "GET",
	            data:{
	                'id': client_id,
	               /*  'pass': */
	            },
	            //dataType: 'json',
	            success: function(response_data)
	            {
	              //alert(response_data)
	              if(response_data!="")
					{
						
	            //	  document.getElementById("ajaxmsg").innerText=response_data
						$("#ajaxmsg").text(response_data)
						document.getElementById("clientId").value=""
						//$("#providerId").val("")
					
					}
	              else{
	            	  //$("#ajaxmsg").text("")
	              }
	                }
	            

	            
	                });
	    });
	})
	
	
	</script>
	
</head>
<body style="overflow-x: hidden;">

	<!-- header srarts here -->
	<%@include file="/common/common_header.html"%>
	<!-- header ends here -->

<!-- feedback message servlet to jsp page starts here -->
 
 <%
	String message = (String)request.getAttribute("msg");
%>
 
 <% 
if(message != null){
	
%>

<div class="alert alert-danger alert-dismissible fade show" role="alert">
  <strong><%= message %></strong>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>

<%} %>
 
 <!-- feedback message servlet to jsp page ends here -->

	<!-- form starts here -->
	<div class="outerDiv" style="margin-bottom: 10px;">
	
	<div class="container"
		style="padding: 30px;">
		<form class="row g-4 needs-validation" method="post" action="/VehicleServiceStation/Client_Registration" novalidate onsubmit="return checkLength()" onsubmit="return validateForm()"
			style="margin: 30px; border-radius: 25px; box-shadow: 0 0 10px rgba(0, 0, 0, 2.9); background-color: white; position: relative; top: -25px;">
			<div>
				<h2
					style="text-align: center; text-decoration: underline; margin-top: 0;">User
					Registration</h2>
			</div>

			<div class="col-md-6">
				<label for="inputName" class="form-label fw-medium">Name :</label> <input
					type="text" class="form-control" oninput="validateInput(event)" id="inputName"
					style="border: 1px solid black;" name="clientName" required>
				<div class="invalid-feedback" style="position: relative; top: -4px;">Name is required.</div>
			</div>

			<div class="col-md-6">
				<label for="inputEmail4" class="form-label fw-medium">Email :</label>
				<input type="email" class="form-control" id="email"
					style="border: 1px solid black;" name="clientMail" required>
				<div class="invalid-feedback" style="position: relative; top: -4px;">Email is required.</div>
			</div>

			<div class="col-md-6">
				<label for="inputEmail4" class="form-label fw-medium">Id :</label> <input
					type="text" class="form-control" id="clientId"
					style="border: 1px solid black;" name="clientId" required>
					<span id="ajaxmsg" oninput="validateInput(event)" style="color:red;font-size:15px;font-family:Comic Sans Ms"></span>
				<div class="invalid-feedback" style="position: relative; top: -4px;">Create a userId</div>
			</div>

			<div class="col-md-6">
				<label for="inputPassword4" class="form-label fw-medium">Password :</label>
				<input type="password" class="form-control" id="inputPassword4"
					style="border: 1px solid black;" name="clientPass" required>
				<div class="invalid-feedback" style="position: relative; top: -4px;">Create a strong password</div>
			</div>

			<div class="col-md-6">
				<label for="inputPassword4" class="form-label fw-medium">Phone :</label>
				<input type="text" class="form-control" maxlength="10" id="phone"
					style="border: 1px solid black;" name="clientPhone" required>
				<div class="invalid-feedback" style="position: relative; top: -4px;">Phone is required</div>
			</div>

			<div class="col-md-6">
				<label for="inputCity" class="form-label fw-medium">City :</label> <input
					type="text" class="form-control" id="inputCity"
					style="border: 1px solid black;" oninput="validateInput(event)" name="clientCity" required>
				<div class="invalid-feedback" style="position: relative; top: -4px;">City is required.</div>
			</div>

			<div class="col-12">
				<label for="inputAddress" class="form-label fw-medium">Address :</label>
				<input type="text" class="form-control" id="inputAddress" style="border: 1px solid black;"
					placeholder="1234 Main St" name="clientAddress"
					required>
				<div class="invalid-feedback" style="position: relative; top: -4px;">Address is required.</div>
			</div>


			<div class="col-12 mb-3 d-flex justify-content-center">
				<button type="reset" class="btn btn-primary "
					style="margin-right: 10px;">Reset</button>
				<button type="submit" class="btn btn-primary">Sign in</button>
			</div>
		</form>
	</div>
</div>
	<!-- form ends here -->




	<!-- footer srarts here -->
	<footer class="bg-body-tertiary text-center fixed-bottom">
	<div class="text-center p-3" style="background-color:  #561C24; color: white;">
      &#169;2024:All rights reserved by
      <a class="text-white" href="/VehicleServiceStation/commonjsp/index.jsp">VSS</a>
    </div>
	</footer>

	<!-- footer ends here -->

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
<!-- script to allow only alphabets for textfields -->
<script>
document.getElementById('phone').addEventListener('keydown', function(event) {
// Allow only digits and backspace/delete keys

if (!(event.key === 'Backspace' || event.key === 'Delete' || /\d/.test(event.key))) {
	
	
alert("only digits are allowed.")
event.preventDefault();
}
});


function checkLength() {
    var phoneNumber = document.getElementById('phone').value;
    if (phoneNumber.length !== 10) {
        alert("Enter exactly 10 digits");
        return false;
    }
    return true;
}
</script>

<!-- email validation -->
<!-- <script>
function isValidEmail(email) {
    var emailRegex = /^[a-zA-Z0-9._%+-]+@gmail.com$/;
    return emailRegex.test(email);
}

function validateForm() {
    var emailInput = document.getElementById('email').value;
    if (!isValidEmail(emailInput)) {
        alert("Please enter a valid Gmail address.");
        return false; // Prevent form submission
    }
    return true; // Allow form submission
}
</script> -->
<!-- email validation -->


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		type="text/javascript"></script>

	<script src="/VehicleServiceStation/common/validation.js"></script>

</body>
</html>
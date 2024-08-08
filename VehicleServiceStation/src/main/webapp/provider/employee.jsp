<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Worker</title>
<link rel="icon" href="/VehicleServiceStation/images/favicon.png">
<%@include file="/common/common_css.html"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
	

	$(document).ready(function(){
		$("#providerId").on("input", function(){
			 //document.getElementById("userId").value
	        $("#ajaxmsg").text(""); // Clear the message when input is being typed
	    });
	    $("#providerId").change(function(){
	       
	        // console.log($(this).val());
	        var provider_id = $(this).val();//it will fetch the value from input text
	        
	        $.ajax({
	            url: "/VehicleServiceStation/Provider_Employee",
	            
	            type : "GET",
	            data:{
	                'id': provider_id,
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
<body style="background-color: #E8D8C4">

<!-- header srarts here -->
	<%@include file="/provider/provider_header.html"%>
<!-- footer ends here -->

 <!-- feedback message servlet to jsp page starts here -->
 
 <%
	String message = (String)request.getAttribute("msg");
%>
 
 <% 
if(message != null){
	
%>

<div class="alert alert-danger alert-dismissible fade show" role="alert">
  <strong><%=message %></strong>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>

<%} %>
 
 <!-- feedback message servlet to jsp page ends here -->	

<!-- form starts here -->
 
<div class="container" style="margin-top: 6rem;">
    <div class="row justify-content-center mt-5">
      <div class="col-md-6 p-5" style="width: 50rem;">
        <form class="p-4 needs-validation" method="post" action="/VehicleServiceStation/Provider_Employee" onsubmit="return checkLength()" class="needs-validation" novalidate style="border-radius: 5px ; box-shadow: 0 0 10px rgba(0, 0, 0, 0.9);">
        <div><h3 style="text-align: center; text-decoration: underline; margin-top: 0;">Employee Detail</h3></div>
          
          
          <div class="row">
                
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <label class="form-label" for="form3Example1n">Employee Name</label>
                      <input type="text" id="form3Example1n" oninput="validateInput(event)" name="empName" class="form-control form-control-lg" required/>
                      <div class="invalid-feedback">Employee name required.</div>
                    </div>
                  </div>
                  
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <label class="form-label" for="form3Example1m1">Id</label>      
                      <input type="text" name="empId" id="providerId" class="form-control form-control-lg" required/>
                      <span id="ajaxmsg" oninput="validateInput(event)" style="color:red;font-size:20px;font-family: sans serif"></span>
                      <div class="invalid-feedback">Employee id required</div>                    
                      </div>
                  </div>
                  
          </div>
          
          <div class="row">
          
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <label class="form-label" for="form3Example1n1">Email</label>
                      <input type="email" id="form3Example1n1" name="empEmail" class="form-control form-control-lg" required/>
                      <div class="invalid-feedback">Email is required.</div>
                    </div>
                  </div>
                  
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <label class="form-label" for="form3Example1m1">Phone</label>
                      <input maxlength="10" type="text" id="phone" name="empPhone" class="form-control form-control-lg" required/>
                      <div class="invalid-feedback">Phone is required.</div>
                    </div>
                  </div>
                  
          </div>
          
          <div class="d-flex justify-content-center">
            <button type="button" class="btn btn-primary" style="margin-right: 10px;">Reset</button>
            <button type="submit" class="btn btn-primary">Submit</button>
          </div>
          
        
 
        </form>
      </div>
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

	
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		type="text/javascript"></script>
		<script src="/VehicleServiceStation/common/validation.js"></script>
		
<script src="/VehicleServiceStation/common/service.js"></script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="vss.dao.*,vss.beans.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Service Provider Registration</title>
<link rel="icon" href="/VehicleServiceStation/images/favicon.png">
<%@include file="/common/common_css.html"%>


<style>
.card-registration .select-input.form-control[readonly]:not([disabled]) {
font-size: 1rem;
line-height: 2.15;
padding-left: .75em;
padding-right: .75em;
}
.card-registration .select-arrow {
top: 13px;
}

</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
	

	$(document).ready(function(){
		$("#providerId").on("input", function(){
			 //document.getElementById("userId").value
	        $("#ajaxmsg").text(""); 
			 // Clear the message when input is being typed
			 
			
	    });
	    $("#providerId").change(function(){
	       // alert("hello")
	        // console.log($(this).val());
	        var provider_id = $(this).val();//it will fetch the value from input text
	        
	        $.ajax({
	            url: "/VehicleServiceStation/ProviderRegistration",
	            
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
					document.getElementById("providerId").value=""
					
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
<body class="bg-dark">

	<!-- header srarts here -->
	<%@include file="/common/common_header.html"%>
	<!-- footer ends here -->


	<!-- <div class="heading text-center " style="font-family:">
		<h2 style="position: relative; top: 15px;">Service Provider Registration</h2>
	</div> -->
<%
AdminDao dao = new AdminDao();
ArrayList<Plan>planList = dao.viewPlan();
%>	
	
	
<section class="bg-dark">
  <div class="container">
    <div class="row d-flex justify-content-center align-items-center" style="margin-bottom: 50px;">
      <div class="col">
        <div class="card card-registration my-4">
          <div class="row g-0">
            <div class="col-xl-6 d-none d-xl-block">
              <img src="/VehicleServiceStation/images/index9.jpg"
                alt="Sample photo" class="img-fluid"
                style="border-top-left-radius: .25rem; background-size: cover;
	background-repeat: no-repeat;
 	background-attachment: fixed; width:700px; height: 50%;" />
 	<img src="/VehicleServiceStation/images/index8.jpg"
                alt="Sample photo" class="img-fluid"
                style="border-bottom-left-radius: .25rem;  background-size: cover;
	background-repeat: no-repeat;
 	background-attachment: fixed; width:700px; height: 50%;" />
            </div>
            <div class="col-xl-6">
            <form id="myForm" class="needs-validation" method="post" action="/VehicleServiceStation/ProviderRegistration" novalidate onsubmit="return checkLength()">
              <div class="card-body text-black ">
                <h3 class="text-uppercase" style="text-align: center; text-decoration: underline;">Service Provider Registration</h3></div>
				<div class="card-body px-5 py-1 text-black ">
                <div class="row">
                
                
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <label class="form-label" for="form3Example1m">Company Owner</label>
                      <input type="text" id="form3Example1m" name="providerName" class="form-control" oninput="validateInput(event)" required />
                      <div class="invalid-feedback">Name is required.</div>
                    </div>
                  </div>
                  
                  
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <label class="form-label" for="form3Example1n">Company Name</label>
                      <input type="text" id="form3Example1n" name="providerCompany" oninput="validateInput(event)" class="form-control" required/>
                      <div class="invalid-feedback">Enter the company name.</div>
                    </div>
                  </div>
                </div>

                <div class="row">
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <label class="form-label" for="form3Example1m1">Phone</label>
                      <input id="phone" name="providerPhone" class="form-control" maxlength="10" type="text" required >
                      <div class="invalid-feedback">Phone is required.</div>
                    </div>
                  </div>
    
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <label class="form-label" for="form3Example1n1">Email</label>
                      <input type="email" id="form3Example1n1" name="providerEmail" class="form-control" required/>
                      <div class="invalid-feedback">Email is required.</div>
                    </div>
                  </div>
                </div>
                
                
                <div class="row">
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <label class="form-label" for="form3Example1m1">Id</label>      
                      <input type="text" name="providerId" id="providerId" class="form-control" required/>
                      <span id="ajaxmsg" oninput="validateInput(event)" style="color:red;font-size:20px;font-family:Comic Sans Ms"></span>
                      <div class="invalid-feedback">Create your id</div>                    
                    </div>
                  </div>
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <label class="form-label" for="form3Example1n1">Password</label>
                      <input type="password" name="providerPassword" id="form3Example1n1" class="form-control" required/>
                      <div class="invalid-feedback">Create your password</div>
                    </div>
                  </div>
                </div>
                
                
                
                <div class="row">
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <label class="form-label" for="form3Example1m1">CIN No.</label>      
                      <input type="text" name="reg_no" id="form3Example1m1" class="form-control" required/>
                      <div class="invalid-feedback">Company registration no. is missing</div>                    
                    </div>
                  </div>
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <label class="form-label" for="form3Example8">City</label>
                  	  <input type="text" id="form3Example8" name="providerCity" oninput="validateInput(event)" class="form-control" required/>
                      <div class="invalid-feedback">Enter city name</div>
                    </div>
                  </div>
                </div>

				<div class="form-outline mb-4">
				<label class="form-label" for="form3Example8">Plan</label>
				<select class="form-select" aria-label="Default select example" name="plan_name">
                    
                    <% for (Plan p : planList) { %>
                        <option value="<%= p.getPlan_name()%>"><%= p.getPlan_name() %></option>
                    <% } %>
                </select>
				<input type="hidden" name="service" value="<%= planList.get(0).getPlan_name() %>">
				</div>
				
                <div class="form-outline mb-4">  
                  <label class="form-label" for="form3Example9">Address</label>
                  <textarea class="form-control" name="providerAddress" id="form3Example9" rows="2" placeholder="" required></textarea>
                  <div class="invalid-feedback">Address is required.</div>
                </div>

                <div class="form-outline mb-3">
                  <label class="form-label" for="form3Example90">About</label>
                  <textarea class="form-control" name="providerACompany" id="form3Example90" rows="2" placeholder="" required></textarea>
                  <div class="invalid-feedback">Company detail is required.</div>
                </div>


                <div class="d-flex justify-content-center pt-2">
                  <button type="button" class="btn btn-info" style="color: white;">Reset all</button>
                  <button type="submit" class="btn btn-info ms-2" style="color: white;">Submit</button>
                </div>
                </div>
                
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
                
                
                
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
	
	
	
	
	<!-- footer srarts here -->

	<%@include file="/common/common_footer.html"%>

	<!-- footer ends here -->



<!-- <script>

function displaySelectedImage(event, elementId) {
    const selectedImage = document.getElementById(elementId);
    const fileInput = event.target;

    if (fileInput.files && fileInput.files[0]) {
        const reader = new FileReader();

        reader.onload = function(e) {
            selectedImage.src = e.target.result;
        };

        reader.readAsDataURL(fileInput.files[0]);
    }
}

</script> -->

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
</body>
</html>
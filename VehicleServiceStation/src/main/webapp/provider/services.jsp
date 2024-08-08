<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Service Detail</title>
<link rel="icon" href="/VehicleServiceStation/images/favicon.png">
<%@include file="/common/common_css.html"%>
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
 
<div class="container" >
    <div class="row justify-content-center mt-5">
      <div class="col-md-6 p-5" style="width: 50rem;">
        <form class="p-4 needs-validation" method="post" action="/VehicleServiceStation/Provider_Services" style="border-radius: 5px ; box-shadow: 0 0 10px rgba(0, 0, 0, 0.9);" novalidate>
        <div><h3 style="text-align: center; text-decoration: underline; margin-top: 0;">Service Detail</h3></div>
          <div class="form-group mb-3">
            <label for="formGroupExampleInput" class="form-label fw-medium">Service Name</label>
            <input type="text" class="form-control" oninput="validateInput(event)" name="sname" style="border: 0.5px solid black;" id="formGroupExampleInput" placeholder="Washing,Greecing " required>
            <div class="invalid-feedback">Service is missing</div> 
          </div>
          <div class="form-group mb-3">
            <label for="formGroupExampleInput" class="form-label fw-medium">Charge</label>
            <input type="number" name="price" class="form-control" id="charge" style="border: 0.5px solid black;" placeholder="Enter charge" required>
          <div class="invalid-feedback">Service charge is missing</div>
          </div>
          <div class="form-group mb-3">
            <label for="description" class="form-label fw-medium">Description</label>
            <textarea class="form-control" name="description"id="description" rows="3" style="border: 0.5px solid black;" placeholder="Abc......" required></textarea>
            <div class="invalid-feedback">Detail about service</div>
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
	
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		type="text/javascript"></script>
		<script src="/VehicleServiceStation/common/validation.js"></script>
		
<script src="/VehicleServiceStation/common/service.js"></script>

</body>
</html>
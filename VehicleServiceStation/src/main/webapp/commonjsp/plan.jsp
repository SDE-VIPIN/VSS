<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="vss.dao.*,vss.beans.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Plan Page</title>
<%@include file="/common/common_css.html" %>

<style type="text/css">
.card{

}
-webkit-scrollbar{
display:none;

}
.dc{

.card{
transition: all 0.3s;
&:hover{
transform: translateY(-3%);
box-shadow:5px 5px 20px grey;
}
}
}
body{
	background-image: url('/VehicleServiceStation/images/plan.jpg');
	background-size: cover;
	background-repeat: no-repeat;
 	background-attachment: fixed;
}

</style>
</head>
<body>

<%@include file="/common/common_header.html" %>

<div><h1 style="text-align: center; text-decoration: underline; margin: 10px;">Plans For Our Valuable Providers</h1></div>

<!-- plan code starts here -->
<div class="dc container mt-5">
<div class="row g-4">
  <div class="col-3">
    <div class="card h-100">
      <img src="https://img.freepik.com/free-vector/gradient-silver-background_23-2149083115.jpg?t=st=1715289990~exp=1715293590~hmac=eabda6d14552f7a9fa8999e815386fa461dbeef487c04309a1dc8a5be9d85bd2&w=996" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Silver</h5>
      <p class="card-text">Charge : 3000 INR </p>
      <p class="card-text">Validity : 3 Month</p>
      <p class="card-text"><a href="/VehicleServiceStation/provider/provider_registration.jsp">Register here</a></p>
      </div>
      
    </div>
  </div>
  <div class="col-3">
    <div class="card h-100">
      <img src="https://img.freepik.com/free-vector/realistic-luxury-background_23-2149326197.jpg?t=st=1715290202~exp=1715293802~hmac=cc1af7d822517812f2e9ee0b6b3878c6959fa1f34b4fb700d08d348964ba673e&w=996" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Gold</h5>
      <p class="card-text">Charge : 5000 INR </p>
      <p class="card-text">Validity : 6 Month</p>
      <p class="card-text"><a href="/VehicleServiceStation/provider/provider_registration.jsp">Register here</a></p>
      </div>
      
    </div>
  </div>
  <div class="col-3">
    <div class="card h-100">
      <img src="https://img.freepik.com/free-vector/paper-style-luxury-background_23-2148972434.jpg?t=st=1715290041~exp=1715293641~hmac=df27d4e16059563778ca3289932375132c3204e50876c9aad319cad2a106cc32&w=996" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Platinum</h5>
      <p class="card-text">Charge : 8000 INR </p>
      <p class="card-text">Validity : 12 Month</p>
      <p class="card-text"><a href="/VehicleServiceStation/provider/provider_registration.jsp">Register here</a></p>
      </div>
    </div>
  </div>
  <div class="col-3">
<div class="payment sticky-top" Style=" padding:20px 15px;justify-content: center;
border-radius: 18px;
background: #ffffff;
box-shadow:  10px 10px 22px #828282,
             -10px -10px 22px #ffffff;">
<div class="container text-center"><p>Please scan the QR Code before registration</p></div>
<div style="padding: 0 20px;"><img src="/VehicleServiceStation/images/payment.jpg" style="max-width: 100%; height: auto;"></div>
<div class="container p-3 w-8 text-center"><button>Scan me</button></div>
</div>
</div>
</div>
</div>
<!-- plan code ends here -->


<!-- footer srarts here -->
	<footer class="bg-body-tertiary text-center fixed-bottom">
	<div class="text-center p-3" style="background-color:  #561C24; color: white;">
      &#169;2024:All rights reserved by
      <a class="text-white" href="/VehicleServiceStation/commonjsp/index.jsp">VSS</a>
    </div>
	</footer>

	<!-- footer ends here -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
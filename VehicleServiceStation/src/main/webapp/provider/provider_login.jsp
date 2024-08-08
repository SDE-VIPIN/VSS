<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Service Provider Login</title>
<style>
  #btn_1 {
    padding: 10px 20px;
    background-color: #007bff;
    color: #fff;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s, transform 0.3s;
    box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.1);
  }

  #btn_1:active,
  #btn_1:focus {
    background-color: #0056b3;
    transform: scale(0.95);
    box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.1);
  }
</style>
<%@include file="/common/common_css.html"%>

<link rel="stylesheet" href="/VehicleServiceStation/css/provider_login.css">

</head>
<body>
<%-- <%
	String providerId = (String) session.getAttribute("sessionKey");
	String role = (String) session.getAttribute("role");

	System.out.println(session.getId());
		
	if (providerId !=null && role.equals("Service Provider")) {
		response.sendRedirect("/VehicleServiceStation/provider/provider_home.jsp");
	}
		
	
	%> --%>
	<!-- header srarts here -->
	<%@include file="/common/common_header.html"%>
	<!-- footer ends here -->
	
	<div class="content">
<main>
	<header>
		<h4 >Provider Login</h4>
	</header>

<!-- form starts here -->
	<form class="admin_form" method="post" action="/VehicleServiceStation/Provider_Login">

		<div class="form_wrapper">
			<input id="input1" type="text" name="providerId" required> <label for="input" id="user1">User
				Id</label> <i class="fas fa-user-circle adminid"></i>
		</div>

		<div class="form_wrapper">
			<input id="password1" type="password" name="providerPass" onfocus="showEyeIcon()" required> <label
				for="input" id="pass1">Password</label> <i
						id="eyeIcon" class="fas fa-eye-slash hide-eye adminpass" onclick="changeIcon(this)"></i>
		</div>

		<!-- <div class="remember_box">
			<div class="remember">
				<input type="checkbox" checked>Remember me
			</div>
			<a href="#" id="forgotpass">Forgot Password?</a>
		</div> -->
		
		

		<button id="btn_1">Login</button>

		<div class="new_account">
			Don't have an account? <a href="/VehicleServiceStation/provider/provider_registration.jsp">Register</a>
		</div>
		
<!-- form ends here -->
		
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
	</form>
</main>
</div>
	
	
	
	<!-- footer srarts here -->
	<footer class="bg-body-tertiary text-center fixed-bottom">
	<div class="text-center p-3" style="background-color:  #561C24; color: white;">
      &#169;2024:All rights reserved by
      <a class="text-white" href="/VehicleServiceStation/commonjsp/index.jsp">VSS</a>
    </div>
	</footer>

	<!-- footer ends here -->
	
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		type="text/javascript"></script>
		<script src="/VehicleServiceStation/common/visible_password.js"></script>
		
</body>
</html>
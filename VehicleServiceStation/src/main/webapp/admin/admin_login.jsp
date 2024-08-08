<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
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

<link rel="stylesheet" href="/VehicleServiceStation/css/admin_login.css">



</head>
<body>


	<%@include file="/common/common_header.html"%>
	
	<%-- <%
	String messages=(String)request.getAttribute("msg");
	
	if(messages!=null)
	{
	%>
	
	<span><%=messages %></span>
	<%} %> --%>
	
	<div class="content">
		<main>
			<header>
				<h4>Admin Login</h4>
			</header>

			<!-- form starts here -->
			<form class="admin_form needs-validation" method="post"
				action="/VehicleServiceStation/Admin_login" novalidate>

				<div class="form_wrapper needs-validation mb-3">

					<input id="input1" type="text" name="userId" required> <label
						for="input" id="user1">Admin Id</label> <i
						class="fas fa-user-circle adminid"></i>
					<div class="invalid-feedback">Admin Id is missing.</div>
				</div>


				<div class="form_wrapper needs-validation mb-1">
					<input id="password1" type="password" name="userPass" onfocus="showEyeIcon()" required>
					<label for="input" id="pass1">Password</label> <i id="eyeIcon" class="fas fa-eye-slash hide-eye adminpass" onclick="changeIcon(this)"></i>
					<div class="invalid-feedback">Password is missing.</div>
				</div>


				<!-- <div class="remember_box mt-3">
					<div class="remember">
						<input type="checkbox" checked>Remember me
					</div>
					<a href="#" id="forgotpass">Forgot Password?</a>
				</div> -->

				<button id="btn_1">Login</button>

				<!-- form ends here -->

				<!-- feedback message servlet to jsp page starts here -->


				<%
					String messages=(String)request.getAttribute("msg");
					if (messages != null) {
				%>
				
					
					<div class="alert alert-danger alert-dismissible fade show" role="alert">
  						<strong><%= messages %></strong>
  						<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
					</div>
				<% } %>

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
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/VehicleServiceStation/common/validation.js"></script>
	<script src="/VehicleServiceStation/common/visible_password.js"></script>
</body>
</html>
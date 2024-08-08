<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="vss.dao.*,vss.beans.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Client Edit Profile</title>
<%@include file="/common/common_css.html"%>
<%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>

</head>
<body style="background-color: black;">
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

	<%
	String clientId = (String) session.getAttribute("sessionKey");
	String role = (String) session.getAttribute("role");

	System.out.println(session.getId());

	if (clientId == null || session.isNew()) {
		request.setAttribute("msg", "Unathorised access, please do login first");
		RequestDispatcher rd = request.getRequestDispatcher("/client/client_login.jsp");
		rd.forward(request, response);
	}

	else {
		if(role.equals("client")) // equals method is case sensitive so spelling should be correct as admin
		{
	%>
	<!-- header srarts here -->
	<%@include file="/client/client_header.html"%>
	<!-- footer ends here -->

	<%-- <div class="container-fluid">
		<h2>
			Hello
			<%=adminId%>
			you are
			<%=role%></h2>
	</div> --%>

	<div class="container">

		<%
		ClientDao dao = new ClientDao();
		Client clt = dao.viewProfile(clientId);
		%>

		<%-- <h4>Name:<%=a.getName()%></h4> --%>

		<!-- Admin profile code starts-->

		<form method="post" action="/VehicleServiceStation/Client_EditProfile">

			<section
				style="background-color: #dd6877; border-radius: 20px; position: relative; top: 20px">
				<div class="container ">
					<div class="row">
						<div class="col-lg-4">
							<div class="card mb-4 mt-4">
								<div class="card-body text-center mt-4">
									<img src="/VehicleServiceStation/images/profile.png"
										alt="avatar" class="rounded-circle img-fluid"
										style="width: 150px; margin-top: 40px;">


									<div class="d-block mt-5">
										Name:<input type="text" name="name" class="form-control"
											style="text-align: center; margin-top: 10px;"
											value="<%=clt.getName()%>">
										<p class="mt-2">
											you are
											<%=role%></p>
									</div>

									<div class="mt-5 mb-3">
										<button class="btn btn-outline-primary">Save</button>
									</div>

								</div>
							</div>
						</div>
						<div class="col-lg-8">
							<div class="card mb-4 mt-4">
								<div class="card-body">
									<div class="row">
										<h5
											style="text-align: center; margin: 5px 0 8px 0; text-decoration: underline;">Information</h5>
										<div class="col-sm-3">
											<p class="mb-0 mt-4">Name</p>
										</div>
										<div class="col-sm-9">
											<p class="text-muted mb-0 mt-4">
												<input type="text" oninput="validateInput(event)" name="name" class="form-control"
													value="<%=clt.getName()%>">
											</p>
										</div>
									</div>
									<hr>
									<div class="row">
										<div class="col-sm-3">
											<p class="mb-0">Email</p>
										</div>
										<div class="col-sm-9">
											<p class="text-muted mb-0">
												<input type="email" name="email" class="form-control"
													value="<%=clt.getEmail()%>">
											</p>
										</div>
									</div>
									<hr>

									<div class="row">
										<div class="col-sm-3">
											<p class="mb-0">Password</p>
										</div>
										<div class="col-sm-9">
											<p class="text-muted mb-0">
												<input type="password" name="password" class="form-control"
													value="<%=clt.getClient_pass()%>">
											</p>
										</div>
									</div>
									<hr>
									<div class="row">
										<div class="col-sm-3">
											<p class="mb-0">Phone</p>
										</div>
										<div class="col-sm-9">
											<p class="text-muted mb-0">
												<input type="tel" name="phone" maxlength="10" id="phone" class="form-control"
													value="<%=clt.getPhone()%>">
											</p>
										</div>
									</div>
									<hr>
									<div class="row">
										<div class="col-sm-3">
											<p class="mb-0">City</p>
										</div>
										<div class="col-sm-9">
											<p class="text-muted mb-0">
												<input type="text" name="city" class="form-control"
													value="<%=clt.getCity()%>">
											</p>
										</div>
									</div>
									<hr>
									<div class="row">
										<div class="col-sm-3">
											<p class="mb-0">Address</p>
										</div>
										<div class="col-sm-9">
											<p class="text-muted mb-0">
												<textarea rows=" " cols=" " name="address"
													class="form-control"><%=clt.getAddress()%></textarea>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>

		</form>

		<!-- Admin profile code ends-->

	</div>



	<!-- footer srarts here -->
	<footer class="bg-body-tertiary text-center fixed-bottom">
	<div class="text-center p-3" style="background-color:  #561C24; color: white;">
      &#169;2024:All rights reserved by
      <a class="text-white" href="/VehicleServiceStation/commonjsp/index.jsp">VSS</a>
    </div>
	</footer>

	<!-- footer ends here -->

	<%}
		
		else{
			
			request.setAttribute("msg", "You are not authentic person, your role is not authorised to access this page.");
			RequestDispatcher rd = request.getRequestDispatcher("/client/client_login.jsp");
			rd.forward(request, response);
			
		}
	}
	%>

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
//document.getElementById('phone').addEventListener('keydown', function(event) {
// Allow only digits and backspace/delete keys
//if (!(event.key === 'Backspace' || event.key === 'Delete' || /\d/.test(event.key))) {

	document.getElementById('phone').addEventListener('input', function(event) {
	    var phone = event.target.value;
	    if (!/^\d{0,10}$/.test(phone)) {
	alert("only 10 digits")
	event.target.value = ''; // Clear the input field
event.preventDefault();
}
});
</script>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		type="text/javascript"></script>
		
		<script src="/VehicleServiceStation/common/validation.js"></script>

</body>
</html>
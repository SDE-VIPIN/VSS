<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="vss.dao.*,vss.beans.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Provider Edit Profile</title>
<%@include file="/common/common_css.html"%>
<%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
</head>
<body style="background-color: black;">


	<%
	String providerId = (String) session.getAttribute("sessionKey");
	String role = (String) session.getAttribute("role");

	System.out.println(session.getId());

	if (providerId == null || session.isNew()) {
		request.setAttribute("msg", "Unathorised access, please do login first");
		RequestDispatcher rd = request.getRequestDispatcher("/provider/provider_login.jsp");
		rd.forward(request, response);
	}

	else {
		// for authentication
				if(role.equals("Service Provider")) // equals method is case sensitive so spelling should be correct as admin
				{
	%>
	<!-- header srarts here -->
	<%@include file="/provider/provider_header.html"%>
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

ProviderDao dao = new ProviderDao();
Provider pdr = dao.viewProfile(providerId);

%>

		<%-- <h4>Name:<%=a.getName()%></h4> --%>

		<!-- Admin profile code starts-->
		<form method="post"
			action="/VehicleServiceStation/Provider_EditProfile">
			<section
				style="background-color: #dd6877; margin: 20px 0 80px 0; border-radius: 20px; height: calc(100vh- 100px)">
				<div class="container py-3">
					<div class="row">
						<div class="col-lg-4">
							<div class="card">
								<div class="card-body text-center ">
									<img src="/VehicleServiceStation/images/profile.png"
										alt="avatar" class="rounded-circle img-fluid"
										style="width: 150px; margin-top: 120px;">


									<div class="d-block mt-5">
										Name:<input type="text" name="name" class="form-control"
											style="text-align: center; margin-top: 10px;"
											value="<%=pdr.getOwner()%>">
										<p class="mt-3">
											you are
											<%=role%></p>

									</div>


									<div class="mt-5 mb-5" style="padding-bottom: 5vw;">
										<button class="btn btn-outline-primary">Save</button>
									</div>

								</div>
							</div>
						</div>
						<div class="col-lg-8">
							<div class="card mb-4">
								<div class="card-body">
									<div class="row">
										<h5
											style="text-align: center; margin: 5px 0 8px 0; text-decoration: underline;">Information</h5>
										<div class="col-sm-3">
											<p class="mb-0 mt-4">Name</p>
										</div>
										<div class="col-sm-9">
											<p class="text-muted mb-0 mt-4">
												<input type="text" name="name" oninput="validateInput(event)" class="form-control"
													value="<%=pdr.getOwner()%>">
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
													value="<%=pdr.getEmail()%>">
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
													value="<%=pdr.getProvider_password()%>">
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
												<input type="tel" maxlength="10" id="phone" name="phone" class="form-control"
													value="<%=pdr.getPhone()%>">
											</p>
										</div>
									</div>
									<hr>
									<div class="row">
										<div class="col-sm-3">
											<p class="mb-0">Company</p>
										</div>
										<div class="col-sm-9">
											<p class="text-muted mb-0">
												<input type="text" oninput="validateInput(event)" name="company" class="form-control"
													value="<%=pdr.getCompany_name()%>">
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
												<input type="text" oninput="validateInput(event)" name="city" class="form-control"
													value="<%=pdr.getCity()%>">
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
												<textarea rows="" cols="" name="address"
													class="form-control"><%=pdr.getAddress()%></textarea>
											</p>
										</div>
									</div>
									<hr>
									<div class="row">
										<div class="col-sm-3">
											<p class="mb-0">About</p>
										</div>
										<div class="col-sm-9">
											<p class="text-muted mb-0">
												<textarea rows="" cols="" name="about" class="form-control"><%=pdr.getAbout()%></textarea>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- <div class="row">
						<div class="col">
							<div class="card mb-4 mb-md-0">
								<h5 class="mb-4 text-dark"
									style="text-align: center; margin-top: 15px; text-decoration: underline;">Services
									We Provide</h5>
								<div class="card-body d-flex ">
									<div class="col border-end">
										<div class="text-center mx-auto pt-4">
											<img src="/VehicleServiceStation/images/Ac_repair.jpg"
												style="width: 60px;">
										</div>
										<div>
											<h5 class="text-dark text-center pt-1">Car AC Repair</h5>
										</div>
									</div>
									<div class="col border-end">
										<div class="text-center mx-auto pt-4">
											<img src="/VehicleServiceStation/images/battery.jpg"
												style="width: 60px;">
										</div>
										<div>
											<h5 class="text-dark text-center pt-1">Car Battery</h5>
										</div>
									</div>
									<div class="col">
										<div class="text-center mx-auto pt-4">
											<img src="/VehicleServiceStation/images/car_wash.jpg"
												style="width: 60px;">
										</div>
										<div>
											<h5 class="text-dark text-center pt-1">Car Wash</h5>
										</div>
									</div>
								</div>

								<div class="card-body d-flex">
									<div class="col  border-end">
										<div class="text-center mx-auto pt-4">
											<img src="/VehicleServiceStation/images/custum_repair.jpg"
												alt="Custom Repair" style="width: 60px;">
										</div>
										<div>
											<h5 class="text-dark text-center pt-1">Custom Repair</h5>
										</div>
									</div>
									<div class="col border-end">
										<div class="text-center mx-auto pt-4">
											<img src="/VehicleServiceStation/images/periodic_service.jpg"
												alt="Periodic Service" style="width: 60px;">
										</div>
										<div>
											<h5 class="text-dark text-center pt-1">Periodic Service</h5>
										</div>
									</div>
									<div class="col">
										<div class="text-center mx-auto pt-4">
											<img src="/VehicleServiceStation/images/wheel.jpg"
												alt="Wheel Care" style="width: 60px;">
										</div>
										<div>
											<h5 class="text-dark text-center pt-1">Wheel Care</h5>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div> -->
				</div>
			</section>
		</form>
		<!-- Admin profile code ends-->

	</div>

	<!-- footer srarts here -->
	<%@include file="/common/common_footer.html"%>
	<!-- footer ends here -->

	<%}
				
				else{
					
					request.setAttribute("msg", "You are not authentic person, your role is not authorised to access this page.");
					RequestDispatcher rd = request.getRequestDispatcher("/admin/admin_login.jsp");
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
document.getElementById('phone').addEventListener('keydown', function(event) {
// Allow only digits and backspace/delete keys
if (!(event.key === 'Backspace' || event.key === 'Delete' || /\d/.test(event.key))) {
alert("only 10 digits")
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
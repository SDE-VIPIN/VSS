<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="vss.dao.*,vss.beans.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Provider Home</title>
<%@include file="/common/common_css.html"%>
<%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
</head>
<body style="background-color: #E8D8C4">


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
		
<%-- <h2>This is provider page</h2>
	
	<div class="container-fluid">
		<h2>
			Hello
			<%=providerId%>
			you are
			<%=role%></h2>
	</div>	 --%>
	
	<!-- Personal Information starts-->
<%

ProviderDao dao = new ProviderDao();
Provider pdr = dao.viewProfile(providerId);
ArrayList<Services>serviceList = dao.viewServices(providerId);
ArrayList<Employees>empList = dao.viewEmployee(providerId);
%>

<%-- <h4>Name:<%=a.getName()%></h4> --%>

<div><h5 style="text-align: center; margin: 15px 0 8px 0; text-decoration: underline;">Personal Information</h5></div>

<section  style=" padding-left:5vw; padding-right:5vw;">

  <div class="container" >
    <div class="row" style="margin: 2rem 0;">
      <div class="col-lg-4">
        <div class="card mb-4">
          <div class="card-body text-center mt-3">
            <img src="/VehicleServiceStation/images/profile.png" alt="avatar" class="rounded-circle img-fluid mt-4" style="width: 150px;">
            <h5 class="my-3"><%=pdr.getOwner()%></h5>
            <p class="text-muted mb-4"><%=pdr.getAddress()%></p>
            <div class="d-flex justify-content-center mb-2">
              <a href="/VehicleServiceStation/provider/provider_edit_profile.jsp"><i class="far fa-edit mb-5"></i></a>
              <!-- <button type="button" class="btn btn-primary">Follow</button>
              <button type="button" class="btn btn-outline-primary ms-1">Message</button> -->
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-8">
        <div class="card mb-4">
          <div class="card-body">
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0 mt-2">CIN No.</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0 mt-2"><%=pdr.getRegistration_no()%></p>
              </div>
            </div>
            <hr>
            <div class="row"> 
              <div class="col-sm-3">
                <p class="mb-0">Email</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=pdr.getEmail()%></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Phone</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=pdr.getPhone()%></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Company</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=pdr.getCompany_name()%></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">City</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=pdr.getCity()%></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Address</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=pdr.getAddress()%></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">About</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=pdr.getAbout()%></p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    </div>
  </section>

	<!-- Personal Information ends-->
	
	<!-- Services Information starts-->
	<div><h5 style="text-align: center; margin: 15px 0 8px 0; text-decoration: underline;">Services You Offers</h5></div>
	<section  style=" padding-left:5vw; padding-right:5vw;">

<div class="outerDiv" style="margin: 2rem 3rem; max-height: 50vh; overflow-y: auto; ">
<div class="table-responsive">	
	<table class="table table-striped table-hover table-bordered">
		<thead class="table-light" >
			<tr>
				<th scope="col">S.No</th>
				<th scope="col">Service</th>
				<th scope="col">Charge</th>
				<th scope="col">Description</th>
			</tr>
		</thead>
		<tbody class="table-group-divider">
			<!-- it will created on run time that is dynamic -->
			 <% 
            int serialNo = 1; // Initialize a counter for serial number
            for(Services s: serviceList) { 
            %>
            <tr>
                <td><%= serialNo++ %></td> <!-- Display and then increment the serial number -->
                <td><%= s.getService_name() %></td>
                <td><%= s.getCharge()%></td>
                <td><%= s.getDescription()%></td>
            </tr>
            <% } %>


		</tbody>
	</table>	
</div>
</div>

</section>
	<!-- Services Information ends-->
	
	<!-- Employee Information starts-->
	<div><h5 style="text-align: center; margin: 15px 0 8px 0; text-decoration: underline;">Your Employees</h5></div>
	<section  style=" padding-left:5vw; padding-right:5vw;">
	
	<div class="outerDiv" style="margin: 2rem 3rem; max-height: 50vh; overflow-y: auto; ">
<div class="table-responsive">	
	<table class="table table-striped table-hover table-bordered">
		<thead class="table-light" >
			<tr>
				<th scope="col">S.No</th>
				<th scope="col">Employee</th>
				<th scope="col">Emp Id</th>
				<th scope="col">Phone</th>
				<th scope="col">Email</th>
				<th scope="col">Date</th>
			</tr>
		</thead>
		<tbody class="table-group-divider">

			<!-- it will created on run time that is dynamic -->		
            <% 
            int sNo = 1; // Initialize a counter for serial number
            for(Employees e: empList) { 
            %>
            <tr>
                <td><%= sNo++ %></td> <!-- Display and then increment the serial number -->
                <td><%= e.getEmp_name()%></td>
                <td><%= e.getEmp_id()%></td>
                <td><%= e.getPhone()%></td>
                <td><%= e.getEmail()%></td>
                <td><%= e.getDate()%></td>
            </tr>
            <% } %>


		</tbody>
	</table>
</div>
</div>
	

</section>
	<!-- Employee Information ends-->
	
	
	
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

<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		type="text/javascript"></script>

</body>
</html>
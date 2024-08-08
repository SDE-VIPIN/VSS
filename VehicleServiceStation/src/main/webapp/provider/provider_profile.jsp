<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="vss.dao.*,vss.beans.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Provider Profile</title>
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

<section style="background-color: #dd6877; margin: 20px 0 80px 0; border-radius: 20px; height: calc(100vh- 100px)">
  <div class="container py-3">
    <div class="row">
      <div class="col-lg-4">
        <div class="card mb-4">
          <div class="card-body text-center">
            <img src="/VehicleServiceStation/images/profile.png" alt="avatar" class="rounded-circle img-fluid" style="width: 150px;">
            <h5 class="my-3"><%=pdr.getOwner()%></h5>
            <p class="text-muted mb-1">you are <%=role%></p>
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
              <h5 style="text-align: center; margin: 5px 0 8px 0; text-decoration: underline;">Information</h5>
              <div class="col-sm-3">
                <p class="mb-0 mt-4">CIN No.</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0 mt-4"><%=pdr.getRegistration_no()%></p>
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

    <div class="row">
      <div class="col">
        <div class="card mb-4 mb-md-0">
          <h5 class="mb-4 text-dark" style="text-align: center; margin-top: 15px; text-decoration: underline;">Services</h5>
          <div class="card-body d-flex ">
            <div class="col border-end">
              <div class="text-center mx-auto pt-4">
                <img src="/VehicleServiceStation/images/Ac_repair.jpg" style="width: 60px;">
              </div>
              <div>
                <h5 class="text-dark text-center pt-1">Car AC Repair</h5>
              </div>
            </div>
            <div class="col border-end">
              <div class="text-center mx-auto pt-4">
                <img src="/VehicleServiceStation/images/battery.jpg" style="width: 60px;">
              </div>
              <div>
                <h5 class="text-dark text-center pt-1">Car Battery</h5>
              </div>
            </div>
            <div class="col">
              <div class="text-center mx-auto pt-4">
                <img src="/VehicleServiceStation/images/car_wash.jpg" style="width: 60px;">
              </div>
              <div>
                <h5 class="text-dark text-center pt-1">Car Wash</h5>
              </div>
            </div>
          </div>

          <div class="card-body d-flex">
            <div class="col  border-end">
              <div class="text-center mx-auto pt-4">
                <img src="/VehicleServiceStation/images/custum_repair.jpg" alt="Custom Repair" style="width: 60px;">
              </div>
              <div>
                <h5 class="text-dark text-center pt-1">Custom Repair</h5>
              </div>
            </div>
            <div class="col border-end">
              <div class="text-center mx-auto pt-4">
                <img src="/VehicleServiceStation/images/periodic_service.jpg" alt="Periodic Service" style="width: 60px;">
              </div>
              <div>
                <h5 class="text-dark text-center pt-1">Periodic Service</h5>
              </div>
            </div>
            <div class="col">
              <div class="text-center mx-auto pt-4">
                <img src="/VehicleServiceStation/images/wheel.jpg" alt="Wheel Care" style="width: 60px;">
              </div>
              <div>
                <h5 class="text-dark text-center pt-1">Wheel Care</h5>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- provider profile code ends here -->

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

<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		type="text/javascript"></script>

</body>
</html>
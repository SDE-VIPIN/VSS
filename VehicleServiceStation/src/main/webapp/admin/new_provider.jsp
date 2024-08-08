<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="vss.dao.*,java.util.*,vss.beans.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Provider</title>
<%@include file="/common/common_css.html"%>
</head>
<body>

<body style="background-color: #E8D8C4">

<%
	String adminId = (String) session.getAttribute("sessionKey");
	String role = (String) session.getAttribute("role");

	System.out.println(session.getId());

	if (adminId == null || session.isNew()) {
		request.setAttribute("msg", "Unathorised access, please do login first");
		RequestDispatcher rd = request.getRequestDispatcher("/admin/admin_login.jsp");
		rd.forward(request, response);
	}

	else {
		
		if(role.equals("admin")) // equals method is case sensitive so spelling should be correct as admin
		{
	%>

<%@include file="/admin/admin_header.html" %>

<%
AdminDao dao = new AdminDao(); //dao class object
ArrayList<Provider>providerList = dao.viewProviderPayment();
%>

<div><h1 style="text-align: center; text-decoration: underline; margin: 10px;">New Registered Service Providers</h1></div>
<form method="post" action="/VehicleServiceStation/Confirm_Provider_Payment" class="needs-validation" novalidate>
<!-- table creation -->	
<div class="outerDiv" style="margin: 2rem 3rem;">
<div class="table-responsive">	
	<table class="table table-striped table-hover table-bordered">
		<thead class="table-light">
			<tr>
				<th scope="col">S.No</th>
				<th scope="col">Payment</th>
				<th scope="col">Plan</th>
				<th scope="col">Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Password</th>
				<th scope="col">Company</th>
				<th scope="col">CIN No.</th>
				<th scope="col">Phone</th>
				<th scope="col">City</th>
				<th scope="col">Date</th>
			</tr>
		</thead>
		<tbody class="table-group-divider">

			<!-- it will created on run time that is dynamic -->
			<%
			int serialNo = 1; // Initialize a counter for serial number
    for(Provider p : providerList)
    {
    	
    
    
    %>
			<tr>
				<td><%= serialNo++ %></td>
				<th scope="row" class="text-center"><input class="form-check-input" type="checkbox" id="flexCheckDefault" name="paymentid" value="<%=p.getProvider_id()%>"></th>
				<td scope="row"><%=p.getPlan_name()%></td>
				<td scope="row"><%=p.getProvider_id()%></td>
				<td><%=p.getOwner()%></td>
				<td><%=p.getEmail()%></td>
				<td><%=p.getProvider_password()%></td>
				<td><%=p.getCompany_name()%></td>
				<th><%=p.getRegistration_no()%></th>
				<td><%=p.getPhone()%></td>
				<td><%=p.getCity()%></td>
				<td><%=p.getDate()%></td>
				
			</tr>
			<%} %>


		</tbody>
	</table>
</div>
</div>
	<!-- table creation ends-->
<div class="container my-4">
<div class="d-grid gap-1"><button type="submit" class="btn btn-outline-primary btn-lg">Submit</button></div>
</div>

</form>

<%@include file="/admin/admin_footer.html" %>
<%}
		
		else{
			
			request.setAttribute("msg", "You are not authentic person, your role is not authorised to access this page.");
			RequestDispatcher rd = request.getRequestDispatcher("/admin/admin_login.jsp");
			rd.forward(request, response);
			
		}
	}
	%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
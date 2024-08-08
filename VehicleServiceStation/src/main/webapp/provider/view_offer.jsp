<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="vss.dao.*,java.util.*,vss.beans.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View offer</title>
<%@include file="/common/common_css.html"%>
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
	
	
	<div><h1 style="text-align: center; text-decoration: underline; margin: 10px;">Offers Posted By You</h1></div>
	
	<%
	ProviderDao dao = new ProviderDao();
	ArrayList<Offer_scheme>offerList = dao.viewOffer(providerId);
	%>
	
<form method="post" action="/VehicleServiceStation/Delete_Offer" class="needs-validation" novalidate>	
	<!-- table creation -->
<div class="outerDiv" style="margin: 2rem 5rem;">
<div class="table-responsive">
	<table class="table table-striped table-hover table-bordered">
		<thead class="table-light" >
			<tr>
				<th scope="col">Delete</th>
				<th scope="col">S.No</th>
				<th scope="col">Service</th>
				<th scope="col">Service Id</th>
				<th scope="col">Charge</th>
				<th scope="col">Description</th>
				<th scope="col">Date</th>
			</tr>
		</thead>
		<tbody class="table-group-divider">

			<!-- it will created on run time that is dynamic -->		
            <% 
            int serialNo = 1; // Initialize a counter for serial number
            for(Offer_scheme o:offerList)
            {	
            	Services s = o.getSr();
            %> 
            <tr>
            	<th scope="row" class="text-center"><input class="form-check-input" type="checkbox" id="flexCheckDefault" name="chkbkid" value="<%=o.getSchemeId()%>"></th>
                <td><%= serialNo++ %></td> <!-- Display and then increment the serial number -->
                <td><%= s.getService_name() %></td>
                <td><%= o.getServiceId()%></td>
                <td><%= s.getCharge()%></td>
                <td><%= o.getDiscount_offer()%></td>
                <td><%= o.getDate()%></td>
            </tr>
            <% } %>


		</tbody>
	</table>
</div>
</div>
<div class="container" style="margin-bottom: 5rem;">
<div class="d-grid gap-1"><button type="submit" class="btn btn-outline-primary btn-lg">Delete Offers</button></div>
</div>
	<!-- table creation ends-->
</form>	
	
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
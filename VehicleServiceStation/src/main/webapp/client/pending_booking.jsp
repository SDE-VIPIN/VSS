<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="vss.dao.*,vss.beans.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking Request Page</title>
<%@include file="/common/common_css.html"%>
<%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
</head>
<body >


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
		<!-- header ends here -->


	   <%
		ClientDao dao = new ClientDao();
	    ArrayList<BookingService>bookingList = dao.viewPendingBooking(clientId);
		%>

<div><h3 style="text-align: center; text-decoration: underline; margin-top: 0;">You have booked the services</h3></div>

<div class="outerDiv" style="margin: 2rem 3rem;">
<div class="table-responsive">	
	<table class="table table-striped table-hover table-bordered">
		<thead class="table-light">
			<tr>
				<th scope="col">S.No</th>
				<th scope="col">Service Center</th>
				<th scope="col">Owner</th>
				<th scope="col">Phone</th>
				<th scope="col">Address</th>
				<th scope="col">Service</th>
				<th scope="col">Charge</th>
				<th scope="col">Date</th>
				
			</tr>
		</thead>
		<tbody class="table-group-divider">

			<!-- it will created on run time that is dynamic -->
			<%
			int serialNo = 1; // Initialize a counter for serial number
    		for(BookingService bs : bookingList)
    		{ 
    	
    			Services s = bs.getServices();
    			Provider p = bs.getProvider();
    	
   			 %>
    		
			<tr>
				<td scope="row"><%= serialNo++ %></td>
				<th scope="row"><%=p.getCompany_name()%></th>
				<td><%=p.getOwner()%></td>
				<td><%=p.getPhone()%></td>
				<td><%=p.getAddress()%></td>
				<td><%=s.getService_name()%></td>
				<td><%=s.getCharge()%></td>
				<td><%=bs.getDate()%></td>
				
				
			</tr>
			<%} %>


		</tbody>
	</table>	
</div>
</div>

<!-- table creation ends-->


        <!-- footer starts here -->
        <%@include file="/common/common_footer.html"%>
        <!-- footer ends here -->

   <%}
		
		else{
			
			request.setAttribute("msg", "You are not authentic person, your role is not authorised to access this page.");
			RequestDispatcher rd = request.getRequestDispatcher("/client/client_login.jsp");
			rd.forward(request, response);
			
		}
	}
	%>


<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		type="text/javascript"></script>
	

</body>
</html>
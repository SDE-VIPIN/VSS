<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="vss.dao.*,vss.beans.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Picked Booking Page</title>
<%@include file="/common/common_css.html"%>
<%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
</head>
<body >


<%
	String provider_Id = (String) session.getAttribute("sessionKey");
	String role = (String) session.getAttribute("role");

	System.out.println(session.getId());

	if (provider_Id == null || session.isNew()) {
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
		<!-- header ends here -->

<%
ProviderDao dao = new ProviderDao();
ArrayList<BookingService>serviceList = dao.viewDroppededBooking(provider_Id);
%>

<div><h1 style="text-align: center; text-decoration: underline; margin: 10px;">List Of Vehicles Dropped Successfully</h1></div>

<div class="outerDiv" style="margin: 2rem 3rem;">
<div class="table-responsive">	
	<table class="table table-striped table-hover table-bordered">
		<thead class="table-light">
			<tr>
				<!-- <th scope="col">Dropped</th> -->
				<th scope="col">S.No</th>
				<th scope="col">Employee</th>
				<th scope="col">Customer</th>
				<th scope="col">Email</th>
				<th scope="col">Phone</th>
				<th scope="col">Address</th>
				<th scope="col">City</th>
				<th scope="col">Date</th>
				<th scope="col">Service</th>
				<th scope="col">Charge</th>
				
				
			</tr>
		</thead>
		<tbody class="table-group-divider">

			<!-- it will created on run time that is dynamic -->
			<%
			int serialNo = 1; // Initialize a counter for serial number
    for(BookingService bs : serviceList)
    { 
    	Services s = bs.getServices();
    	Client c = bs.getClient();
    	Employees e = bs.getEmployees();
    %>
    		
			<tr>
				<td><%= serialNo++ %></td>
        		<th scope="row"><%=e.getEmp_name()%></th>
				<th scope="row"><%=c.getName()%></th>
				<td><%=c.getEmail()%></td>
				<td><%=c.getPhone()%></td>
				<td><%=c.getAddress()%></td>
				<td><%=c.getCity()%></td>
				<td><%=bs.getDate()%></td>
				<td><%=s.getService_name()%></td>
				<td><%=s.getCharge()%></td>
				
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

    <%
        } else {
            request.setAttribute("msg", "You are not an authorized person. Your role is not authorized to access this page.");
            RequestDispatcher rd = request.getRequestDispatcher("/provider/provider_login.jsp");
            rd.forward(request, response);
        }
    }
%>


<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		type="text/javascript"></script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="vss.beans.*,vss.dao.*,vss.utils.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking Response page</title>
<%@include file="/common/common_css.html" %>
</head>
<body style="background-color: #D8A7B1">

<%@include file="/client/client_header.html" %>

<%
	String clientId = (String) session.getAttribute("sessionKey");
	String role = (String) session.getAttribute("role");

	
	ClientDao dao = new ClientDao();
	ArrayList<BookingService>responseList = dao.viewConfirmBooking(clientId);
	
	if (clientId == null || session.isNew()) {
		request.setAttribute("msg", "Unathorised access, please do login first");
		RequestDispatcher rd = request.getRequestDispatcher("/client/client_login.jsp");
		rd.forward(request, response);
	}
	else {
		if(role.equals("client")) // equals method is case sensitive so spelling should be correct as admin
		{
			float totalCharge = 0;
%>


<input type="hidden" name="pid" value="<%=clientId%>">
<div class="outerDiv">
<div class="container" >
<div class="row">
 <%
                for (BookingService bs : responseList) {
                    // Accumulate the charge for each booking service
                    totalCharge += bs.getServices().getCharge();
            %>
<div class="col-4 my-4 d-flex justify-content-center">

<div class="card border border-warning shadow-0 mb-3" style="width: 20rem;">
  <div class="card-body">
    <p class="card-text">You have booked the service: <%=bs.getServices().getService_name()%></p>
    <p class="card-text">Status: <%=bs.getBooking_status()%></p>
    <p class="card-text">Response: <%=bs.getProvider_response()%></p>
    <p class="card-text">Employee: <%=bs.getEmployees().getEmp_name()%></p>
    <p class="card-text">Phone: <%=bs.getEmployees().getPhone()%></p>
    <p class="card-text">Charge: <%=bs.getServices().getCharge()%></p>
  </div>
</div>
</div>
<%} %>
</div>
</div>
</div>

<div><h3 style="text-align: center; text-decoration: underline; margin-top: 0;">You have to pay : <%= totalCharge %> </h3></div>


<%
	}
	
	else{
		
		request.setAttribute("msg", "You are not authentic person, your role is not authorised to access this page.");
		RequestDispatcher rd = request.getRequestDispatcher("/client/client_login.jsp");
		rd.forward(request, response);
		
	}
	}
	%>
<%-- <%@include file="/common/common_footer.html"%> --%>
<!-- footer starts here -->

	<div class="text-center p-3"
		style="background-color: #561c24; color: #ffffff;">
		© 2024 Copyright: All rights reserved by <a style="color: #ffffff;"
			href="#">VSS</a></div>

<!-- footer ends here -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
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
<body>

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

	
	<!-- header srarts here -->
	<%@include file="/admin/admin_header.html"%>
	<!-- footer ends here -->
	
	
	<div><h1 style="text-align: center; text-decoration: underline; margin: 10px;">Offers Added By Provider</h1></div>
	
	<%
	AdminDao dao = new AdminDao();
	ArrayList<Offer_scheme>offerList = dao.viewOffer();
	%>
	
	
	<!-- table creation -->
<div class="outerDiv" style="margin: 2rem 5rem;">
<div class="table-responsive">
	<table class="table table-striped table-hover table-bordered">
		<thead class="table-light" >
			<tr>
				<th scope="col">S.No</th>
				<th scope="col">Provider</th>
				<th scope="col">Provider Id</th>
				<th scope="col">Service</th>
				<th scope="col">Charge</th>
				<th scope="col">Offer</th>
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
            	Provider p = o.getProvider();
            %> 
            <tr>
                <td><%= serialNo++ %></td> <!-- Display and then increment the serial number -->
                <td><%= p.getOwner()%></td>
                <td><%= p.getProvider_id()%></td>
                <td><%= s.getService_name() %></td>
                <td><%= s.getCharge()%></td>
                <td><%= o.getDiscount_offer()%></td>
                <td><%= o.getDate()%></td>
            </tr>
            <% } %>


		</tbody>
	</table>
</div>
</div>
	<!-- table creation ends-->
	
	
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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="vss.dao.*,vss.beans.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Plan</title>
<link rel="icon" href="/VehicleServiceStation/images/favicon.png">
<%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%@include file="/common/common_css.html"%>
</head>
<body style="background-color: #E8D8C4">

<!-- header srarts here -->
	<%@include file="/admin/admin_header.html"%>
<!-- header ends here -->

 <!-- feedback message servlet to jsp page starts here -->
 
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

	
 <!-- feedback message servlet to jsp page ends here -->
 
 <div><h1 style="text-align: center; text-decoration: underline; margin: 10px;">Posted Plans</h1></div>

<%
AdminDao dao = new AdminDao(); //dao class object
ArrayList<Plan>planList = dao.viewPlan();
%>

<!-- <form method="post" action="/VehicleServiceStation/Delete_Plan" class="needs-validation" novalidate> -->	
	<!-- table creation -->
<div class="outerDiv" style="margin: 2rem 5rem;">
<div class="table-responsive">
	<table class="table table-striped table-hover table-bordered">
		<thead class="table-light" >
			<tr>
				<!-- <th scope="col">Delete</th> -->
				<th scope="col">S.No</th>
				<th scope="col">Plan</th>
				<th scope="col">Description</th>
				<th scope="col">Charge</th>
				<th scope="col">Date</th>
			</tr>
		</thead>
		<tbody class="table-group-divider">

			<!-- it will created on run time that is dynamic -->		
            <% 
            int serialNo = 1; // Initialize a counter for serial number
            for(Plan p : planList)
            {	
            %> 
            <tr>
            	<%-- <th scope="row" class="text-center"><input class="form-check-input" type="checkbox" id="flexCheckDefault" name="chkbkid" value="<%=o.getPlan_name()%>"></th> --%>
                <td><%= serialNo++ %></td> <!-- Display and then increment the serial number -->
                <td><%= p.getPlan_name()%></td>
                <td><%= p.getDuration()%></td>
                <td><%= p.getCharge()%></td>
                <td><%= p.getDate()%></td>
            </tr>
            <% } %>


		</tbody>
	</table>
</div>
</div>
	<!-- table creation ends-->
<!-- </form> -->	
 
 
 
 <!-- footer srarts here -->
	 <div class="footer-container fixed-bottom">
        <%@include file="/admin/admin_footer.html"%>
    </div>
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
		
<script src="/VehicleServiceStation/common/service.js"></script>

</body>
</html>
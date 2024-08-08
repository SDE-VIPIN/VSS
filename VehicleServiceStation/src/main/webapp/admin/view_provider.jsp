<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="vss.dao.*,java.util.*,vss.beans.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Providers</title>

<%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>

<%@include file="/common/common_css.html" %>


</head>
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

<div><h1 style="text-align: center; text-decoration: underline; margin: 10px;">Service Providers</h1></div>

<%
AdminDao dao = new AdminDao(); //dao class object
ArrayList<Provider>providerList = dao.viewProvider();
%>

	<!-- table creation -->
	
	<!-- provider_id, provider_password, company_name, phone, owner, email, city, address, about, date -->
	
<div class="outerDiv" style="margin: 2rem 3rem;">
<div class="table-responsive">	
	<table class="table table-striped table-hover table-bordered">
		<thead class="table-light">
			<tr>
				<th scope="col">Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Password</th>
				<th scope="col">Company</th>
				<th scope="col">CIN No.</th>
				<th scope="col">Phone</th>
				<th scope="col">City</th>
				<th scope="col">Address</th>
				<th scope="col">About</th>
				<th scope="col">Date</th>
			</tr>
		</thead>
		<tbody class="table-group-divider">

			<!-- it will created on run time that is dynamic -->
			<%
    
    for(Provider p : providerList)
    {
    	
    
    
    %>
			<tr>
				<td scope="row"><%=p.getProvider_id()%></td>
				<td><%=p.getOwner()%></td>
				<td><%=p.getEmail()%></td>
				<td><%=p.getProvider_password()%></td>
				<td><%=p.getCompany_name()%></td>
				<th><%=p.getRegistration_no()%></th>
				<td><%=p.getPhone()%></td>
				<td><%=p.getCity()%></td>
				<td><%=p.getAddress()%></td>
				<td><%=p.getAbout()%></td>
				<td><%=p.getDate()%></td>
			</tr>
			<%} %>


		</tbody>
	</table>
</div>
</div>
	<!-- table creation ends-->


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
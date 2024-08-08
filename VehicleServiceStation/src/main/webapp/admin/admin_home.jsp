<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="vss.dao.*,java.util.*,vss.beans.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Home</title>
<%@include file="/common/common_css.html"%>

<%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>


</head>
<body style="background-color:#e88d96;">

	<%
	String adminId = (String) session.getAttribute("sessionKey");
	String role = (String) session.getAttribute("role");

	System.out.println(session.getId());

	if (adminId == null || session.isNew()) {
		
		// for authorization
		request.setAttribute("msg", "Unathorised access, please do login first");
		RequestDispatcher rd = request.getRequestDispatcher("/admin/admin_login.jsp");
		rd.forward(request, response);
	}

	else {
		// for authentication
		if(role.equals("admin")) // equals method is case sensitive so spelling should be correct as admin
				{
	%>

	<%@include file="/admin/admin_header.html"%>
	
	<%
AdminDao dao = new AdminDao(); //dao class object
ArrayList<Provider>providerList = dao.viewProvider();
System.out.println("provider size "+providerList.size());
ArrayList<Client>clientList = dao.viewClients();
ArrayList<Feedbacks>feedbackList = dao.viewFeedbacks();
ArrayList<Contacts>contactList = dao.viewContacts();
%>

	<%-- <div class="container-fluid">
		<h2>
			Hello
			<%=adminId%>
			you are
			<%=role%></h2>
	</div> --%>


<!-- Provider section starts -->
<div><h5 style="text-align: center; margin: 15px 0 8px 0; text-decoration: underline;">Registered Provider</h5></div>
	<section  style=" padding-left:5vw; padding-right:5vw;">
	
<div class="outerDiv" style="margin: 2rem 3rem; max-height: 50vh; overflow-y: auto; ">
<div class="table-responsive">	
	<table class="table table-striped table-hover table-bordered">
		<thead class="table-light" >
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
</section>
	<!-- table creation ends-->
<!-- Provider section ends -->


<!-- User section starts -->
<div><h5 style="text-align: center; margin: 15px 0 8px 0; text-decoration: underline;">Registered User</h5></div>
	<section  style=" padding-left:5vw; padding-right:5vw;">
	
<div class="outerDiv" style="margin: 2rem 3rem; max-height: 50vh; overflow-y: auto; ">
<div class="table-responsive">	
	<table class="table table-striped table-hover table-bordered">
	<thead class="table-light" >
			<tr>
				<th scope="col">Id</th>
				<th scope="col">Password</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Phone</th>
				<th scope="col">City</th>
				<th scope="col">Address</th>
				<th scope="col">Date</th>
			</tr>
		</thead>
		<tbody class="table-group-divider">

			<!-- it will created on run time that is dynamic -->
			<%
    
    for(Client c: clientList)
    {
    	
    
    
    %>
			<tr>
				<td scope="row"><%=c.getClient_id()%></td>
				<td scope="row"><%=c.getClient_pass()%></td>
				<td><%=c.getName()%></td>
				<td><%=c.getEmail()%></td>
				<td><%=c.getPhone()%></td>
				<td><%=c.getCity()%></td>
				<td><%=c.getAddress()%></td>
				<td><%=c.getDate()%></td>
			</tr>
			<%} %>


		</tbody>
	
	</table>
	</div>
</div>
</section>
<!-- User section ends -->

<!-- Recent Query section starts -->
<div><h5 style="text-align: center; margin: 15px 0 8px 0; text-decoration: underline;">User Query</h5></div>
	<section  style=" padding-left:5vw; padding-right:5vw;">
	
<div class="outerDiv" style="margin: 2rem 3rem; max-height: 50vh; overflow-y: auto; ">
<div class="table-responsive">	
	<table class="table table-striped table-hover table-bordered">
	
	<thead class="table-light">
			<tr>
				<!-- <th scope="col">Id</th> -->
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Phone</th>
				<th scope="col">Question</th>
				<th scope="col">Date</th>
			</tr>
		</thead>
		<tbody class="table-group-divider">

			<!-- it will created on run time that is dynamic -->
			<%
    
    for(Contacts c: contactList)
    {
    	
    
    
    %>
			<tr>
				<%-- <th scope="row"><%=c.getContact_id()%></th> --%>
				<td><%=c.getUser_name()%></td>
				<td><%=c.getUser_email()%></td>
				<td><%=c.getUser_phone()%></td>
				<td><%=c.getUser_question()%></td>
				<td><%=c.getDate()%></td>
			</tr>
			<%} %>


		</tbody>
	
	</table>
	</div>
</div>
</section>
<!-- Recent Query section ends -->

<!-- Feedback section starts -->
<div><h5 style="text-align: center; margin: 15px 0 8px 0; text-decoration: underline;">User Feedback</h5></div>
	<section  style=" padding-left:5vw; padding-right:5vw;">
	
<div class="outerDiv" style="margin: 2rem 3rem; max-height: 50vh; overflow-y: auto; ">
<div class="table-responsive">	
	<table class="table table-striped table-hover table-bordered">
		<thead class="table-light">
			<tr>
				<!-- <th scope="col">Id</th> -->
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Remark</th>
				<th scope="col">Rating</th>
				<th scope="col">Date</th>
			</tr>
		</thead>
		<tbody class="table-group-divider">

			<!-- it will created on run time that is dynamic -->
			<%   
    for(Feedbacks f: feedbackList)
    {
    %>
			<tr>
				<%-- <th scope="row"><%=f.getFeedback_id()%></th> --%>
				<td><%=f.getName()%></td>
				<td><%=f.getEmail()%></td>
				<td><%=f.getRemarks()%></td>
				<td><%=f.getRating()%></td>
				<td><%=f.getDate()%></td>
			</tr>
			<%} %>
		</tbody>	
	</table>
	</div>
</div>
</section>
<!-- Feedback section ends -->

	<%@include file="/common/common_footer.html"%>
	<%}
		
		else{
			
			request.setAttribute("msg", "You are not authentic person, your role is not authorised to access this page.");
			RequestDispatcher rd = request.getRequestDispatcher("/admin/admin_login.jsp");
			rd.forward(request, response);
			
		}
	}
	%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
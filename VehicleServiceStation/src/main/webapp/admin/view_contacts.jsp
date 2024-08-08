<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="vss.dao.*,java.util.*,vss.beans.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Contacts</title>

<%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>

<%@include file="/common/common_css.html"%>


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

	

	<%@include file="/admin/admin_header.html"%>

	<div><h1 style="text-align: center; text-decoration: underline; margin: 10px;">Contacts</h1></div>

<%
AdminDao dao = new AdminDao(); //dao class object
ArrayList<Contacts>contactList = dao.viewContacts();
%>

	<!-- table creation -->
<div class="outerDiv" style="margin: 2rem 5rem;">
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
	<!-- table creation ends-->




	<%@include file="/admin/admin_footer.html"%>
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
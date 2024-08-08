<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="vss.dao.*,vss.beans.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Provider List</title>
<%@include file="/common/common_css.html" %>
</head>
<body style="background-color: #D8A7B1">
<%@include file="/client/client_header.html" %>

<% String cname = request.getParameter("city");
	UserDao dao = new UserDao();
	ArrayList<Provider>pList = dao.searchProvider(cname);

    if(pList.size()>0){
	%>	
	
	<!-- table creation -->
	
	<!-- provider_id, provider_password, company_name, phone, owner, email, city, address, about, date -->
	
<div class="outerDiv" style="margin: 2rem 3rem;">
<div class="table-responsive">	
	<table class="table table-striped table-hover table-bordered">
		<thead class="table-light">
			<tr>
				
				<th scope="col">Company</th>
				<th scope="col">Owner</th>
				<th scope="col">Email</th>
				<th scope="col">Phone</th>
				<th scope="col">City</th>
				<th scope="col">Address</th>
				<th scope="col">About</th>
				
			</tr>
		</thead>
		<tbody class="table-group-divider">

			<!-- it will created on run time that is dynamic -->
			<%
    
    for(Provider p : pList)
    { 
    %>
			<tr>
				<th scope="row"><a href="/VehicleServiceStation/commonjsp/view_services.jsp?pid=<%=p.getProvider_id()%>"><%=p.getCompany_name()%></a></th>
				<td scope="row"><%=p.getOwner()%></td>
				<td><%=p.getEmail()%></td>
				<td><%=p.getPhone()%></td>
				<td><%=p.getCity()%></td>
				<td><%=p.getAddress()%></td>
				<td><%=p.getAbout()%></td>
			</tr>
			<%} %>


		</tbody>
	</table>	
</div>
</div>
	<!-- table creation ends-->
<% 
    } else { 
%>
    <div>No provider found</div>
<% 
    } 
%>	


<!-- footer srarts here -->
	<footer class="bg-body-tertiary text-center fixed-bottom">
	<div class="text-center p-3" style="background-color:  #561C24; color: white;">
      &#169;2024:All rights reserved by
      <a class="text-white" href="/VehicleServiceStation/commonjsp/index.jsp">VSS</a>
    </div>
	</footer>

	<!-- footer ends here -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
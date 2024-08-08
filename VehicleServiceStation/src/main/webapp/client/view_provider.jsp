<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="vss.dao.*,vss.beans.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Providers Page</title>
<%@include file="/common/common_css.html" %>
</head>
<body style="background-color: #D8A7B1">

<%@include file="/client/client_header.html" %>
<h4 style="text-align: center; margin-top: 8px;">Our Providers</h4>

<%
UserDao dao = new UserDao();
ArrayList<Provider>providerList = dao.viewProvider();
%>

<div class="outerDiv">
<div class="container" >
<div class="row">

<%
for(Provider p:providerList){		
%>
<div class="col-4 my-4 d-flex justify-content-center">

<div class="card border border-warning shadow-0 mb-3" style="width: 18rem;">
  <div class="card-header"><%=p.getCompany_name()%></div>
  <div class="card-body">

    <h5 class="card-title">Owner: <%=p.getOwner()%></h5>
    <p class="card-text">Email: <%=p.getEmail()%></p>
    <p class="card-text">Phone: <%=p.getPhone()%></p>
    <p class="card-text">City: <%=p.getCity()%></p>
    <p class="card-text">Address: <%=p.getAddress()%></p>
    <p class="card-text">About: <%=p.getAbout()%></p>
    <a href="/VehicleServiceStation/client/view_services.jsp?pid=<%= p.getProvider_id() %>&companyName=<%= p.getCompany_name() %>&Owner=<%= p.getOwner() %>">view services</a>
  </div>
</div>
</div>
<%}%>
</div>
</div>
</div>


<%@include file="/common/common_footer.html" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
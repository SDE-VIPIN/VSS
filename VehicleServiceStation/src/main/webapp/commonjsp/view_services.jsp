<%-- <%@page import="vss.beans.Services"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vss.dao.UserDao"%> --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="vss.beans.*,vss.dao.*,vss.utils.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Service page</title>
<%@include file="/common/common_css.html" %>
</head>
<body style="background-color:#ffc0cb;">

<%@include file="/common/common_header.html" %>

<%-- <marquee direction="left" style="margin-top: 8px;" behavior="alternate" bgcolor="pink" scrollamount="10" onMouseOver="this.stop()" onMouseOut="this.start()"><h4><%=request.getParameter("companyName")%></h4></marquee>
 --%>
<%--  <h4 style="margin-top: 8px; text-align:center;"><%=request.getParameter("companyName")%></h4> --%>
<%
	String provider_id = request.getParameter("pid");
	UserDao dao = new UserDao();
	ArrayList<Services>serviceList = dao.viewServices(provider_id);
%>

<div class="outerDiv">
<div class="container" >
<div class="row">
<%
for(Services s:serviceList)
{		
%>
<div class="col-4 my-4 d-flex justify-content-center">

<div class="card border border-warning shadow-0 mb-3" style="width: 18rem;">
  <div class="card-body">
   <h5 class="card-title">Service: <%=s.getService_name()%></h5>
    <p class="card-text">Charge: <%=s.getCharge()%></p>
    <p class="card-text">Description: <%=s.getDescription()%></p>
    <a href ="/VehicleServiceStation/commonjsp/view_offers.jsp?sid=<%=s.getService_id()%>&companyName=<%= request.getParameter("companyName") %>">offer</a>   
  </div>
</div>
</div>
<%} %>
</div>
</div>
</div>

<%-- <%@include file="/common/common_footer.html"%> --%>
<!-- footer starts here -->

	<div class="text-center p-3 fixed-bottom"
		style="background-color: #561c24; color: #ffffff;">
		© 2024 Copyright: All rights reserved by <a style="color: #ffffff;"
			href="#">VSS</a></div>

<!-- footer ends here -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
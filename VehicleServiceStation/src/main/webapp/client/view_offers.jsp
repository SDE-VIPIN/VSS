<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="vss.dao.*,vss.beans.*,vss.utils.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Offer Page</title>
<%@include file="/common/common_css.html" %>
</head>
<body style="background-color: #D8A7B1">

<%@include file="/common/common_header.html" %>

<marquee direction="left" behavior="alternate" bgcolor="pink">
    <h4><%=request.getParameter("companyName")%></h4>
</marquee>
<%
	String service_id = request.getParameter("sid");
	UserDao dao = new UserDao();
	ArrayList<Offer_scheme>offerList = dao.viewOffer(service_id);
%>
<div class="outerDiv" style="margin-bottom: 85px;">
<div class="container my-3" >
<div class="row">
<%
for(Offer_scheme os:offerList)
{		
%>
<div class="col-4 my-4 d-flex justify-content-center">

<div class="card border border-warning shadow-0 mb-3" style="width: 18rem;">
  <div class="card-body">
   <h5 class="card-title">Service  : <%=os.getSr().getService_name()%></h5>
    <p class="card-text">Charge : <%=os.getSr().getCharge()%></p>
    <p class="card-text">Discount: <%=os.getDiscount_offer()%></p>
    
  </div>
</div>
</div>
<%} %>
</div>
</div>
</div>

<%-- <%@include file="/common/common_footer.html" %> --%>
<!-- footer starts here -->

	<div class="text-center p-3 fixed-bottom"
		style="background-color: #561c24; color: #ffffff;">
		© 2024 Copyright: All rights reserved by <a style="color: #ffffff;"
			href="#">VSS</a></div>

<!-- footer ends here -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
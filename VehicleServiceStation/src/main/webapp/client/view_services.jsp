<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="vss.beans.*,vss.dao.*,vss.utils.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Service page</title>
<%@include file="/common/common_css.html" %>

<script>

function checkService()
{
var chk=document.getElementsByName("services")	
console.log(chk)



var flag=0
for(var i=0;i<chk.length;i++)
	{
	
	
		if(chk[i].checked)
			{
			flag=1
			break
			}
	}
	
	if(flag==0)
		{
		alert("please select a service first")
		return false
		}
		
	return true

}

</script>
</head>
<body style="background-color: #D8A7B1">

<%@include file="/client/client_header.html" %>
<!-- feedback message servlet to jsp page starts here -->
 
 <%
	String message = (String)request.getAttribute("msg");
%>
 
 <% 
if(message != null){
	
%>

<div class="alert alert-danger alert-dismissible fade show" role="alert">
  <strong><%= message %></strong>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>

<%} %>
 
 <!-- feedback message servlet to jsp page ends here -->

<%-- <marquee direction="left" style="margin-top: 8px;" behavior="alternate" bgcolor="pink" scrollamount="10" onMouseOver="this.stop()" onMouseOut="this.start()"><h4><%=request.getParameter("companyName")%></h4></marquee> --%>
<%-- <div class="container text-center mt-3"><h4><%=request.getParameter("companyName")%></h4></div> --%>
<%
	String provider_id = request.getParameter("pid");
	UserDao dao = new UserDao();
	ArrayList<Services>serviceList = dao.viewServices(provider_id);
%>

<div class="container-fluid px-4 mb-4">
<div class="row gx-0">
<div class="col-9">
<form action="/VehicleServiceStation/BookServices" method="post" onsubmit="return checkService()">
<input type="hidden" name="pid" value="<%=provider_id%>">
<div class="outerDiv">

<%
for(Services s:serviceList)
{		
%>


<div class="my-4 mx-3" style="display: inline-flex; flex-wrap: wrap;">

<div class="card border border-warning shadow-0" style="width: 32rem; height: 12rem;">
  <div class="card-body">
   <h5 class="card-title">Service: <%=s.getService_name()%></h5>
    <p class="card-text">Charge: <%=s.getCharge()%></p>
    <p class="card-text">Description: <%=s.getDescription()%></p>
    <a href ="/VehicleServiceStation/client/view_offers.jsp?sid=<%=s.getService_id()%>&companyName=<%= request.getParameter("companyName") %>">offer</a>   
  	<p class="card-text"><input type="checkbox" value="<%=s.getService_id()%>" name="services"></p>
  </div>
</div>
</div>
<%} %>
</div>

<div class="d-flex justify-content-center position-fixed" style="bottom: 5vw; width: 70%;">
                    <button type="submit" class="btn btn-primary btn-block" style="width: 50%;">
                        Book Service
                    </button>
                </div>
</form>
</div>

<div class="col-3">
<div class="payment sticky-top" Style=" padding:20px 15px;justify-content: center;
border-radius: 18px;
background: #ffffff;
box-shadow:  10px 10px 22px #828282,
             -10px -10px 22px #ffffff;">
<div class="container text-center"><p>Please scan the QR Code to pay or you can pay later</p></div>
<div style="padding: 0 20px;"><img src="/VehicleServiceStation/images/payment.jpg" style="max-width: 100%; height: auto;"></div>
<div class="container p-3 w-8 text-center"><button>Scan me</button></div>
</div>
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
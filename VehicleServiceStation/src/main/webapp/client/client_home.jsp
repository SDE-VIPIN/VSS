<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="vss.dao.*,vss.beans.*,vss.utils.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Client Home</title>
<%@include file="/common/common_css.html"%>
<%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>


<style type="text/css">
.card{

}
.scrl::-webkit-scrollbar{
display:none;

}
.dc{

.card{
transition: all 0.3s;
&:hover{
transform: translateY(-3%);
box-shadow:5px 5px 20px grey;
}
width:420px !important;
}
	height:450px;
	overflow:auto;
}

</style>
</head>
<body class="scrl" style="background-color: #D8A7B1">

<%
	String clientId = (String) session.getAttribute("sessionKey");
	String role = (String) session.getAttribute("role");

	System.out.println(session.getId());

	if (clientId == null || session.isNew()) {
		request.setAttribute("msg", "Unathorised access, please do login first");
		RequestDispatcher rd = request.getRequestDispatcher("/client/client_login.jsp");
		rd.forward(request, response);
	}

	else {
		if(role.equals("client")) // equals method is case sensitive so spelling should be correct as admin
		{
	%>
<%

ClientDao dao = new ClientDao();
Client clt = dao.viewProfile(clientId);

%>
<%
UserDao daos = new UserDao();
ArrayList<Provider>providerList = daos.viewProvider();
%>
		<!-- header srarts here -->
		<%@include file="/client/client_header.html"%>
		<!-- footer ends here -->

	<%-- <div class="container-fluid">
		<h2>
			Hello
			<%=clientId%>
			you are
			<%=role%></h2>
	</div> --%>
	
	
	<section class="mt-2" style=" border-radius: 20px;">
  <div class="container ">
    <div class="row">
      <div class="col-lg-4">
        <div class="card mt-4">
          <div class="card-body text-center mt-4">
            <img src="/VehicleServiceStation/images/profile.png" alt="avatar" class="rounded-circle img-fluid" style="width: 150px;">
            <h5 class="my-3"><%=clt.getName()%></h5>
            <p class="text-muted mb-4"><%=clt.getAddress()%></p>
            <div class="d-flex justify-content-center py-2">
              <a href="/VehicleServiceStation/client/client_edit_profile.jsp"><i class="far fa-edit mb-5"></i></a>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-8">
        <div class="card mt-4">
          <div class="card-body">
            <div class="row">
              <h5 style="text-align: center; margin: 5px 0 8px 0; text-decoration: underline;">Personal Information</h5>
              <div class="col-sm-3">
                <p class="mb-0 mt-4">Full Name</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0 mt-4"><%=clt.getName()%></p>
              </div>
            </div>
            <hr>
            <div class="row"> 
              <div class="col-sm-3">
                <p class="mb-0">Email</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=clt.getEmail()%></p>
              </div>
            </div>
            <hr>
            
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Password</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0 password-dot"><% 
                String password = clt.getClient_pass();
                String maskedPassword = password.replaceAll(".", "*"); // Replace each character with a dot or asterisk
                out.print(maskedPassword);
            %>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Phone</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=clt.getPhone()%></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">City</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=clt.getCity()%></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Address</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=clt.getAddress()%></p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>






<!-- BSookings -->
        <div class="container-fluid " ><h3 style="text-align: center; text-decoration: underline; margin: 20px 15px;">Available Provider</h3></div>

 
 
 
 <section class="mt-4">
  <div class="container ">
    <div class="row">
      <div class="col-lg-4" >
        
        <div class="provider-cards" style="height: 450px; display: inline-flex; flex-wrap: wrap; justify-content: flex-start; overflow-y: scroll;">
                    <% for (Provider p : providerList) { %>
                    <div class="card mx-1 border border-warning shadow-0 mb-3" style="width: 440px;">
                        <div class="card-header"><%= p.getCompany_name() %></div>
                        <div class="card-body">
                            <h5 class="card-title">Owner: <%= p.getOwner() %></h5>
                            <p class="card-text">Email: <%= p.getEmail() %></p>
                            <p class="card-text">Phone: <%= p.getPhone() %></p>
                            <p class="card-text">City: <%= p.getCity() %></p>
                            <p class="card-text">Address: <%= p.getAddress() %></p>
                            <p class="card-text">About: <%= p.getAbout() %></p>
                            <a href="/VehicleServiceStation/client/view_services.jsp?pid=<%= p.getProvider_id() %>&companyName=<%= p.getCompany_name() %>&Owner=<%= p.getOwner() %>">view services</a>
                        </div>
                    </div>
                    <% } %>
        </div>
        
      </div>
      <div class="col-lg-8 ml-2">
        
        <div class="map-container" style="margin-left: 2vw;">
            <div style="width: 100%;">
                <iframe width="100%" height="450" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?width=100%25&amp;height=600&amp;hl=en&amp;q=BBD%20university+(VSS)&amp;t=&amp;z=14&amp;ie=UTF8&amp;iwloc=B&amp;output=embed">
                </iframe>
            </div>
        </div>
        
      </div>
    </div>
  </div>
</section>


<%-- <section style=" padding-left:5vw; padding-right:5vw;">

<h4 style="text-align: center; margin: 5vh 0 5vh 0;">Available Provider</h4>



<div class="dc scrl py-3 mx-5">



<div style="display:inline-flex;margin: 0 auto;">
<%
for(Provider p:providerList){		
%>

<div class="card mx-1 border border-warning shadow-0 mb-3" style="width: 18rem;">
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
<%}%>
</div>
</div>

</section>



<section class="mb-5" style=" padding-left:8vw; padding-right:8vw;">
<div style="width: 100%"><iframe width="100%" height="600" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?width=100%25&amp;height=600&amp;hl=en&amp;q=BBD%20university+(VSS)&amp;t=&amp;z=14&amp;ie=UTF8&amp;iwloc=B&amp;output=embed"><a href="https://www.gps.ie/">gps systems</a></iframe></div>
</section> --%>


<%	
	ClientDao daoq = new ClientDao();
	ArrayList<BookingService>responseList = daoq.viewConfirmBooking(clientId);
%>

<section style=" padding-left:5vw; padding-right:5vw;">
<input type="hidden" name="pid" value="<%=clientId%>">
<div><h3 style="text-align: center; text-decoration: underline; margin-top: 20px;">Services You Have Taken </h3></div>
<div class="dc scrl mx-5" style="height:300px;">
<div style="display:inline-flex;margin: 0 auto;">
<input type="hidden" name="pid" value="<%=clientId%>">
 <%
                for (BookingService bs : responseList) {
            %>

<div class="card mx-1 mt-3 border border-warning shadow-0 mb-3" style="width: 20rem;">
  <div class="card-body">
    <p class="card-text">You have booked the service: <%=bs.getServices().getService_name()%></p>
    <p class="card-text">Status: <%=bs.getBooking_status()%></p>
    <p class="card-text">Response: <%=bs.getProvider_response()%></p>
    <p class="card-text">Employee: <%=bs.getEmployees().getEmp_name()%></p>
    <p class="card-text">Phone: <%=bs.getEmployees().getPhone()%></p>
    <p class="card-text">Charge: <%=bs.getServices().getCharge()%></p>
  </div>
</div>
<%} %>
</div>
</div>

</section>



<section  style=" padding-left:5vw; padding-right:5vw;">
 <%
		ClientDao daom = new ClientDao();
	    ArrayList<BookingService>bookingList = daom.viewPendingBooking(clientId);
		%>

<div><h3 style="text-align: center; text-decoration: underline; margin-top: 0;">Services Booked By you</h3></div>

<div class="outerDiv" style="margin: 2rem 3rem; height: 50vh; overflow-Y:scroll ">
<div class="table-responsive">	
	<table class="table table-striped table-hover table-bordered">
		<thead class="table-light">
			<tr>
				<th scope="col">S.No</th>
				<th scope="col">Service Center</th>
				<th scope="col">Owner</th>
				<th scope="col">Phone</th>
				<th scope="col">Address</th>
				<th scope="col">Service</th>
				<th scope="col">Charge</th>
				<th scope="col">Date</th>
				
			</tr>
		</thead>
		<tbody class="table-group-divider">

			<!-- it will created on run time that is dynamic -->
			<%
			int serialNo = 1; // Initialize a counter for serial number
    		for(BookingService bs : bookingList)
    		{ 
    	
    			Services s = bs.getServices();
    			Provider p = bs.getProvider();
    	
   			 %>
    		
			<tr>
				<td scope="row"><%= serialNo++ %></td>
				<td scope="row"><%=p.getCompany_name()%></td>
				<td><%=p.getOwner()%></td>
				<td><%=p.getPhone()%></td>
				<td><%=p.getAddress()%></td>
				<td><%=s.getService_name()%></td>
				<td><%=s.getCharge()%></td>
				<td><%=bs.getDate()%></td>
				
				
			</tr>
			<%} %>


		</tbody>
	</table>	
</div>
</div>

</section>


		<!-- footer srarts here -->
		<%@include file="/common/common_footer.html"%>
		<!-- footer ends here -->
		
	<%
	}
	
	else{
		
		request.setAttribute("msg", "You are not authentic person, your role is not authorised to access this page.");
		RequestDispatcher rd = request.getRequestDispatcher("/client/client_login.jsp");
		rd.forward(request, response);
		
	}
	}
	%>
	
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		type="text/javascript"></script>

</body>
</html>
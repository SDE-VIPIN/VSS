<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="vss.dao.*,vss.beans.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Plan</title>
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
 
 <!-- form starts here -->
 
<div class="container" >
    <div class="row justify-content-center mt-5">
      <div class="col-md-6 p-5" style="width: 50rem;">
        <form class="p-4 needs-validation" method="post" action="/VehicleServiceStation/Add_Plan" style="border-radius: 5px ; box-shadow: 0 0 10px rgba(0, 0, 0, 0.9);">
        <div><h3 style="text-align: center; text-decoration: underline; margin-top: 0;">Plan Detail</h3></div>
          <div class="form-group mb-3">
            <label for="formGroupExampleInput" class="form-label fw-medium">Plan Name</label>
            <input type="text" class="form-control" name="plan_name" style="border: 0.5px solid black;" id="formGroupExampleInput" placeholder=" " required>
          </div>
          
          <div class="form-group mb-3">
            <label for="description" class="form-label fw-medium">Description</label>
            <textarea class="form-control" name="description"id="description" rows="3" style="border: 0.5px solid black;" placeholder="Abc......" required></textarea>
          </div>
          
          <div class="form-group mb-3">
            <label for="formGroupExampleInput" class="form-label fw-medium">Charge</label>
            <input type="number" name="charge" min="0" value="0" step="0.01" class="form-control" id="charge" style="border: 0.5px solid black;" placeholder="Enter charge" required>
          </div>
          
          <div class="d-flex justify-content-center">
            <button type="button" class="btn btn-primary" style="margin-right: 10px;">Reset</button>
            <button type="submit" class="btn btn-primary">Submit</button>
          </div>
          
        
 
        </form>
      </div>
    </div>
  </div>
  
<!-- form ends here -->
 
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
<script src="/VehicleServiceStation/common/validation.js"></script>

</body>
</html>
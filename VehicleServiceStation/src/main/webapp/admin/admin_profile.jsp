<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="vss.dao.*,vss.beans.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Profile</title>

<%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>

<%@include file="/common/common_css.html"%>


</head>
<body>

	<%
	String adminId = (String) session.getAttribute("sessionKey");
	System.out.print("admin profile"+adminId);
	String role = (String) session.getAttribute("role");

	System.out.println(session.getId());

	if (adminId == null || session.isNew()) {
		request.setAttribute("msg", "Unathorised access, please do login first");
		RequestDispatcher rd = request.getRequestDispatcher("/admin/admin_login.jsp");
		rd.forward(request, response);
	}

	else {
		
		if(role.equals("admin"))
		{	
	%>

	<%@include file="/admin/admin_header.html"%>

	<%-- <div class="container-fluid">
		<h2>
			Hello
			<%=adminId%>
			you are
			<%=role%></h2>
	</div> --%>
	
	<div class="container">

<%

AdminDao dao = new AdminDao();
Admin a = dao.viewProfile(adminId);

%>

<%-- <h4>Name:<%=a.getName()%></h4> --%>

<!-- Admin profile code starts-->

<section class="vh-100" style="background-color: #f4f5f7;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col col-lg-6 mb-4 mb-lg-0">
        <div class="card mb-3" style="border-radius: .5rem;">
          <div class="row g-0">
            <div class="col-md-4 gradient-custom text-center"
              style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;">
              <img src="/VehicleServiceStation/images/logo2.png"
                alt="logo" class="img-fluid my-5" style="width: 80px;" />
              <h5 ><%=a.getName()%></h5>
              <p>you are <%=role%></p>
              <a href="/VehicleServiceStation/admin/admin_edit_profile.jsp"><i class="far fa-edit mb-5"></i></a>
            </div>
            <div class="col-md-8">
              <div class="card-body p-4">
                <h6>Information</h6>
                <hr class="mt-0 mb-4">
                <div class="row pt-1">
                  <div class="col-6 mb-3">
                    <h6>Email</h6>
                    <p class="text-muted"><%=a.getEmail() %></p>
                  </div>
                  <div class="col-6 mb-3">
                    <h6>Phone</h6>
                    <p class="text-muted"><%=a.getPhone() %></p>
                  </div>
                </div>
                <!-- <h6>Projects</h6>
                <hr class="mt-0 mb-4"> -->
                <!-- <div class="row pt-1">
                  <div class="col-6 mb-3">
                    <h6>Recent</h6>
                    <p class="text-muted">Lorem ipsum</p>
                  </div>
                  <div class="col-6 mb-3">
                    <h6>Most Viewed</h6>
                    <p class="text-muted">Dolor sit amet</p>
                  </div>
                </div> -->
                
                <!-- <div class="d-flex justify-content-start">
                  <a href="#!"><i class="fab fa-facebook-f fa-lg me-3"></i></a>
                  <a href="#!"><i class="fab fa-twitter fa-lg me-3"></i></a>
                  <a href="#!"><i class="fab fa-instagram fa-lg"></i></a>
                </div> -->
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Admin profile code ends-->

</div>
		


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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="vss.dao.*,vss.beans.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Offer Page</title>
<%@include file="/common/common_css.html"%>
<%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
</head>
<body style="background-color: #E8D8C4">


<%
	String providerId = (String) session.getAttribute("sessionKey");
	String role = (String) session.getAttribute("role");

	System.out.println(session.getId());

	if (providerId == null || session.isNew()) {
		request.setAttribute("msg", "Unathorised access, please do login first");
		RequestDispatcher rd = request.getRequestDispatcher("/provider/provider_login.jsp");
		rd.forward(request, response);
	}

	else {
		// for authentication
				if(role.equals("Service Provider")) // equals method is case sensitive so spelling should be correct as admin
			    {
	%>
		<!-- header srarts here -->
			<%@include file="/provider/provider_header.html"%>
		<!-- header ends here -->

<%
ProviderDao dao = new ProviderDao();
ArrayList<Services>serviceList = dao.viewServices(providerId);
%>

<div class="container" style="margin-top: 6rem;">
    <div class="row justify-content-center mt-5" >
      <div class="col-md-6 p-5" style="width: 50rem;">
            <form class="p-4 needs-validation" method="post" action="/VehicleServiceStation/Provider_offer" style="border-radius: 5px ; box-shadow: 0 0 10px rgba(0, 0, 0, 0.9);" novalidate>
                Service : <select class="form-select my-3" aria-label="Default select example" name="Service_id">
                    
                    <% for (Services s : serviceList) { %>
                        <option value="<%= s.getService_id() %>"><%= s.getService_name() %></option>
                    <% } %>
                </select>
				<input type="hidden" name="service" value="<%= serviceList.get(0).getService_name() %>">
                <div class="mb-3 my-3">
                    <label for="exampleFormControlTextarea1" class="form-label">Offer Description :</label>
                    <textarea name="offer" class="form-control" id="exampleFormControlTextarea1" rows="2" required></textarea>
                    <div class="invalid-feedback">offer description is missing</div>
                </div>

				<div class="d-flex justify-content-center">
                <button type="submit" class="btn btn-primary my-3">Submit</button>
                </div>
            </form>
            </div>
        </div>
        </div>

        <!-- footer srarts here -->
	<footer class="bg-body-tertiary text-center fixed-bottom">
	<div class="text-center p-3" style="background-color:  #561C24; color: white;">
      &#169;2024:All rights reserved by
      <a class="text-white" href="/VehicleServiceStation/commonjsp/index.jsp">VSS</a>
    </div>
	</footer>

	<!-- footer ends here -->

    <%
        } else {
            request.setAttribute("msg", "You are not an authorized person. Your role is not authorized to access this page.");
            RequestDispatcher rd = request.getRequestDispatcher("/admin/admin_login.jsp");
            rd.forward(request, response);
        }
    }
%>


<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		type="text/javascript"></script>
<script src="/VehicleServiceStation/common/validation.js"></script>
<script src="/VehicleServiceStation/common/validation.js"></script>

</body>
</html>
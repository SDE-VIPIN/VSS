<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="vss.dao.*,vss.beans.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Rating &amp; Reviews</title>
<%@include file="/common/common_css.html" %>
<style>
.fa-star.checked {
    color: gold;
}
.star-rating {
    font-size: 24px;
}

body{
	background-image: url('/VehicleServiceStation/images/rating.jpg');
	background-size: cover;
	background-repeat: no-repeat;
 	background-attachment: fixed;
}
</style>
</head>
<body>

<%@include file="/common/common_header.html" %>

<h4 style="text-align: center; margin-top: 3vw;">User Reviews</h4>

<%

UserDao dao = new UserDao();
ArrayList<Feedbacks>feedbackList = dao.viewFeedbacks();
%>

<div class="container mt-3">
<div class="row">

<%
for(Feedbacks f:feedbackList){
%>
<div class="col-4 my-4 d-flex justify-content-center">
<%-- <div class="card">
<div class="card-body">
<h4 class="card-title"><%=f.getName()%> review</h4>
<p class="card-text"><%=f.getRemarks()%></p>
<h4 class="card-text">Rating: <%=f.getRating() %></h4>
</div>
</div> --%>


<div class="card border border-warning shadow-0 mb-3" style="width: 18rem;">
  <div class="card-header"><%=f.getName()%></div>
  <div class="card-body">
    <h5 class="card-title"><%=f.getRemarks()%></h5>
    <div class="star-rating">
    <% for (int i = 0; i < f.getRating(); i++) { %>
        <span class="fa fa-star checked"></span>
    <% } %>
    <% for (int i = f.getRating(); i < 5; i++) { %>
        <span class="fa fa-star"></span>
    <% } %>
</div>
  </div>
</div>
</div>


<%}%>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
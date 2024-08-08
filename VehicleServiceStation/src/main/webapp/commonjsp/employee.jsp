<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee</title>
<%@include file="/common/common_css.html" %>
</head>
<body>
<%@include file="/common/common_header.html"%>

<form method="post" action="/VehicleServiceStation/Employee">

<div>
<label for="id">Id :</label>
<input type="text" name="id" required>
</div><br>

<div>
<label for="id">Password :</label>
<input type="password" name="password" required>
</div><br>

<div>
<label for="id">Name :</label>
<input type="text" name="name" required>
</div><br>

<div>
<label for="id">Email :</label>
<input type="email" name="email" required>
</div><br>

<div>
<label for="id">Phone :</label>
<input type="tel" name="phone" required>
</div><br>

  <div> 
  <button type="submit" class="btn btn-info ms-2" style="color: white;">Submit</button>
  </div>
                


</form>




<%@include file="/common/common_footer.html"%>
</body>
</html>
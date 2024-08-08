<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login 2</title>
<style>
  /* Common CSS for buttons */
  #btn_1 {
    padding: 10px 20px;
    background-color: #007bff;
    color: #fff;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s, transform 0.3s;
    box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.1);
  }

  #btn_1:active,
  #btn_1:focus {
    background-color: #0056b3;
    transform: scale(0.95);
    box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.1);
  }

  /* Container for headings */
  .login-heading-container {
    display: flex;
    justify-content: space-around;
    align-items: center;
    margin-bottom: 20px;
    border-bottom: 1px solid #ccc; /* Divider between headings */
  }

  /* Heading style */
  .login-heading {
    cursor: pointer;
    text-decoration: underline;
    transition: color 0.3s;
  }

  .login-heading:hover,
  .login-heading:focus {
    color: #007bff;
  }
</style>
<%@include file="/common/common_css.html"%>

<link rel="stylesheet" href="/VehicleServiceStation/css/provider_login.css">

</head>
<body>
    
    <!-- header starts here -->
    <%@include file="/common/common_header.html"%>
    <!-- header ends here -->

    <!-- Content section starts here -->
    <div class="content">
        <main>
            <!-- Login headings container -->
            <div class="login-heading-container">
                <h4 class="login-heading" id="adminHeading">Admin</h4>
                <h4 class="login-heading" id="providerHeading">Provider</h4>
                <h4 class="login-heading" id="clientHeading">Client</h4>
            </div>

            <!-- Form starts here -->
            <form class="admin_form" method="post" action="/VehicleServiceStation/Admin_login">
                <div class="form_wrapper">
                    <input id="input1" type="text" name="userId" required>
                    <label for="input" id="user1">Admin Id</label>
                    <i class="fas fa-user-circle adminid"></i>
                    <div class="invalid-feedback">Admin Id is missing.</div>
                </div>

                <div class="form_wrapper">
                    <input id="password1" type="password" name="userPass" onfocus="showEyeIcon()" required>
                    <label for="input" id="pass1">Password</label>
                    <i id="eyeIcon" class="fas fa-eye-slash hide-eye adminpass" onclick="changeIcon(this)"></i>
                    <div class="invalid-feedback">Password is missing.</div>
                </div>

                <div class="remember_box">
                    <div class="remember">
                        <input type="checkbox" checked>Remember me
                    </div>
                    <a href="#" id="forgotpass">Forgot Password?</a>
                </div>

                <button id="btn_1">Login</button>

                <!-- New account link -->
                <div class="new_account">
                    Don't have an account? <a href="/VehicleServiceStation/provider/provider_registration.jsp">Register</a>
                </div>
            </form>
            <!-- Form ends here -->
        </main>
    </div>
    <!-- Content section ends here -->

    <!-- Footer starts here -->
    <%@include file="/common/common_footer.html"%>
    <!-- Footer ends here -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
</body>
</html>

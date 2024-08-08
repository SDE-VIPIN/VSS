<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="vss.dao.*,vss.beans.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Vehicle Service Station</title>
<%@include file="/common/common_css.html"%>
<link rel="stylesheet" href="/VehicleServiceStation/css/index.css">
<style>



.cta{
width:100%;
min-height: 400px;
background-image: url('https://img.freepik.com/free-photo/sports-car-driving-asphalt-road-night-generative-ai_188544-8052.jpg?t=st=1715093499~exp=1715097099~hmac=e3e13f5bbbcebe7f0c8b8427099a7018f934d7cb76e83362ed40b1076630cfcd&w=996');
background-size: cover;
background-position:center;
background-attachment:fixed;
}
.a{

a{
color:red !important;
}}
  .follow-icons {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    align-items: center;
  }
  .follow-icons .btn {
    flex: 0 0 calc(33.33% - 10px);
    max-width: calc(33.33% - 10px);
  }
  
.fa-star.checked {
    color: gold;
}
.star-rating {
    font-size: 24px;
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
}
	overflow:auto;
}

.carousel-item img {
width:100%;
object-fit: cover;
} 

.xcd{
img{
filter:blur(2px) brightness(0.4);}
position:relative;
}
</style>


</head>
<body class="scrl" style="background-color:">

	<!-- <div class="container-fluid bg-info"><h3>upper block</h3></div> -->
	<%@include file="/common/common_header.html"%>
	
	

<%
AdminDao dao=new AdminDao();
ArrayList<News>news=dao.viewNotice();
UserDao daos = new UserDao();
ArrayList<Feedbacks>feedbackList = daos.viewFeedbacks();
%>
<%-- <div class="row my-3" style="yellow">
<%
for(News n : news){
%>
<div class="a" style="padding: 0 15vw;">
<marquee onmouseover="stop()" onmouseout="start()"  direction="right" style="width: 100%; height:22px ; color: red " ><a href="" ><strong ><%=n.getNews_content()%></strong></a></marquee>

</div>
<%}%>
</div> --%>


<!-- carousel starts-->
<div  id="carouselExampleInterval" class="carousel slide xcd" data-bs-pause="false" data-bs-ride="carousel">
<div style="position:absolute; top:30%; left:0; right:0; z-index:1000;">
<h1 class="text-center" style="font-size:4rem; font-weight:700; color:white;padding: 0 255px;">Welcome to Vehicle Service Station</h1>
<h2 class="text-center" style="font-size:2rem; font-weight:300; color:white;" >We are driven to serve you</h2>
</div>
  <div class="carousel-inner">
    <div class="carousel-item active" data-bs-interval="3000">
      <img src="/VehicleServiceStation/images/index1.jpg" class="d-block w-100" alt="..." style="max-height: 35rem;">
    </div>
    <div class="carousel-item" data-bs-interval="3000">
      <img src="/VehicleServiceStation/images/index2.jpg" class="d-block w-100" alt="..." style="max-height: 35rem;">
    </div>
    <div class="carousel-item" data-bs-interval="3000">
      <img src="/VehicleServiceStation/images/index3.jpg" class="d-block w-100" alt="..." style="max-height: 35rem;">
    </div>
    <div class="carousel-item" data-bs-interval="3000">
      <img src="/VehicleServiceStation/images/index4.jpg" class="d-block w-100" alt="..." style="max-height: 35rem;">
    </div>
    <div class="carousel-item" data-bs-interval="3000">
      <img src="/VehicleServiceStation/images/index5.jpg" class="d-block w-100" alt="..." style="max-height: 35rem;">
    </div>
    <div class="carousel-item" data-bs-interval="3000">
      <img src="/VehicleServiceStation/images/index6.jpg" class="d-block w-100" alt="..." style="max-height: 35rem;">
    </div>
    <div class="carousel-item" data-bs-interval="3000">
      <img src="/VehicleServiceStation/images/index7.jpg" class="d-block w-100" alt="..." style="max-height: 35rem;">
    </div>
    <div class="carousel-item" data-bs-interval="3000">
      <img src="/VehicleServiceStation/images/index8.jpg" class="d-block w-100" alt="..." style="max-height: 35rem;">
    </div>
    <div class="carousel-item" data-bs-interval="3000">
      <img src="/VehicleServiceStation/images/index9.jpg" class="d-block w-100" alt="..." style="max-height: 35rem;">
    </div>
    <div class="carousel-item" data-bs-interval="3000">
      <img src="/VehicleServiceStation/images/index10.jpg" class="d-block w-100" alt="..." style="max-height: 35rem;">
    </div>
  </div>
  <button class="carousel-control-prev" style="display: none;" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" style="display: none;" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

<!-- carousel ends-->

<!-- Steps starts here -->	

<div><h3 class="text-center pt-5">Services In 4 Easy Step</h3>
<div class="stepdiv">
<div  class="content">
<div class="layer">
<h3>Registration</h3>
<img src="/VehicleServiceStation/images/index7.jpg" alt="">
<p>Register on the Portal</p>
<span><i class="far fa-lightbulb"></i></span>
</div>
<h4>STEP 01</h4>
</div>

<div  class="content">
<div class="layer">
<h3>Find Service Provider</h3>
<img src="/VehicleServiceStation/images/index7.jpg" alt="">
<p>Find the service provider in your city</p>
<span><i class="far fa-lightbulb"></i></span>
</div>
<h4>STEP 02</h4>
</div>

<div  class="content">
<div class="layer">
<h3>Book Services</h3>
<img src="/VehicleServiceStation/images/index7.jpg" alt="">
<p>Book your services</p>
<span><i class="far fa-lightbulb"></i></span>
</div>
<h4>STEP 03</h4>
</div>

<div  class="content">
<div class="layer">
<h3>Free Pick & Drop</h3>
<img src="/VehicleServiceStation/images/index7.jpg" alt="">
<p>Get a free  pick and drop on each service</p>
<span><i class="far fa-lightbulb"></i></span>
</div>
<h4>STEP 04</h4>
</div>
</div>
</div>
<!-- Steps ends here -->

<!-- Introduction starts here -->
<div class="text-center pt-5">
    <h3>Why To Choose Us?</h3>
</div>
	<div class="d-flex justify-content-center gap-3 flex-wrap">
            <div style="padding:3vw 2vw; width:600px !important;">
                <img src="/VehicleServiceStation/images/index7.jpg" style="height: 400px; width:600px; object-fit:cover;">
            </div>
        <div style="max-width:600px">
         <!-- <h2 style="background-color: white; padding-top: 60px; text-align: center">About Us</h2> -->
                 <p style="color: black; text-align: justify; padding: 100px 10px 0 10px; font-size: 16px; font-weight: 400; color: #000; line-height: 30px;">Vehicle Service Station is a reliable and trusted brand known for its transparency and commitment to excellence. At VSS Service Centre, we have skilled manpower who possess in-depth knowledge of cars and bikes. This helps us ensure better customer satisfaction by delivering high-quality car service in a timely manner. Furthermore, VSS's vast service network extends a strong sense of assurance to its customers and also provides the convenience of doorstep pickup and delivery for car servicing. And to elevate the overall car ownership experience, VSS offers loyalty and reward programs which can be redeemed at VSS Authorised Service Centre's. Book A service to avail these rewards and avail additional savings.
                </p>
        </div>
    </div>
   
   <div class="d-flex justify-content-center gap-3 flex-wrap">
    	<div style="max-width:600px">
    	<!-- <h2 style="background-color: white; padding-top: 10rem; text-align: center">Extended warranty</h2> -->
            <p style="color: black; text-align: justify; padding: 160px 10px 0 10px; font-size: 16px; font-weight: 400; color: #000; line-height: 30px;">Extend the benefits that you enjoy under warranty, by one or two more years, to protect your car for a longer duration/distance (Upto 1,50,000 kms). The extended warranty will cover mechanical and electrical breakdowns in your car, and it starts immediately after expiry of the original warranty. We strongly recommend the purchase of an Extended Warranty as early as possible.
                </p>
            </div>
            
            <div style="padding:3vw 2vw; width:600px !important;">
                <img src="/VehicleServiceStation/images/home2.jpeg" style="height: 400px; width:600px; object-fit:cover;">
            </div>
        </div>
		
		
<!-- search -->
<div class="outerdiv d-flex justify-content-center align-items-center" style="background-color: #557680; height: 300px; margin: 2% 10%;">
    <div class="innerdiv" style="padding: 8px 12px; max-width: 450px;">
        <h2 class="text-center mb-4">Find Service Center In Your City</h2>
        <form method="post" action="/VehicleServiceStation/commonjsp/search_provider.jsp" >
            <div class="input-group">
                <input class="form-control" oninput="validateInput(event)" type="search" name="city" placeholder="Enter city..." aria-label="Search">
                <button class="btn btn-success" type="submit"><i class="fas fa-search"></i></button>
            </div>
        </form>
    </div>
</div>

<!-- search -->

<!-- contact -->

<div class="outerdiv" style="background-color: #0e3c178f; padding: 8px; margin: 1vw 10vw;">
<div class="auto-container" >
        <h2 class="text-center mb-2">Connect With Us</h2>
        <form class="needs-validation" novalidate method="post" action="/VehicleServiceStation/IndexContactus" onsubmit="return checkLength()">
            <div class="row">
                <div class="col-md-6 mb-2">
                    <input type="text" class="form-control" oninput="validateInput(event)" id="validationCustom01" name="userName" placeholder="Name" required>
                    <div class="invalid-feedback">Name is required.</div>
                </div>
                <div class="col-md-6 mb-2">
                    <input type="email" class="form-control" id="inputEmail" name="userMail" placeholder="abc@gmail.com" required>
                    <div class="invalid-feedback">Email is required.</div>
                </div>
                <div class="col-md-6 mb-2">
                    <input class="form-control" maxlength="10" type="text" id="phone" name="userPhone" placeholder="0000 0000 00" required>
                    <div class="invalid-feedback">Phone is required.</div>
                </div>
                <div class="col-md-6 mb-2">
                    <textarea class="form-control" placeholder="Write your query/suggestion here...." style="height: 100px" name="userQuery" required></textarea>
                    <div class="invalid-feedback">Please enter your query.</div>
                </div>
            </div>

             <div class="d-flex justify-content-center my-2">
                <div class="col-sm-6 text-center">
                    <button type="reset" class="btn btn-primary fw-semibold me-3">Reset</button>
                    <button type="submit" class="btn btn-primary fw-semibold">Submit</button>
                </div>
            </div>
            
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
        </form>

    </div>
</div>

<!-- contact -->		
		
	<!-- faq bootstrap starts -->
	<div class="outerdiv" style="background-color: #be92b3e6; padding: 8px; margin: 1vw 10vw;">
	
	<div class="auto-container" style="padding-bottom: 25px;">
	<div class="py-3">
			<h2 class="text-center">Frequently Asked Questions about car service</h2>		
	</div>
	
	<div class="accordion accordion-flush"  id="accordionFlushExample">
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingOne">
      <button class="accordion-button collapsed" style="background-color: none; box-shadow:none" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
        1. Why should I choose VSS for my car service needs?
      </button>
    </h2>
    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
        Good question. To top up the multiple, cost-effective car services we provide near your location, VSS also believes in providing intangible bonuses like trust and quality. All VSS car repair service shops have Toyota-trained technicians with extensive knowledge, as well as Toyota genuine parts for your hardware needs.
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
        2. What kind of car services does VSS provide?
      </button>
    </h2>
    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
        VSS automotive shops near you provide an array of services and repairs that include periodic maintenance, body and paint work, general repairs, car cleaning, electric and wiring and many others. Visit the homepage to find a car repair shop nearby you or download our VSS app for the complete list of Car services we provide.
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingThree">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
        3. What makes VSS different from other car repair shops near you?
      </button>
    </h2>
    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
        VSS car repair shops are provided with two unique assets. They are supplied with genuine Toyota parts from Toyota warehouses. They also have Toyota-trained technicians who are highly skilled in attending to all of your questions and concerns.
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingFour">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
        4. How can I book a nearby VSS car repair centre for my car?
      </button>
    </h2>
    <div id="flush-collapseFour" class="accordion-collapse collapse" aria-labelledby="flush-headingFour" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
        Well, that's easy, go on VSS website, choose your preferred nearby VSS car repair shops and select the service you need. You can also choose free car pickup and drop-off. Paperless convenience is at your service!
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingFive">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFive" aria-expanded="false" aria-controls="flush-collapseFive">
        5. Does VSS offer pickup and drop-off services?
      </button>
    </h2>
    <div id="flush-collapseFive" class="accordion-collapse collapse" aria-labelledby="flush-headingFive" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
        Yes, we do! And It's free!
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingSix">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseSix" aria-expanded="false" aria-controls="flush-collapseSix">
        6. Can I get general repairs at VSS car service centers?
      </button>
    </h2>
    <div id="flush-collapseSix" class="accordion-collapse collapse" aria-labelledby="flush-headingSix" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
        Of course! All VSS automotive shops are completely equipped to handle general service and repairs for your car. And this extends to cars of all makes and models.
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingSeven">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseSeven" aria-expanded="false" aria-controls="flush-collapseSeven">
        7. Can I get a general health check for my car at VSS automotive shops near me?
      </button>
    </h2>
    <div id="flush-collapseSeven" class="accordion-collapse collapse" aria-labelledby="flush-headingSeven" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
		Sure, you can. The services VSS car repair shops provide are not confined to repairs and maintenance. We take care of your car's general checkup requirements, too
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingEight">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseEight" aria-expanded="false" aria-controls="flush-collapseEight">
        8. Is it only repairs or does VSS also provide car cleaning and a car spa?
      </button>
    </h2>
    <div id="flush-collapseEight" class="accordion-collapse collapse" aria-labelledby="flush-headingEight" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
        Most definitely! VSS car repair shops all offer car cleaning and car spa services. Just book your car repair and service through WhatsApp, and you'll be good to go!
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingNine">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseNine" aria-expanded="false" aria-controls="flush-collapseNine">
        9. What services are included in car detailing at the VSS workshops?
      </button>
    </h2>
    <div id="flush-collapseNine" class="accordion-collapse collapse" aria-labelledby="flush-headingNine" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
        Our car detailing services include exterior and interior cleaning and beautification.
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingTen">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTen" aria-expanded="false" aria-controls="flush-collapseTen">
        10. What kinds of DIY accessories does VSS provide?
      </button>
    </h2>
    <div id="flush-collapseTen" class="accordion-collapse collapse" aria-labelledby="flush-headingTen" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
        VSS provides DIY accessories like neck rest pillows, BASK seat cushions, memory foam comfort liners, memory foam back rests, and seat belt pads.
      </div>
    </div>
  </div>
</div>
</div>
</div>
	<!-- faq bootstrap ends -->

<!-- Rating section starts here -->
<section style="background-color: #bda4a4; padding: 8px; margin: 1vw 10vw;">
<div><h4 style="text-align: center; padding-top: 5px;">Customer Review</h4></div>
<div class="dc scrl" style="padding: 25px 15px;;" >
<div style="display:inline-flex;margin: 0 auto;">

<%
for(Feedbacks f:feedbackList){
%>
<div class="col-4 d-flex justify-content-center">
<div class="card border border-warning shadow-0" style="width: 18rem;">
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
</section>
<!-- Rating section ends here -->
	<%-- <%@include file="/common/common_footer.html"%> --%>
	
	
	<!-- Remove the container if you want to extend the Footer to full width. -->
<div class="" style="background-color: #000000;">

  <footer class="bg-dark text-center text-lg-start text-white" >
    <!-- Grid container -->
    <div class="container p-4">
      <!--Grid row-->
      <div class="row my-4">
        <!--Grid column-->
        <div class="col-lg-3 col-md-6 mb-4 mb-md-0">

          <div class="rounded-circle bg-white shadow-1-strong d-flex align-items-center justify-content-center mb-4 mx-auto" style="width: 150px; height: 150px;">
            <img src="/VehicleServiceStation/images/logo2.png" height="30" alt=""/>
          </div>

          <p class="text-center">Vehicle Service Station</p>
          <p class="text-center">Move With Us</p>

        </div>
        <!--Grid column-->

        <!--Grid column-->
        <div class="col mt-5">
         <!--  <h5 class="text-uppercase mb-4">Animals</h5> -->

          <ul class="list-unstyled text-start ms-5" >
            <li class="mb-2">
              <a href="#!" class="text-white ms-5"><i class="far fa-envelope pe-3"></i>Email</a>
            </li>
            <li class="mb-2">
              <a href="#!" class="text-white ms-5"><i class="fas fa-phone pe-3"></i>Phone Number</a>
            </li>
            <li class="mb-2">
              <a href="#!" class="text-white ms-5"><i class="far fa-calendar-alt pe-3"></i>Working Days</a>
            </li>
            <li class="mb-2">
              <a href="#!" class="text-white ms-5"><i class="far fa-clock pe-3"></i>Working Hours</a>
            </li>
          </ul>
        </div>
        <!--Grid column-->

        <!--Grid column-->
        <div class="col mt-5 ">
          <!-- <h5 class="text-uppercase mb-4">Animals</h5> -->

          <ul class="list-unstyled text-start ms-5">
            <li class="mb-2">
              <a href="#!" class="text-white">Info@vss.com</a>
            </li>
            <li class="mb-2">
              <a href="#!" class="text-white">8888884950</a>
            </li>
            <li class="mb-2">
              <a href="#!" class="text-white">Mon - Sun</a>
            </li>
            <li class="mb-2">
              <a href="#!" class="text-white">7:00AM - 9:00PM(IST)</a>
            </li>
          </ul>
        </div>
        <!--Grid column-->

        <!--Grid column-->
        <div class="col mt-5">
            <h6 class="text-uppercase mb-4 font-weight-bold">Follow us</h6>

            <div style="display:grid; grid-template-columns:repeat(3, 1fr)">
            <!-- Facebook -->
            <a
               class="btn btn-primary m-1"
               style="background-color: #3b5998"
               href="#!"
               role="button"
               ><i class="fab fa-facebook-f"></i
              ></a>

            <!-- Twitter -->
            <a
               class="btn btn-primary  m-1"
               style="background-color: #55acee"
               href="#!"
               role="button"
               ><i class="fab fa-twitter"></i
              ></a>

            <!-- Google -->
            <a
               class="btn btn-primary m-1"
               style="background-color: #dd4b39"
               href="#!"
               role="button"
               ><i class="fab fa-google"></i
              ></a>

            <!-- Instagram -->
            <a
               class="btn btn-primary m-1"
               style="background-color: #ac2bac"
               href="#!"
               role="button"
               ><i class="fab fa-instagram"></i
              ></a>

            <!-- Linkedin -->
            <a
               class="btn btn-primary m-1"
               style="background-color: #0082ca"
               href="#!"
               role="button"
               ><i class="fab fa-linkedin-in"></i
              ></a>
            <!-- Github -->
            <a
               class="btn btn-primary m-1"
               style="background-color: #333333"
               href="#!"
               role="button"
               ><i class="fab fa-github"></i
              ></a>
            </div>
          </div>
        <!--Grid column-->
      </div>
      <!--Grid row-->
    </div>
    <!-- Grid container -->

    <!-- Copyright -->
    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2)">
      ©2024: All rights reserved by
      <a class="text-white" href="https://mdbootstrap.com/">VSS</a>
    </div>
    <!-- Copyright -->
  </footer>

</div>
	

<script>
function validateInput(event) {
  const input = event.target.value;
  const regex = /^[a-zA-Z ]*$/; // Regular expression to match only characters and space
  if (!regex.test(input)) {
    // If input contains anything other than characters and space, remove them
    event.target.value = input.replace(/[^a-zA-Z ]/g, '');
    alert("Only alphabets are allowed");
  }
}
</script>
<!-- script to allow only alphabets for textfields -->
<script>
document.getElementById('phone').addEventListener('keydown', function(event) {
// Allow only digits and backspace/delete keys

if (!(event.key === 'Backspace' || event.key === 'Delete' || /\d/.test(event.key))) {
	
	
alert("only digits are allowed.")
event.preventDefault();
}
});


function checkLength() {
    var phoneNumber = document.getElementById('phone').value;
    if (phoneNumber.length !== 10) {
        alert("Enter exactly 10 digits");
        return false;
    }
    return true;
}
</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
		<script src="/VehicleServiceStation/common/validation.js"></script>
</body>
</html>
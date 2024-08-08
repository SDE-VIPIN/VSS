<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>About us</title>
<link rel="icon" href="/VehicleServiceStation/images/favicon.png">
<%@include file="/common/common_css.html"%>
<style>

.intro {
	display: flex;
	width: 100%;
	max-width: 1920px;
	margin: 0 auto;
	height: 597px;
	background-color: #F0ECE5;
}

.custom-left {
	width: 35%;
	padding: 20px;
    box-sizing: border-box;
    
}

.custom-left h1 {
	padding: 150px 0 0 50px;
	font-family: sans-serif;
	font-weight: 700;
}

.hp {
	padding: 20px 44px 20px 50px;
	font-size: 1rem;
	line-height: 1.5rem;
	margin-bottom: 1.875rem;
	font-family: sans-serif;
	letter-spacing: 1.25px
}

.custom-right {
	width: 65%;
    overflow: hidden;
    position: relative;
}

.custom-right img {
	width: 100%;	
}
.carousel {
    margin: 25px 100px;
}
</style>

</head>
<body>
	<%@include file="/common/common_header.html"%>
	<div class="intro">

		<div class="custom-left">
			<h1>VSS</h1>
			<p class="hp">Our trained technicians at VSS, can
					service any car/bike. We drive on the know-how and technology of the VSS
					network to offer you excellent performance at a fair price.</p>
		</div>

		<div class="custom-right">
			<div id="carouselExampleIndicators" class="carousel slide"
				data-bs-ride="carousel">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="0" class="active" aria-current="true"
						aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="2" aria-label="Slide 3"></button>
				</div>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="/VehicleServiceStation/images/about1.jpg"
							class="d-block" alt="..." style="width: 800px; heigth: 600px;">
					</div>
					<div class="carousel-item">
						<img src="/VehicleServiceStation/images/about2.jpg"
							class="d-block " alt="..." style="width: 800px; heigth: 600px;">
					</div>
					<div class="carousel-item">
						<img src="/VehicleServiceStation/images/background5.jpg"
							class="d-block" alt="..." style="width: 800px; heigth: 600px;">
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>

	</div>

	<%@include file="/common/common_footer.html" %>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
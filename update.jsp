<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mytag" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>wanderlust_UPDATE</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Free HTML5 Website Template by FreeHTML5.co" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
<meta name="author" content="FreeHTML5.co" />

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<mytag:favi />

<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,300,600,400italic,700'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>

<!-- Animate.css -->
<link rel="stylesheet" href="css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="css/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="css/bootstrap.css">
<!-- Owl Carousel -->
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<!-- Theme style  -->
<link rel="stylesheet" href="css/style.css">

<!-- Modernizr JS -->
<script src="js/modernizr-2.6.2.min.js"></script>
<style type="text/css">
.inbox {
	margin: 5%;
}
</style>

</head>
<body>

	<div id="fh5co-page">

		<mytag:sidebar />


		<div id="fh5co-main">

			<div class="fh5co-narrow-content">
				<div class="row">
					<h2 class="fh5co-heading animate-box"
						data-animate-effect="fadeInLeft">Update Post</h2>
					<div class="col-md-5">
						<div class="fh5co-lead animate-box"
							data-animate-effect="fadeInLeft">
							<form method="post" action="update.do"
								enctype="multipart/form-data">
								<input type="hidden" name="pno" value="${data.pno}">
								<div class="row">
									<div class="col-md-12">
										<div class="row">
											<div class="form-group">
												<span class="info smsm">title</span> <input type="text"
													name="title" class="form-control" value="${data.title}">
											</div>
											<div class="form-group">
												<span class="info smsm">content</span>
												<textarea name="content" id="message" cols="30" rows="7"
													class="form-control" style="resize: none;">${data.content}</textarea>
											</div>
											<div align="right">
												<input type="submit" class="btn btn-primary btn-md"
													value="Edit">
											</div>
										</div>
									</div>

								</div>
							</form>
						</div>
					</div>
					<div></div>
					<div class="col-md-6 col-md-push-1 animate-box"
						data-animate-effect="fadeInLeft">
						<img src="${data.imgname}" alt="Free HTML5 Bootstrap Template"
							class="img-responsive">
					</div>
				</div>

			</div>



			<!-- <div class="fh5co-counters"
				style="background-image: url(images/hero.jpg);"
				data-stellar-background-ratio="0.5" id="counter-animate">
				<div class="fh5co-narrow-content animate-box">
					<div class="row">
						<div class="col-md-4 text-center animate-box">
							<span class="fh5co-counter js-counter" data-from="0" data-to="67"
								data-speed="5000" data-refresh-interval="50"></span> <span
								class="fh5co-counter-label">Clients Worked With</span>
						</div>
						<div class="col-md-4 text-center animate-box">
							<span class="fh5co-counter js-counter" data-from="0"
								data-to="130" data-speed="5000" data-refresh-interval="50"></span>
							<span class="fh5co-counter-label">Completed Projects</span>
						</div>
						<div class="col-md-4 text-center animate-box">
							<span class="fh5co-counter js-counter" data-from="0"
								data-to="27232" data-speed="5000" data-refresh-interval="50"></span>
							<span class="fh5co-counter-label">Line of Codes</span>
						</div>
					</div>
				</div>
			</div> -->


		</div>
	</div>

	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Carousel -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- Stellar -->
	<script src="js/jquery.stellar.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Counters -->
	<script src="js/jquery.countTo.js"></script>

	<!-- MAIN JS -->
	<script src="js/main.js"></script>
	<mytag:logincheck />
</body>
</html>


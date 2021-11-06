<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="mytag" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>wanderlust_SENDMAIL</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Free HTML5 Website Template by FreeHTML5.co" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
<meta name="author" content="FreeHTML5.co" />


<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<mytag:favi />

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

<!-- for Sign IN / UP -->
<link rel="stylesheet" href="css/sign.css">

</head>
<body style="background: #FFF1EE">



	<div class="sign">

		<div class="animate-box" data-animate-effect="fadeInLeft">
			<h1>
				<a href="#" onclick="window.close();">
				<img alt="logo" src="images/wand.png" style="width: 40%;">
				</a>
			</h1>
			<br>
		</div>

		<div class="loginbox animate-box" data-animate-effect="fadeInLeft">

			<div class="rr">
				<h1>Create NEW password</h1>
			</div>
			<form action="sendmail.do" method="post">
				<div class="rr">
					<div class="form-group">
						<span class="info">ID</span> <input type="text"
							class="form-control" name="mid" id="mid" required="required">

					</div>
					<div class="form-group">
						<span class="info">Email</span> <input type="text"
							class="form-control" name="email" id="email" required="required">

					</div>
					<div align="center">
						<input type="button" onclick="getemail()" class="btn btn-primary"
							value="send new password">
					</div>
					<div class="text-left">
						<span class="info">wanna close?&ensp;&ensp;&ensp;<a
							href="#" onclick="window.close();">close!</a></span>
					</div>
				</div>

			</form>
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
	<script src="js/login.js"></script>

</body>
</html>


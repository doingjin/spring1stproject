<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="mytag" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>wanderlust_SIGNUP</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Free HTML5 Website Template by FreeHTML5.co" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
<meta name="author" content="FreeHTML5.co" />
<title>Sign Up</title>
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

<!-- for Sign IN / UP -->
<link rel="stylesheet" href="css/sign.css">

</head>
<body style="background: #FFF1EE">

	<div class="sign">

		<div class="animate-box" data-animate-effect="fadeInRight">
			<h1>
				<a href="index.jsp"><img alt="logo" src="images/wand.png"
					style="width: 40%;"></a>
			</h1>
			<br>
		</div>


		<div class="loginbox animate-box" data-animate-effect="fadeInRight">

			<div class="rr">
				<h1>Create Account</h1>
			</div>
			<form action="signup.do" method="post">
				<div class="rr">
					<div class="form-group">
						<span class="info">ID</span> <span id="possible"
							class="passId alert">✔</span> <span id="impossible"
							class="alert">이미 사용 중인 ID입니다.</span><br> <input
							type="text" class="form-control" name="mid" id="mid"
							required="required" style="display: inline-block; width: 80%;">
						<a onclick="checkID()" class="btn"
							style="display: inline-block; float: right; width: 18%;">CHECK!</a>


					</div>
					<div class="form-group">
						<span class="info">Password</span> <span id="p"
							class="passId alert fontL">✔</span> <span id="i" class="alert">available
							6~10 characters with a number and a letter.</span> <input
							type="password" class="form-control" name="mpw" id="mpw"
							required="required" onblur="checkPW()">
					</div>
					<div class="form-group">
						<span class="info">Password Check!</span> <span id="poss"
							class="passId alert fontL">✔</span> <span id="imposs"
							class="alert fontS">❌</span> <input type="password"
							class="form-control" name="mpw2" id="mpw2" required="required"
							onblur="comparePW()">
					</div>
					<div class="form-group">
						<span class="info">Name</span> <input type="text"
							class="form-control" name="mname" placeholder=""
							required="required">
					</div>
					<div class="form-group">
						<span class="info">Email</span> <span id="pEmail"
							class="passId alert fontL">✔</span> <span id="iEmail"
							class="alert">❌</span> <input type="text" class="form-control"
							name="email" id="email" required="required" onblur="checkEmail()">
					</div>
					<div align="center">
						<input type="submit" class="btn btn-primary btn-lg"
							value="Sign Up">
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
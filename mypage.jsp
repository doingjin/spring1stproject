<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mytag" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>wanderlust_MYPAGE</title>
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

<style type="text/css">
</style>

</head>
<body>

	<div id="fh5co-page">

		<mytag:sidebar />

		<div id="fh5co-main">

			<div class="fh5co-narrow-content">
				<div class="row">
					<h2 class="fh5co-heading animate-box"
						data-animate-effect="fadeInLeft">My page</h2>
					<div class="col-md-5">
						<div class="fh5co-lead animate-box"
							data-animate-effect="fadeInLeft">
							<form method="post" action="mypage.do"
								enctype="multipart/form-data">
								<input type="hidden" name="mid" value="${mem.mid}">
								<!-- UPDATE MEMBER SET MPW=?, MNAME=?, PROFILE=? WHERE MID=? -->
								<div class="row">
									<div class="col-md-12">
										<div class="row">
											<div class="form-group">
												<span class="info smsm">ID</span> <input type="text"
													class="form-control" value="${mem.mid}" disabled="disabled"
													style="background: inherit; cursor: inherit;">
											</div>
											<div class="form-group">
												<span class="info smsm">Password</span> <span id="p"
													class="passId alert fontL">✔</span> <span id="i"
													class="alert">available 6~10 characters with a
													number and a letter.</span> <input type="password" name="mpw"
													class="form-control" id="mpw" value="${mem.mpw}"
													onblur="checkPW()">
											</div>
											<div class="form-group">
												<span class="info smsm">Name</span> <input type="text"
													name="mname" class="form-control" value="${mem.mname}">
											</div>
											<div class="form-group">
												<span class="info smsm">Profile</span> <input type="file"
													class="btn" name="proimg">
											</div>
											<div align="center">
												<input type="submit" class="btn btn-primary btn-md"
													value="Complete"> <a href="quit.do?mid=${mem.mid}"
													class="btn btn-primary btn-md">탈퇴</a>
											</div>

										</div>
									</div>

								</div>
							</form>
						</div>
					</div>

					<div class="col-md-6 col-md-push-1 animate-box"
						data-animate-effect="fadeInLeft">
						<img src="images/insert.jpg" alt="mypage" class="img-responsive">
					</div>
				</div>

			</div>


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
	<mytag:logincheck />

</body>
</html>


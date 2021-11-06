<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mytag" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="mytag" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>wanderlust_ADD</title>
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
						data-animate-effect="fadeInLeft">Add Post</h2>
					<div class="col-md-5">
						<div class="fh5co-lead animate-box"
							data-animate-effect="fadeInLeft">
							<form method="post" action="insert.do"
								enctype="multipart/form-data">
								<input type="hidden" name="mid" value="${mem.mid}">
								<div class="row">
									<div class="col-md-12">
										<div class="row">
											<div class="form-group">
												<span class="info smsm">title</span> <input type="text"
													name="title" class="form-control" required="required">
											</div>
											<div class="form-group">
												<span class="info smsm">location</span> <input type="text"
													name="location" id="location" class="form-control"
													required="required"> <input type="hidden"
													name="lat" id="lat" class="form-control"> <input
													type="hidden" name="lng" id="lng" class="form-control">
											</div>
											<div id="map-sm"></div>
											<div class="form-group">
												<span class="info smsm">photo</span> <input type="file"
													class="btn" id="apply" name="img" required="required">
											</div>
											<div class="form-group">
												<span class="info smsm">content</span>
												<textarea name="content" id="message" cols="30" rows="10"
													class="form-control" placeholder="content"
													style="resize: none;" required="required"></textarea>
											</div>
											<div align="right">
												<input type="submit" class="btn btn-primary btn-md"
													value="Complete">
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
						<img src="images/insert.jpg" alt="pop here"
							class="img-responsive apply">
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
	<!-- Google Map API -->
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC2O-wjFf77N1RbEEuWc0WdZ3FN_Kp95w4&callback=initMap">
	</script>

	<!-- MAIN JS -->
	<script src="js/main.js"></script>
	<script src="js/insert.js"></script>
	<mytag:logincheck />

</body>
</html>


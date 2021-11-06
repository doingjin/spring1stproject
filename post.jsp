<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mytag" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>wanderlust_POST</title>
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
table {
	width: 100%;
}
.posttd {
	width: 20%;
	font-weight: normal;
}
textarea {
	resize: none;
	border: 0;
	width: 100%;
	height: 200px;
}
textarea:focus {
	outline: none;
}
.postcontent {
	vertical-align: top;
	padding-top: 20px;
}
</style>
</head>
<body>

	<div id="fh5co-page">
		<mytag:sidebar />

		<div id="fh5co-main">

			<div class="fh5co-narrow-content">
				<div class="row">

					<div class="col-md-12 animate-box" data-animate-effect="fadeInLeft">
						<figure class="text-center">
							<img src="${data.imgname}" alt="${data.imgname}"
								class="img-responsive">
						</figure>
					</div>

					<div class="animate-box" data-animate-effect="fadeInLeft">

						<div class="info">
							<table>
								<tr>
									<td class="posttd">title</td>
									<td><h1>${data.title}</h1></td>
								</tr>
								<tr>
									<td class="posttd">location</td>
									<td>${data.location}</td>
								</tr>
								<tr class="postcontent">
									<td class="posttd">content</td>
									<td>
										<h3>
											<textarea readonly="readonly">${data.content}</textarea>
										</h3>
									</td>
								</tr>
								<tr>
									<td class="posttd">date</td>
									<td>${data.pdate}</td>
								</tr>
								<tr>
									<td></td>
									<td><a href="update.do?pno=${data.pno}" class="btn btn-md">edit
											post</a> <a onclick="deletep('${data.pno}')" class="btn btn-md">delete</a>
									</td>
								</tr>
							</table>
						</div>

					</div>
				</div>

				<div class="row work-pagination animate-box"
					data-animate-effect="fadeInLeft" style="text-align: center;">
					<div class="col-md-8 col-md-offset-2 col-sm-12 col-sm-offset-0">

						<div class="col-md-4 col-sm-4 col-xs-4 text-center">
							<a href="#"><i class="icon-long-arrow-left"></i> <span>Previous Project</span></a>
						</div>
						<div class="col-md-4 col-sm-4 col-xs-4 text-center">
							<a href="main.do"><i class="icon-th-large"></i></a>
						</div>
						<div class="col-md-4 col-sm-4 col-xs-4 text-center">
							<a href="#"><span>Next Project</span> <i class="icon-long-arrow-right"></i></a>
						</div>
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
	<mytag:logincheck />
	<script type="text/javascript">
		
	</script>
</body>
</html>


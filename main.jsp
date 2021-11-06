<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mytag" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>WANDERLUST</title>
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
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

<style type="text/css">
#paging {
	text-align: center;
	clear: both;
}

.italicf {
	font-style: italic;
	color: #E6C636;
	font-size: smaller;
	z-index: 1;
}
</style>
</head>
<body>
	<div id="fh5co-page">

		<mytag:sidebar />

		<div id="fh5co-main">
			<div class="fh5co-narrow-content">
				<h2 class="fh5co-heading animate-box"
					data-animate-effect="fadeInLeft">
					/ˈwɒn.də.lʌst/ <span class="italicf">the wish to travel far
						away and to many different places</span>
				</h2>
				<div class="row animate-box" data-animate-effect="fadeInLeft"
					align="center">

					<!-- 이미지 -->
					<c:if test="${empty datas}">
						<div class="workbox">
							<h3 class="fh5co-work-title">No Post Yet! Try to add first
								Post!</h3>
							<p>
								<a href="insert.jsp">go to add post!</a>
						</div>
					</c:if>
					<c:forEach var="v" items="${datas}">
						<div class="clearfix visible-sm-block"></div>
						<div class="col-md-4 col-sm-6 col-xs-6 col-xxs-12 work-item ttt">
							<a href="post.do?pno=${v.pno}"> <img src="${v.imgname}"
								alt="${v.imgname}" class="img-responsive">
								<h3 class="fh5co-work-title">${v.title}</h3>
								<p>${v.location}/ ${v.pdate}</p>
							</a>
						</div>
					</c:forEach>


					<!-- 페이지네이션 -->
					<c:if test="${!empty datas}">
						<div class="paging toolbar-bottom" id="paging">
							<c:if test="${paging.pageNo==paging.firstPageNo}">
								<span class="disabled">prev</span>
							</c:if>
							<c:if test="${paging.pageNo!=paging.firstPageNo}">
								<a href="main.do?page=${paging.prevPageNo}" class="button">prev</a>
							</c:if>
							<c:forEach var="i" begin="${paging.startPageNo}"
								end="${paging.endPageNo}" step="1">
								<c:choose>
									<c:when test="${i eq paging.pageNo}">
										<span class="active">${i}</span>
									</c:when>
									<c:otherwise>
										<a href="main.do?page=${i}" class="page">${i}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${paging.pageNo==paging.finalPageNo}">
								<span class="disabled">next</span>
							</c:if>
							<c:if test="${paging.pageNo!=paging.finalPageNo}">
								<a href="main.do?page=${paging.nextPageNo}" class="button">next</a>
							</c:if>
						</div>
					</c:if>
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
</body>
</html>


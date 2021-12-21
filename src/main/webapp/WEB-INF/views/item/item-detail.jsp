<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="ThemeStarz">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700|Varela+Round"
	rel="stylesheet">
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.css"
	type="text/css">
<link rel="stylesheet" href="assets/fonts/font-awesome.css"
	type="text/css">
<link rel="stylesheet" href="assets/css/selectize.css" type="text/css">
<link rel="stylesheet" href="assets/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/user.css">

<title>ItemDetail</title>

</head>
<body>
	<div class="page sub-page">
		<!--*********************************************************************************************************-->
		<!--************ HERO ***************************************************************************************-->
		<!--*********************************************************************************************************-->
		<section class="hero">
			<div class="hero-wrapper">
				<!--============ Main Navigation ====================================================================-->
				<div class="main-navigation">
					<div class="container">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item"><a href="#">Item</a></li>
							<li class="breadcrumb-item active"><a href="#">${itemDetail.categoryVO.categoryName}</a></li>
						</ol>
						<!--end breadcrumb-->
					</div>
					<!--end container-->
				</div>
				<!--============ End Main Navigation ================================================================-->
			  <!--============ Page Title =========================================================================-->
                <div class="page-title">
                    <div class="container clearfix">
                        <div class="float-left float-xs-none">
                           <h1>${itemDetail.itemTitle}</h1>
                        </div>
                        <div class="float-right float-xs-none price">
                            <div class="number">${itemDetail.itemPrice} 원</div>
                        </div>
                    </div>
                    <!--end container-->
                </div>
                <!--============ End Page Title =====================================================================-->
                <div class="background"></div>
                <!--end background-->
            </div>
            <!--end hero-wrapper-->
        </section>
        <!--end hero-->

        <!--*********************************************************************************************************-->
        <!--************ CONTENT ************************************************************************************-->
        <!--*********************************************************************************************************-->
        <section class="content">
            <section class="block">
                <div class="container">
                    <div class="row">
                        <!--============ Listing Detail =============================================================-->
                        <div class="col-md-9">
                            <!--Gallery Carousel-->
                            <section>
                                <div class="gallery-carousel owl-carousel">
                                    <img src="assets/img/image-20.jpg" alt="" data-hash="1">
                                    <img src="assets/img/image-01.jpg" alt="" data-hash="2">
                                    <img src="assets/img/image-21.jpg" alt="" data-hash="3">
                                    <img src="assets/img/image-22.jpg" alt="" data-hash="4">
                                    <img src="assets/img/image-23.jpg" alt="" data-hash="5">
                                    <img src="assets/img/image-14.jpg" alt="" data-hash="6">
                                </div>
                                <div class="gallery-carousel-thumbs owl-carousel">
                                    <a href="#1" class="owl-thumb active-thumb background-image">
                                        <img src="assets/img/image-20.jpg" alt="">
                                    </a>
                                    <a href="#2" class="owl-thumb background-image">
                                        <img src="assets/img/image-01.jpg" alt="">
                                    </a>
                                    <a href="#3" class="owl-thumb background-image">
                                        <img src="assets/img/image-21.jpg" alt="">
                                    </a>
                                    <a href="#4" class="owl-thumb background-image">
                                        <img src="assets/img/image-22.jpg" alt="">
                                    </a>
                                    <a href="#5" class="owl-thumb background-image">
                                        <img src="assets/img/image-23.jpg" alt="">
                                    </a>
                                    <a href="#6" class="owl-thumb background-image">
                                        <img src="assets/img/image-14.jpg" alt="">
                                    </a>
                                </div>
                            </section>
                            <!--end Gallery Carousel-->

							<!--Author-->
							<section id="article-profile">
								<div class="row">
									<div class="col-md-12">
										<a id="article-profile-link" href="#">
											<div class="space-between">
												<div>
													<div id="article-profile-image">
														<img alt="${itemDetail.userVO.userId}"
															src="https://dnvefa72aowie.cloudfront.net/origin/profile/202111/812C55C307D33D81E0FBC697E4E7DADC17FA56C2FA09E4EB87DAA79ED6EB5FB3.jpg?q=82&amp;s=80x80&amp;t=crop">
													</div>
													<div id="article-profile-left">
														<div id="nickname">${itemDetail.userVO.userId}</div>
														<div id="region-name">${itemDetail.userVO.userAddress}</div>
													</div>
												</div>
												<div id="article-profile-right">
													<dl id="temperature-wrap">
														<!-- <dt>매너온도</dt> -->
														<dd class="text-color-04 ">
															39.7 <span>°C</span>
														</dd>
													</dl>
													<div class="meters">
														<div class=" bar bar-color-04" style="width: 40%;"></div>
													</div>
													<div class=" face face-04"></div>
												</div>
											</div>
										</a>
									</div>
								</div>
							</section>
							<!-- End Author -->

							<!--Description-->
							<section>
								<p>${itemDetail.itemContent}</p>
							</section>
							<p id="article-counts">날짜 ${itemDetail.itemCreatedAt }  ∙관심 6 ∙채팅 11 ∙조회 226</p> 
							<button type="button">채팅하기</button>
							<a href="updateForm">수정하기</a>
							<!--end Description-->
						</div>
						<!--============ End Listing Detail =========================================================-->
						<!--============ Sidebar ====================================================================-->
						<div class="col-md-3">
							<aside class="sidebar">
								<section>
									<h2>감자마켓 인기 중고</h2>
									<div class="items compact">
										<div class="item">
											<div class="ribbon-featured">Featured</div>
											<!--end ribbon-->
											<div class="wrapper">
												<div class="image">
													<h3>
														<a href="#" class="tag category">Home & Decor</a> <a
															href="single-listing-1.html" class="title">Furniture
															for sale</a>
													</h3>
													<a href="single-listing-1.html"
														class="image-wrapper background-image"> <img
														src="assets/img/image-01.jpg" alt="">
													</a>
												</div>
												<!--end image-->
												<h4 class="location">
													<a href="#">Manhattan, NY</a>
												</h4>
												<div class="price">$80</div>
												<div class="meta">
													<figure>
														<i class="fa fa-calendar-o"></i>02.05.2017
													</figure>
													<figure>
														<a href="#"> <i class="fa fa-user"></i>Jane Doe
														</a>
													</figure>
												</div>
												<!--end meta-->
											</div>
											<!--end wrapper-->
										</div>
										<!--end item-->

										<div class="item">
											<div class="wrapper">
												<div class="image">
													<h3>
														<a href="#" class="tag category">Education</a> <a
															href="single-listing-1.html" class="title">Creative
															Course</a>
													</h3>
													<a href="single-listing-1.html"
														class="image-wrapper background-image"> <img
														src="assets/img/image-02.jpg" alt="">
													</a>
												</div>
												<!--end image-->
												<h4 class="location">
													<a href="#">Nashville, TN</a>
												</h4>
												<div class="price">$125</div>
												<div class="meta">
													<figure>
														<i class="fa fa-calendar-o"></i>28.04.2017
													</figure>
													<figure>
														<a href="#"> <i class="fa fa-user"></i>Peter Browner
														</a>
													</figure>
												</div>
												<!--end meta-->
											</div>
											<!--end wrapper-->
										</div>
										<!--end item-->

										<div class="item">
											<div class="wrapper">
												<div class="image">
													<h3>
														<a href="#" class="tag category">Adventure</a> <a
															href="single-listing-1.html" class="title">Into The
															Wild</a>
													</h3>
													<a href="single-listing-1.html"
														class="image-wrapper background-image"> <img
														src="assets/img/image-03.jpg" alt="">
													</a>
												</div>
												<!--end image-->
												<h4 class="location">
													<a href="#">Seattle, WA</a>
												</h4>
												<div class="price">$1,560</div>
												<div class="meta">
													<figure>
														<i class="fa fa-calendar-o"></i>21.04.2017
													</figure>
													<figure>
														<a href="#"> <i class="fa fa-user"></i>Peak Agency
														</a>
													</figure>
												</div>
												<!--end meta-->
											</div>
										</div>
										<!--end item-->
									</div>
								</section>
							</aside>
						</div>
						<!--============ End Sidebar ================================================================-->
					</div>
				</div>
				<!--end container-->
			</section>
			<!--end block-->
		</section>
		<!--end content-->
	</div>
	<!--end page-->

	<script src="assets/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="assets/js/popper.min.js"></script>
	<script type="text/javascript"
		src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="http://maps.google.com/maps/api/js?key=AIzaSyBEDfNcQRmKQEyulDN8nGWjLYPm8s4YB58&libraries=places"></script>
	<script src="assets/js/selectize.min.js"></script>
	<script src="assets/js/icheck.min.js"></script>
	<script src="assets/js/owl.carousel.min.js"></script>
	<script src="assets/js/jquery.validate.min.js"></script>
	<script src="assets/js/custom.js"></script>

	<script>
		var latitude = 51.511971;
		var longitude = -0.137597;
		var markerImage = "assets/img/map-marker.png";
		var mapTheme = "light";
		var mapElement = "map-small";
		simpleMap(latitude, longitude, markerImage, mapTheme, mapElement);
	</script>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/user.css">

<title>Craigs - Easy Buy & Sell Listing HTML Template</title>

</head>
<body>
	<div class="page sub-page">
		<!--*********************************************************************************************************-->
		<!--************ HERO ***************************************************************************************-->
		<!--*********************************************************************************************************-->
		<header class="hero">
			<div class="hero-wrapper">
				<!--============ Main Navigation ====================================================================-->
				<div class="main-navigation">
					<div class="container">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item"><a href="#">Library</a></li>
							<li class="breadcrumb-item active">Data</li>
						</ol>
						<!--end breadcrumb-->
					</div>
					<!--end container-->
				</div>
				<!--============ End Main Navigation ================================================================-->
				<!--============ Hero Form ==========================================================================-->
				<div class="collapse" id="collapseMainSearchForm">
					<form class="hero-form form">
						<div class="container">
							<!--Main Form-->
							<div class="main-search-form">
								<div class="form-row">
									<div class="col-md-3 col-sm-3">
										<div class="form-group">
											<label for="what" class="col-form-label">What?</label> <input
												name="keyword" type="text" class="form-control small"
												id="what" placeholder="What are you looking for?">
										</div>
										<!--end form-group-->
									</div>
									<!--end col-md-3-->
									<div class="col-md-3 col-sm-3">
										<div class="form-group">
											<label for="input-location" class="col-form-label">Where?</label>
											<input name="location" type="text" class="form-control small"
												id="input-location" placeholder="Enter Location"> <span
												class="geo-location input-group-addon" data-toggle="tooltip"
												data-placement="top" title="Find My Position"><i
												class="fa fa-map-marker"></i></span>
										</div>
										<!--end form-group-->
									</div>
									<!--end col-md-3-->
									<div class="col-md-3 col-sm-3">
										<div class="form-group">
											<label for="category" class="col-form-label">Category?</label>
											<select name="category" id="category" class="small"
												data-placeholder="Select Category">
												<option value="">Select Category</option>
												<option value="1">Computers</option>
												<option value="2">Real Estate</option>
												<option value="3">Cars & Motorcycles</option>
												<option value="4">Furniture</option>
												<option value="5">Pets & Animals</option>
											</select>
										</div>
										<!--end form-group-->
									</div>
									<!--end col-md-3-->
									<div class="col-md-3 col-sm-3">
										<button type="submit" class="btn btn-primary width-100 small">Search</button>
									</div>
									<!--end col-md-3-->
								</div>
								<!--end form-row-->
							</div>
							<!--end main-search-form-->
							<!--Alternative Form-->
							<div class="alternative-search-form">
								<a href="#collapseAlternativeSearchForm" class="icon"
									data-toggle="collapse" aria-expanded="false"
									aria-controls="collapseAlternativeSearchForm"><i
									class="fa fa-plus"></i>More Options</a>
								<div class="collapse" id="collapseAlternativeSearchForm">
									<div class="wrapper">
										<div class="form-row">
											<div
												class="col-xl-6 col-lg-12 col-md-12 col-sm-12 d-xs-grid d-flex align-items-center justify-content-between">
												<label> <input type="checkbox" name="new">
													New
												</label> <label> <input type="checkbox" name="used">
													Used
												</label> <label> <input type="checkbox" name="with_photo">
													With Photo
												</label> <label> <input type="checkbox" name="featured">
													Featured
												</label>
											</div>
											<!--end col-xl-6-->
											<div class="col-xl-6 col-lg-12 col-md-12 col-sm-12">
												<div class="form-row">
													<div class="col-md-4 col-sm-4">
														<div class="form-group">
															<input name="min_price" type="text"
																class="form-control small" id="min-price"
																placeholder="Minimal Price"> <span
																class="input-group-addon small">$</span>
														</div>
														<!--end form-group-->
													</div>
													<!--end col-md-4-->
													<div class="col-md-4 col-sm-4">
														<div class="form-group">
															<input name="max_price" type="text"
																class="form-control small" id="max-price"
																placeholder="Maximal Price"> <span
																class="input-group-addon small">$</span>
														</div>
														<!--end form-group-->
													</div>
													<!--end col-md-4-->
													<div class="col-md-4 col-sm-4">
														<div class="form-group">
															<select name="distance" id="distance" class="small"
																data-placeholder="Distance">
																<option value="">Distance</option>
																<option value="1">1km</option>
																<option value="2">5km</option>
																<option value="3">10km</option>
																<option value="4">50km</option>
																<option value="5">100km</option>
															</select>
														</div>
														<!--end form-group-->
													</div>
													<!--end col-md-3-->
												</div>
												<!--end form-row-->
											</div>
											<!--end col-xl-6-->
										</div>
										<!--end row-->
									</div>
									<!--end wrapper-->
								</div>
								<!--end collapse-->
							</div>
							<!--end alternative-search-form-->
						</div>
						<!--end container-->
					</form>
					<!--end hero-form-->
				</div>
				<!--end collapse-->
				<!--============ End Hero Form ======================================================================-->
				<!--============ Page Title =========================================================================-->
				<div class="page-title">
					<div class="container">
						<h1>My Profile</h1>
					</div>
					<!--end container-->
				</div>
				<!--============ End Page Title =====================================================================-->
				<div class="background"></div>
				<!--end background-->
			</div>
			<!--end hero-wrapper-->
		</header>
		<!--end hero-->

		<!--*********************************************************************************************************-->
		<!--************ CONTENT ************************************************************************************-->
		<!--*********************************************************************************************************-->
		<section class="content">
			<section class="block">
				<div class="container">
					<div class="row">
						<div class="col-md-3">
							<%@ include file="sidebar.jsp" %>
						</div>
						<!--end col-md-3-->
						<div class="col-md-9">
							<form class="form">
								<div class="row">
									<div class="col-md-12">
										<section id="content">
										<!-- Author -->
											<section id="user-profile">
											<div class="space-between">
													<div>
													<h2 id="nickname">
														kosta224
													</h2>
														 <span style="padding-left:80px;" id="region_name">서울시 강남구 개포동</span>
													</div>
													<div id="user-profile-right">
													<ul id="profile-detail">
														<li class="profile-detail-title"><span class="fa fa-heart-o"></span> 재거래희망률 <span
															class="profile-detail-count">100%</span></li>
														<li class="profile-detail-title"><span class="fa fa-comment-o"></span> 응답률 <span
															class="profile-detail-count">100 %</span></li>
													</ul>
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
													<div id="profile-image">
														<img alt="hola17"
															src="https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-7e50c459a71e0e88c474406a45bbbdce8a3bf2ed4f2efcae59a064e39ea9ff30.png">
													</div>
												</div>
											</section>
										<!--============ End Author ======================================================================-->
										
											<div id="user-records-detail">
												<section id="user-filter">
													<ul>
														<li><a class="active" href="/u/VlqYm7Wj8AG0B6G9">판매 물품 (1)</a></li>
														<li><a class=""
															href="#">거래 후기 (0)</a></li>
														<li><a class="" href="/u/VlqYm7Wj8AG0B6G9?kind=manners">매너 칭찬</a></li>
													</ul>
												</section>
												<!-- item list start -->
												<!-- 	<div class="items masonry grid-xl-4-items grid-lg-4-items grid-md-2-items"> -->
												<!-- 		<div class="items masonry grid-xl-2-items grid-lg-2-items grid-md-1-items">
													<div class="item">
														<div class="ribbon-featured">Featured</div>
														end ribbon
														<div class="wrapper">
															<div class="image">
																<h3>
																	<a href="#" class="tag category">Real Estate</a> <a
																		href="single-listing-1.html" class="title">자바의 정석</a>
																	 <span onclick="location.href='single-listing-1.html'" class="tag">책</span>
																</h3>
																<a href="single-listing-1.html"
																	class="image-wrapper background-image"> <img
																	src="assets/img/image-01.jpg" alt="">
																</a>
															</div>
															end image
															<h4 class="location">
																<a href="#">서울시 강남구 개포동</a>
															</h4>
															<div class="price">10000원</div>
															<div class="meta">
																<figure>
																	<i class="fa fa-calendar-o"></i>관심 17
																</figure>
																<figure>
																	<a href="#"> <i class="fa fa-user"></i>채팅 14
																	</a>
																</figure>
															</div>
															end meta
														</div>
													</div>
													end item
													<div class="item">
														<div class="wrapper">
															<div class="image">
																<h3>
																	<a href="#" class="tag category">Adventure</a> <a
																		href="single-listing-1.html" class="title">Into
																		The Wild</a>
																</h3>
																<a href="single-listing-1.html"
																	class="image-wrapper background-image"> <img
																	src="assets/img/image-03.jpg" alt="">
																</a>
															</div>
															end image
															<h4 class="location">
																<a href="#">서울시 강남구 개포동</a>
															</h4>
															<div class="price">10000원</div>
															<div class="meta">
																<figure>
																	<i class="fa fa-calendar-o"></i>관심 17
																</figure>
																<figure>
																	<a href="#"> <i class="fa fa-user"></i>채팅 14
																	</a>
																</figure>
															</div>
															end meta
														</div>
													</div>
													end item

													<div class="item">
														<div class="wrapper">
															<div class="image">
																<h3>
																	<a href="#" class="tag category">Real Estate</a> <a
																		href="single-listing-1.html" class="title">Luxury
																		Apartment</a>
																</h3>
																<a href="single-listing-1.html"
																	class="image-wrapper background-image"> <img
																	src="assets/img/image-04.jpg" alt="">
																</a>
															</div>
															end image
															<h4 class="location">
																<a href="#">Greeley, CO</a>
															</h4>
															<div class="price">$75,000</div>
															<div class="meta">
																<figure>
																	<i class="fa fa-calendar-o"></i>13.03.2017
																</figure>
																<figure>
																	<a href="#"> <i class="fa fa-user"></i>Hills Estate
																	</a>
																</figure>
															</div>
															end meta
														</div>
													</div>
													end item
												</div> -->
												<!--============ End Items ======================================================================-->
												<section id="user-records" class="user-articles" data-total-page="1" data-current-page="1">
													<section class="cards-wrap">
														<article class="card ">
															<a class="card-link " data-event-label="319659831"
																href="/articles/319659831">
																<div class="card-photo ">
																	<img alt="두둘~세돌 아기 신발(크록스, POLO, 나이키, 뉴발란스 등등)"
																		src="https://dnvefa72aowie.cloudfront.net/origin/article/202111/A17F8AD8BEF13E00F4421542897F4D3181E98A7F3D6A101DC19B329F329624FB.jpg?q=82&amp;s=300x300&amp;t=crop">
																</div>
																<div class="card-desc">
																	<h2 class="card-title">두둘~세돌 아기 신발(크록스, POLO, 나이키,
																		뉴발란스 등등)</h2>
																	<div class="card-price ">5,000원</div>
																	<div class="card-region-name">서울시 강남구 개포동</div>
																	<div class="card-counts">
																		<span> 관심 0 </span> ∙ <span> 채팅 0 </span>
																	</div>
																</div>
															</a>
														</article>
														<article class="card ">
															<a class="card-link " data-event-label="200980299"
																href="/articles/200980299">
																<div class="card-photo ">
																	<img alt="돌전후아이옷1(잠바, 스웨터, 티, 후드티)"
																		src="https://dnvefa72aowie.cloudfront.net/origin/article/202103/0724C3FED01FC11D84F5DF330F4AD36840156E0E853E07B0B3926A4C40D16F4F.jpg?q=82&amp;s=300x300&amp;t=crop">
																</div>
																<div class="card-desc">
																	<h2 class="card-title">돌전후아이옷1(잠바, 스웨터, 티, 후드티)</h2>
																	<div class="card-price ">1,500원</div>
																	<div class="card-region-name">서울시 강남구 개포동</div>
																	<div class="card-counts">
																		<span> 관심 4 </span> ∙ <span> 채팅 0 </span>
																	</div>
																</div>
															</a>
														</article>
														<article class="card ">
															<a class="card-link " data-event-label="200981011"
																href="/articles/200981011">
																<div class="card-photo ">
																	<img alt="돌전후아이옷2(잠바, 스웨터, 티, 후드티)"
																		src="https://dnvefa72aowie.cloudfront.net/origin/article/202103/94006D1328C5CB680B920DCC92C3140D1E3DEE26BDF65E51645BD036DC86985C.jpg?q=82&amp;s=300x300&amp;t=crop">
																</div>
																<div class="card-desc">
																	<h2 class="card-title">돌전후아이옷2(잠바, 스웨터, 티, 후드티)</h2>
																	<div class="card-price ">1,500원</div>
																	<div class="card-region-name">서울시 강남구 개포동</div>
																	<div class="card-counts">
																		<span> 관심 0 </span> ∙ <span> 채팅 0 </span>
																	</div>
																</div>
															</a>
														</article>
													</section>
												</section>
													<!--============ End Items ======================================================================-->
											</div>
											<div id="loading" style="display: none;">
												<div class="animation"></div>
											</div>
										</section>
									</div>
									<!--end col-md-8-->

									<!--end col-md-3-->
								</div>
							</form>
						</div>
					</div>
					<!--end row-->
				</div>
				<!--end container-->
			</section>
			<!--end block-->
		</section>
		<!--end content-->

		<!--*********************************************************************************************************-->
		<!--************ FOOTER *************************************************************************************-->
		<!--*********************************************************************************************************-->
		<footer class="footer">
			<div class="wrapper">
				<div class="container">
					<div class="row">
						<div class="col-md-5">
							<a href="#" class="brand"> <img src="assets/img/logo.png"
								alt="">
							</a>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Ut nec tincidunt arcu, sit amet fermentum sem. Class aptent
								taciti sociosqu ad litora torquent per conubia nostra.</p>
						</div>
						<!--end col-md-5-->
						<div class="col-md-3">
							<h2>Navigation</h2>
							<div class="row">
								<div class="col-md-6 col-sm-6">
									<nav>
										<ul class="list-unstyled">
											<li><a href="#">Home</a></li>
											<li><a href="#">Listing</a></li>
											<li><a href="#">Pages</a></li>
											<li><a href="#">Extras</a></li>
											<li><a href="#">Contact</a></li>
											<li><a href="#">Submit Ad</a></li>
										</ul>
									</nav>
								</div>
								<div class="col-md-6 col-sm-6">
									<nav>
										<ul class="list-unstyled">
											<li><a href="#">My Ads</a></li>
											<li><a href="#">Sign In</a></li>
											<li><a href="#">Register</a></li>
										</ul>
									</nav>
								</div>
							</div>
						</div>
						<!--end col-md-3-->
						<div class="col-md-4">
							<h2>Contact</h2>
							<address>
								<figure>
									124 Abia Martin Drive
									<br> New York, NY 10011
								</figure>
								<br> <strong>Email:</strong> <a href="#">hello@example.com</a>
								<br> <strong>Skype: </strong> Craigs <br> <br> <a
									href="contact.html"
									class="btn btn-primary text-caps btn-framed">Contact Us</a>
							</address>
						</div>
						<!--end col-md-4-->
					</div>
					<!--end row-->
				</div>
				<div class="background">
					<div class="background-image original-size">
						<img src="assets/img/footer-background-icons.jpg" alt="">
					</div>
					<!--end background-image-->
				</div>
				<!--end background-->
			</div>
		</footer>
		<!--end footer-->
	</div>
	<!--end page-->
</body>
</html>

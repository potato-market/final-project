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
						<h1>Bookmarks</h1>
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
							<%@ include file="sidebar.jsp"%>
						</div>
						<!--end col-md-3-->
						<div class="col-md-9">
							<!--============ Section Title===================================================================-->
							<div class="section-title clearfix">
								<div class="float-left float-xs-none">
									<label class="mr-3 align-text-bottom">Sort by: </label> <select
										name="sorting" id="sorting" class="small width-200px"
										data-placeholder="Default Sorting">
										<option value="">Default Sorting</option>
										<option value="1">Newest First</option>
										<option value="2">Oldest First</option>
										<option value="3">Lowest Price First</option>
										<option value="4">Highest Price First</option>
									</select>

								</div>
								<div class="float-right d-xs-none thumbnail-toggle">
									<a href="#" class="change-class" data-change-from-class="list"
										data-change-to-class="grid" data-parent-class="items"> <i
										class="fa fa-th"></i>
									</a> <a href="#" class="change-class active"
										data-change-from-class="grid" data-change-to-class="list"
										data-parent-class="items"> <i class="fa fa-th-list"></i>
									</a>
								</div>
							</div>
							<!--============ Items ==========================================================================-->
							<div
								class="items list compact grid-xl-3-items grid-lg-3-items grid-md-2-items">
								<div class="item">
									<div class="ribbon-vertical">
										<i class="fa fa-star"></i>
									</div>
									<!--end ribbon-vertical-->
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
										<a href="single-listing-1.html"
											class="detail text-caps underline">Detail</a>
									</div>
								</div>
								<!--end item-->
							</div>
							<!--end items-->
							<!--============ End Items ==============================================================-->
							<div class="page-pagination">
								<nav aria-label="Pagination">
									<ul class="pagination">
										<li class="page-item"><a class="page-link" href="#"
											aria-label="Previous"> <span aria-hidden="true"> <i
													class="fa fa-chevron-left"></i>
											</span> <span class="sr-only">Previous</span>
										</a></li>
										<li class="page-item active"><a class="page-link"
											href="#">1</a></li>
										<li class="page-item"><a class="page-link" href="#">2</a>
										</li>
										<li class="page-item"><a class="page-link" href="#">3</a>
										</li>
										<li class="page-item"><a class="page-link" href="#"
											aria-label="Next"> <span aria-hidden="true"> <i
													class="fa fa-chevron-right"></i>
											</span> <span class="sr-only">Next</span>
										</a></li>
									</ul>
								</nav>
							</div>
							<!--end page-pagination-->
						</div>
						<!--end col-md-9-->
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

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
							<%@ include file="sidebar.jsp"%>
						</div>
						<!--end col-md-3-->
						<div class="col-md-9">
							<form class="form">
								<div class="row">
									<div class="col-md-8">
										<h3>회원정보 변경</h3>
										<section>
											<div class="row">
												<div class="col-md-4">
													<div class="form-group">
														<label for="name" class="col-form-label required">Your
															Name</label> <input name="name" type="text" class="form-control"
															id="name" placeholder="Your Name" value="Jane Doe"
															required>
													</div>
													<!--end form-group-->
												</div>
												<div class="col-md-8">
													<div class="form-group">
														<label for="title" class="col-form-label">Location</label>
														<select name="title" id="title" data-placeholder="Title">
															<option value="">Title</option>
															<option value="1" selected>Mrs</option>
															<option value="2">Mr</option>
														</select>
													</div>
													<!--end form-group-->
												</div>
												<!--end col-md-8-->
											</div>
											<!--end row-->
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label for="phone" class="col-form-label">Phone</label> <input
															name="phone" type="text" class="form-control" id="phone"
															placeholder="Your Phone" value="312-238-3329">
													</div>
													<!--end form-group-->
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label for="email" class="col-form-label">Email</label> <input
															name="email" type="email" class="form-control" id="email"
															placeholder="Your Email" value="jane.doe@example.com">
													</div>
													<!--end form-group-->
												</div>
											</div>
											<button type="submit" class="btn btn-primary float-right">Save
												Changes</button>
										</section>
										<!-- <section class="clearfix">
										</section> -->
									</div>
									<!--end col-md-8-->
									<div class="col-md-4">
										<div class="profile-image">
											<div class="image background-image">
												<img src="assets/img/author-09.jpg" alt="">
											</div>
											<div class="single-file-input">
												<input type="file" id="user_image" name="user_image">
												<div class="btn btn-framed btn-primary small">Upload a
													picture</div>
											</div>
										</div>
									</div>
									<!--end col-md-3-->
								</div>
							</form>
						</div>
						<div class="col-md-12" style="margin-top: 20px;">
							<form class="form">
								<div class="row justify-content-center">
									<div class="col-md-6">
										<h3>비밀번호 변경</h3>
										<div class="form-group">
											<label for="current_password" class="col-form-label required">Current
												Password</label> <input name="current_password" type="password"
												class="form-control" id="current_password"
												placeholder="Current Password" required>
										</div>
										<!--end form-group-->
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label for="new_current_password"
														class="col-form-label required">New Password</label> <input
														name="new_current_password" type="password"
														class="form-control" id="new_current_password"
														placeholder="New Password" required>
												</div>
												<!--end form-group-->
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="repeat_new_current_password"
														class="col-form-label required">Repeat Password</label> <input
														name="repeat_new_current_password" type="password"
														class="form-control" id="repeat_new_current_password"
														placeholder="Repeat New Password" required>
												</div>
												<!--end form-group-->
											</div>
										</div>
										<button type="submit" class="btn btn-primary float-right">Change
											Password</button>
									</div>
									<!--end col-md-6-->
								</div>
							</form>
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

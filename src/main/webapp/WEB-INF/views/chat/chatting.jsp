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
						<h1>Messages</h1>
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
						<div class="col-md-6 col-lg-6 col-xl-5">
							<!--============ Section Title===========================================================-->
							<div class="section-title clearfix">
								<h3>People</h3>
							</div>
							<div id="messaging__chat-list" class="messaging__box">
								<div class="messaging__header">
									<ul class="nav nav-pills">
										<li class="nav-item"><a class="nav-link active" href="#">All</a>
										</li>
										<li class="nav-item"><a class="nav-link" href="#">Buyers</a>
										</li>
										<li class="nav-item"><a class="nav-link" href="#">Sellers</a>
										</li>
										<li class="nav-item"><a class="nav-link" href="#">Blocked</a>
										</li>
									</ul>
								</div>
								<div class="messaging__content">
									<ul class="messaging__persons-list">
										<li><a href="#" class="messaging__person">
												<figure class="messaging__image-person"
													data-background-image="assets/img/author-01.jpg"></figure>
												<figure class="content">
													<h5>
														Jane Brown &nbsp&nbsp&nbsp<small>대치동</small>
														&nbsp&nbsp&nbsp<small>24 Hour Ago</small>
													</h5>
													<p>Lorem ipsum dolor sit amet, consectetur adipiscing
														elit. Ut</p>
												</figure>
												<figure class="messaging__image-item"
													data-background-image="assets/img/image-01.jpg"></figure>
										</a> <!--messaging__person--></li>
										<li><a href="#" class="messaging__person">
												<figure class="messaging__image-person"
													data-background-image="assets/img/author-01.jpg"></figure>
												<figure class="content">
													<h5>
														Jane Brown &nbsp&nbsp&nbsp<small>대치동</small>
														&nbsp&nbsp&nbsp<small>24 Hour Ago</small>
													</h5>
													<p>Lorem ipsum dolor sit amet, consectetur adipiscing
														elit. Ut</p>
												</figure>
												<figure class="messaging__image-item"
													data-background-image="assets/img/image-01.jpg"></figure>
										</a> <!--messaging__person--></li>
										<li><a href="#" class="messaging__person">
												<figure class="messaging__image-person"
													data-background-image="assets/img/author-01.jpg"></figure>
												<figure class="content">
													<h5>
														Jane Brown &nbsp&nbsp&nbsp<small>대치동</small>
														&nbsp&nbsp&nbsp<small>24 Hour Ago</small>
													</h5>
													<p>Lorem ipsum dolor sit amet, consectetur adipiscing
														elit. Ut</p>
												</figure>
												<figure class="messaging__image-item"
													data-background-image="assets/img/image-01.jpg"></figure>
										</a> <!--messaging__person--></li>
										<li><a href="#" class="messaging__person">
												<figure class="messaging__image-person"
													data-background-image="assets/img/author-01.jpg"></figure>
												<figure class="content">
													<h5>
														Jane Brown &nbsp&nbsp&nbsp<small>대치동</small>
														&nbsp&nbsp&nbsp<small>24 Hour Ago</small>
													</h5>
													<p>Lorem ipsum dolor sit amet, consectetur adipiscing
														elit. Ut</p>
												</figure>
												<figure class="messaging__image-item"
													data-background-image="assets/img/image-01.jpg"></figure>
										</a> <!--messaging__person--></li>
										<li><a href="#" class="messaging__person">
												<figure class="messaging__image-person"
													data-background-image="assets/img/author-01.jpg"></figure>
												<figure class="content">
													<h5>
														Jane Brown &nbsp&nbsp&nbsp<small>대치동</small>
														&nbsp&nbsp&nbsp<small>24 Hour Ago</small>
													</h5>
													<p>Lorem ipsum dolor sit amet, consectetur adipiscing
														elit. Ut</p>
												</figure>
												<figure class="messaging__image-item"
													data-background-image="assets/img/image-01.jpg"></figure>
										</a> <!--messaging__person--></li>
										<li><a href="#" class="messaging__person">
												<figure class="messaging__image-person"
													data-background-image="assets/img/author-01.jpg"></figure>
												<figure class="content">
													<h5>
														Jane Brown &nbsp&nbsp&nbsp<small>대치동</small>
														&nbsp&nbsp&nbsp<small>24 Hour Ago</small>
													</h5>
													<p>Lorem ipsum dolor sit amet, consectetur adipiscing
														elit. Ut</p>
												</figure>
												<figure class="messaging__image-item"
													data-background-image="assets/img/image-01.jpg"></figure>
										</a> <!--messaging__person--></li>
									</ul>
									<!--end messaging__persons-list-->
								</div>
								<!--messaging__content-->
							</div>
							<!--end section-title-->
						</div>
						<!--end col-md-3-->
						<div class="col-md-6 col-lg-6 col-xl-7">
							<!--============ Section Title===========================================================-->
							<div class="section-title clearfix">
								<h3>Message Window</h3>
							</div>
							<!--end section-title-->
							<div id="messaging__chat-window" class="messaging__box">
								<div class="messaging__header">
									<div class="float-left flex-row-reverse messaging__person">
										<h5 class="font-weight-bold">Rosina Warner</h5>
										<figure class="mr-4 messaging__image-person"
											data-background-image="assets/img/author-02.jpg"></figure>
									</div>
								</div>
								<div class="messaging__content"
									data-background-color="rgba(0,0,0,.05)">
									<div class="messaging__main-chat">

										<div class="messaging__main-chat__bubble">
											<p>
												Curabitur vel venenatis sem. Fusce suscipit pharetra nisl,
												sit amet blandit sem sollicitudin ac. <small>24 hour
													ago</small>
											</p>
										</div>
										<div class="messaging__main-chat__bubble">
											<p>
												Vivamus laoreet nisl a odio commodo varius. Donec arcu
												mauris, molestie a euismod at, mattis eu arcu. Cras
												volutpat, velit sit amet cursus molestie, ex ipsum sagittis
												urna, vitae auctor augue erat eget justo. Sed dignissim
												lacus risus, ut blandit nunc volutpat quis. Fusce porta
												semper nisi, quis lobortis nulla ultricies ac. <small>24
													hour ago</small>
											</p>
										</div>
										<div class="messaging__main-chat__bubble user">
											<p>
												Cras volutpat, velit sit amet cursus molestie, ex ipsum
												sagittis urna, vitae auctor augue erat eget justo. Sed
												dignissim lacus risus, ut blandit nunc <small>24
													hour ago</small>
											</p>
										</div>
										<div class="messaging__main-chat__bubble user">
											<p>
												Sed dignissim lacus risus, ut blandit nunc <small>24
													hour ago</small>
											</p>
										</div>
										<div class="messaging__main-chat__bubble">
											<p>
												Donec consequat lobortis erat non tempus. Quisque id
												accumsan velit. Nullam mollis bibendum ex. Integer egestas
												nisi nulla, ut tempus mi euismod in <small>24 hour
													ago</small>
											</p>
										</div>
										<div class="messaging__main-chat__bubble user">
											<p>
												Quisque id accumsan velit. Nullam mollis bibendum ex.
												Integer egestas nisi nulla, ut tempus mi euismod in <small>24
													hour ago</small>
											</p>
										</div>
									</div>
								</div>
								<div class="messaging__footer">
									<form class="form">
										<div class="input-group">
											<input type="text" class="form-control mr-4"
												placeholder="Your Message">
											<div class="input-group-append">
												<button class="btn btn-primary" type="submit">
													Send <i class="fa fa-send ml-3"></i>
												</button>
											</div>
										</div>
									</form>
								</div>
							</div>
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
	</div>
	<!--end page-->
	<script>
		$("#messaging__chat-window .messaging__content").scrollTop(
				$(".messaging__content")[0].scrollHeight);
	</script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authentication property="principal.userId" var="userId" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
<script src="assets/js/admin.js"></script>
<title>admin main</title>
</head>
<body>
	<div id="myNav" class="overlay">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<div class="overlay-content">
			<a href="userManagement">관리자</a> <a href="categoryManagement">카테고리</a>
			<a href="faqManagement">FAQ</a>
		</div>
	</div>

	<header class="hero" style="content: none;">
		<div class="hero-wrapper" style="padding-bottom: 0rem;">
			<!--============ Secondary Navigation ===============================================================-->
			<div class="secondary-navigation">
				<div class="container">
				<ul class="left"><li><a href="main"> <i class="fa fa-home"></i>Home
						</a></li></ul>
					<ul class="right">
						<li><a id="managingBtn" href="#"> <i class="fa fa-wrench"></i>관리
						</a></li>
						<li><a href="#" id="logoutAction"> <i
								class="fa fa-sign-in"></i>Sign Out
						</a></li>
					</ul>
					<form id="logoutForm" action="/logout" method="post">
						<sec:csrfInput />
					</form>
					<!--end right-->
				</div>
				<!--end container-->
			</div>
			<!--============ End Secondary Navigation ===========================================================-->
		</div>
	</header>

	<div class="page sub-page">
		<!--============ Page Title =========================================================================-->
		<div class="page-title">
			<div class="container">
				<h1>관리자</h1>
				<h4 style="margin-top: 10px;">
					<a href="https://github.com/potato-market/final-project">Git Hub project으로
						이동</a>
				</h4>
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
				<!--============ Items ==========================================================================-->
				<div class="authors masonry items grid-xl-5-items grid-lg-5-items grid-md-5-items" style="margin-left: -2rem; margin-right: -3.5rem">
					<div class="item author" style="padding-right:1rem; padding-left:1rem;">
						<div class="wrapper">
							<div class="image">
							 <img src="assets/img/용은2.png" alt="" style="height:250px; width:200px; margin:5px;">
							</div>
							<!--end image-->
							<div class="additional-info">
									<p style="height:10px;overflow:visible;">권용은</p>
								<ul>
									<li style="padding-bottom: 10px;">
									<figure>Main developer </figure><aside><a>&nbsp</a></aside>
										<aside>
											<a href="https://github.com/jenkwon92">https://github.com/jenkwon92</a>
										</aside>
									</li>
								</ul>
							</div>
							<!--end addition-info-->
						</div>
					</div>
					<!--============ End Item===============-->
					
						<div class="item author" style="padding-right:1rem; padding-left:1rem;">
						<div class="wrapper">
							<div class="image">
							 <img src="assets/img/정훈.png" alt="" style="height:250px; width:200px; margin:5px;">
							</div>
							<!--end image-->
							<div class="additional-info">
									<p style="height:10px;overflow:visible;">김정훈</p>
								<ul>
									<li style="padding-bottom: 10px;">
									<figure>Main developer </figure><aside><a>&nbsp</a></aside>
										<aside>
											<a href="https://github.com/anngdung2">https://github.com/anngdung2</a>
										</aside>
									</li>
								</ul>
							</div>
							<!--end addition-info-->
						</div>
					</div>
					<!--============ End Item===============-->
					
						<div class="item author" style="padding-right:1rem; padding-left:1rem;">
						<div class="wrapper">
							<div class="image">
							 <img src="assets/img/건홍.PNG" alt="" style="height:250px; width:200px; margin:5px;">
							</div>
							<!--end image-->
							<div class="additional-info">
									<p style="height:10px;overflow:visible;">민건홍</p>
								<ul>
									<li style="padding-bottom: 10px;">
									<figure>Main developer </figure><aside><a>&nbsp</a></aside>
										<aside>
											<a href="https://github.com/Gunhong">https://github.com/Gunhong</a>
										</aside>
									</li>
								</ul>
							</div>
							<!--end addition-info-->
						</div>
					</div>
					<!--============ End Item===============-->
					
						<div class="item author" style="padding-right:1rem; padding-left:1rem;">
						<div class="wrapper">
							<div class="image">
							 <img src="assets/img/기랑.PNG" alt="" style="height:250px; width:200px; margin:5px;">
							</div>
							<!--end image-->
							<div class="additional-info">
									<p style="height:10px;overflow:visible;">박기랑</p>
								<ul>
									<li style="padding-bottom: 10px;">
									<figure>Main developer </figure><aside><a>&nbsp</a></aside>
										<aside>
											<a href="https://github.com/cecyrang">https://github.com/cecyrang</a>
										</aside>
									</li>
								</ul>
							</div>
							<!--end addition-info-->
						</div>
					</div>
					<!--============ End Item===============-->
					
						<div class="item author" style="padding-right:1rem; padding-left:1rem;">
						<div class="wrapper">
							<div class="image">
							 <img src="assets/img/정민.jpg" alt="" style="height:250px; width:200px; margin:5px;">
							</div>
							<!--end image-->
							<div class="additional-info">
									<p style="height:10px;overflow:visible;">이정민</p>
								<ul>
									<li style="padding-bottom: 10px;">
									<figure>Main developer </figure><aside><a>&nbsp</a></aside>
										<aside>
											<a href="https://github.com/leetingman">https://github.com/leetingman</a>
										</aside>
									</li>
								</ul>
							</div>
							<!--end addition-info-->
						</div>
					</div>
					<!--============ End Item===============-->
					
					
					
				</div>
				<!--============ End Items ======================================================================-->
			</div>
			<!--end container-->
		</section>
		<!--end block-->
	</section>
	<!--end content-->

	</div>
	<!--end page-->
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authentication property="principal.userId" var="userId" />
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
							<div class="number">${itemDetail.itemPrice}원</div>
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
								<c:forEach var="kwon" items="${imageList }" varStatus="status"> 
									 			<img src="assets/upload/${kwon.imageName}" alt=""
											data-hash="${status.index} style="width:510px; height:390px;" >
								</c:forEach>
									</div>
									 
										<div class="gallery-carousel-thumbs owl-carousel">
									<c:forEach var="kwon" items="${imageList }" varStatus="status">
										<a href="#"+"${status.index }"
											class="owl-thumb active-thumb background-image"> <img
										src="assets/upload/${kwon.imageName}" alt="">
									</a>
								</c:forEach>
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
														<img alt=""
															src="assets/upload/${itemDetail.userVO.userImage}">
														
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
						<p id="article-counts">날짜 ${itemDetail.itemCreatedAt }  ∙관심 6 
								∙채팅 ${crnum} ∙조회  ${itemDetail.itemHit}</p> 
							<c:choose>
							<c:when test="${userId ne itemDetail.userVO.userId}">
							<form action="chatForm">
								<input type="hidden" name="userId" value="${userId}" > 								 
								<input type="hidden" name="sellerId" value="${itemDetail.userVO.userId }" > 
								<input type="hidden" name="itemId" value="${itemDetail.itemId}" >
								<button type="submit" class="btn btn-primary width-100">채팅하기</button>
							</form>
							</c:when>
							<c:otherwise>
							<!-- 수정하기 -->
							<form action="updateForm">
								<input type="hidden" name="itemId" value="${itemDetail.itemId}">
								<button type="submit" class="btn btn-primary width-100">수정하기</button>
							</form>
							<br />
							<!-- 삭제하기 -->
							<form action="deleteItem" method="post">
								<sec:csrfInput />
								<input type="hidden" name="itemId" value="${itemDetail.itemId}">
								<button type="submit" class="btn btn-primary width-100">삭제하기</button>
							</form>
							</c:otherwise>
							</c:choose>
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
</body>
</html>

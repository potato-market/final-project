<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
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
				<!--============ Page Title =========================================================================-->
				<div class="page-title">
					<div class="container">
						<h1>동네생활</h1>
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
					<div class="row flex-column-reverse flex-md-row">
						<div class="col-md-12">
							<!--============ Section Title===================================================================-->
							<div class="section-title clearfix">
								<div
									class="float-right float-xs-none d-xs-none">
									<a href="communityWriteForm" > 글쓰기</a> 
								</div>
							</div>
							<!--============ Items ==========================================================================-->
							<div
								class="items list compact grid-xl-3-items grid-lg-3-items grid-md-2-items">
								<c:forEach var="l" items="${list }">
								<div class="item">
									<div class="wrapper"
										onclick="location.href='communityDetail?communityId=${l.communityId}'">
										<h3>
											<a href="communityBoard" class="tag category">동네생활</a>
										</h3>
										<!--end image-->
										<div class="meta2" id="community_figure">
											<figure>
												<i class="fa fa-user"> ${l.userVO.userId }</i>&nbsp
												<i class="fa fa-map-marker"> ${l.userVO.userAddress }</i>&nbsp
											</figure>
										</div>
										<!--end meta-->
										<div class="description" style="height: 9rem;">
											<p style="width: 100%;">
												<i class="fa fa-question"></i> ${l.communityContent }
											</p>
										</div>
										<!--end description-->
										<a href="communityDetail?communityId=${l.communityId}"
											class="detail text-caps underline">댓글쓰기</a>
									</div>
								</div>
								<!--end item-->
								</c:forEach>
							</div>
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
						<!--end col-md-12-->
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
</body>
</html>

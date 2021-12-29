<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/user.css">

<title>감자마켓</title>
</head>
<body>
	<div class="page home-page">
		<!--*********************************************************************************************************-->
		<!--************ HERO ***************************************************************************************-->
		<!--*********************************************************************************************************-->
		<header class="hero">
			<div class="hero-wrapper">
				<!--============ Page Title =========================================================================-->
				<div class="page-title">
					<div class="container">
						<h1 class="opacity-40 center">
							<a href="#">Buy</a>, <a href="#">Sell</a> or <a href="#">Find</a>
							What You need
						</h1>
					</div>
					<!--end container-->
				</div>
				<!--============ End Page Title =====================================================================-->
				<!--============ Hero Form ==========================================================================-->
				<form class="hero-form form">
					<div class="container">
						<!--Main Form-->
						<div class="main-search-form">
							<div class="form-row">
								<div class="col-md-3 col-sm-3">
									<div class="form-group">
										<label for="what" class="col-form-label">What?</label> <input
											name="keyword" type="text" class="form-control" id="what"
											placeholder="What are you looking for?">
									</div>
									<!--end form-group-->
								</div>
								<!--end col-md-3-->
								<div class="col-md-3 col-sm-3">
									<div class="form-group">
										<label for="input-location" class="col-form-label">Where?</label>
										<select name="location" id="location"
											data-placeholder="Select Loction">
											<option value="">내 동네 설정</option>
											<option value="1">삼성동</option>
											<option value="2">개포동</option>
										</select>
									</div>
									<!--end form-group-->
								</div>
								<!--end col-md-3-->
								<div class="col-md-3 col-sm-3">
									<div class="form-group">
										<label for="category" class="col-form-label">Category?</label>
										<select name="category" id="category"
											data-placeholder="Select Category">
											<option value="">Select Category</option>
											<option value="1">디지털기기</option>
											<option value="2">생활가전</option>
											<option value="3">가구/인테리어</option>
											<option value="4">유아동</option>
											<option value="5">생활/가공식품</option>
											<option value="6">유아도서</option>
											<option value="7">스포츠/레저</option>
											<option value="8">여성잡화</option>
											<option value="9">여성의류</option>
											<option value="10">남성패션/잡화</option>
											<option value="11">게임/취미</option>
											<option value="12">뷰티/미용</option>
											<option value="13">반려동물용품</option>
											<option value="14">도서/티켓/음반</option>
											<option value="15">식물</option>
											<option value="16">기타 중고물품</option>
											<option value="17">삽니다</option>
										</select>
									</div>
									<!--end form-group-->
								</div>
								<!--end col-md-3-->
								<div class="col-md-3 col-sm-3">
									<button type="submit" class="btn btn-primary width-100">Search</button>
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
								class="fa fa-plus"></i>최근 검색어</a>
							<div class="collapse" id="collapseAlternativeSearchForm">
								<div class="wrapper">
									<div class="form-row" style="overflow: hidden;">
										<div
											class="col-xl-12 col-lg-12 col-md-12 col-sm-12 d-xs-grid d-flex align-items-center justify-content-between">
											<div>
												<p onclick="this.parentElement.style.display='none';">
													New <i class="fa fa-times"></i>
												</p>
											</div>
											<div>
												<p onclick="this.parentElement.style.display='none';">
													New <i class="fa fa-times"></i>
												</p>
											</div>
											<div>
												<p onclick="this.parentElement.style.display='none';">
													New <i class="fa fa-times"></i>
												</p>
											</div>
											<div>
												<p onclick="this.parentElement.style.display='none';">
													New <i class="fa fa-times"></i>
												</p>
											</div>
											<div>
												<p onclick="this.parentElement.style.display='none';">
													New <i class="fa fa-times"></i>
												</p>
											</div>
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

						<!--Alternative Form-->
						<div class="alternative-search-form">
							<a href="#collapseAlternativeSearchForm2" class="icon"
								data-toggle="collapse" aria-expanded="false"
								aria-controls="collapseAlternativeSearchForm"><i
								class="fa fa-plus"></i>이웃들이 많이 찾고 있어요!</a>
							<div class="collapse" id="collapseAlternativeSearchForm2">
								<div class="wrapper" style="padding: 4rem;">
									<div class="form-row" style="overflow: hidden;">
										<div
											class="col-xl-12 col-lg-12 col-md-12 col-sm-12 d-xs-grid d-flex align-items-center justify-content-between">
											<!-- <p id="popular-button">안녕</p> -->
											<a href="#">안녕</a>
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
				<!--============ End Hero Form ======================================================================-->
				<div class="background">
					<div class="background-image original-size">
						<img src="assets/img/hero-background-icons.jpg" alt="">
					</div>
					<!--end background-image-->
				</div>
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
					<!--============ Section Title===================================================================-->
					<div class="section-title clearfix">
						<div class="float-xl-left float-md-left float-sm-none">
							<h2>Recent Listings</h2>
						</div>
						<div class="float-xl-right float-md-right float-sm-none">
							<select name="categories" id="categories"
								class="small width-200px" data-placeholder="Category">
								<option value="">Category</option>
								<option value="1">Computers</option>
								<option value="2">Real Estate</option>
								<option value="3">Cars & Motorcycles</option>
								<option value="4">Furniture</option>
								<option value="5">Pets & Animals</option>
							</select> <select name="sorting" id="sorting" class="small width-200px"
								data-placeholder="Default Sorting">
								<option value="">Default Sorting</option>
								<option value="1">Newest First</option>
								<option value="2">Oldest First</option>
								<option value="3">Lowest Price First</option>
								<option value="4">Highest Price First</option>
							</select>
						</div>
					</div>
					<!--============ Items ==========================================================================-->
					<div
						class="items masonry grid-xl-4-items grid-lg-4-items grid-md-2-items">
						<c:forEach items="${itemList}" var="itemList" varStatus="status">
							<div class="item">
								<div class="ribbon-featured">${itemList.itemStatus }</div>
								<!--end ribbon-->
								<div class="wrapper">

									<div class="image">
										<h3>
											<a href="#" class="tag category">${itemList.categoryVO.categoryName}</a>
											<!-- 제목을 눌러도 item-detail 화면으로 넘어가야함. -->
											<a href="selectItemByItemId?itemId=${itemList.itemId}"
												class="title">${itemList.itemTitle}</a>
										</h3>
										<!-- 이미지를 눌러도 item-detail 화면으로 넘어가야함. -->
										<a href="selectItemByItemId?itemId=${itemList.itemId}"
											class="image-wrapper background-image"> <img
											src="assets/upload/${imageList[status.index].imageName}" alt="">
										</a>
									</div>
									<!--end image-->

									<h4 class="location">
										<a href="#">${itemList.userVO.userAddress}</a>
									</h4>

									<div class="price">${itemList.itemPrice}원</div>

									<div class="meta">
										<figure>
											<i class="fa fa-calendar-o"></i>관심 17
										</figure>
										<figure>
										<c:choose>
											<c:when test="${userId ne itemList.userVO.userId}">
											<a href="chatForm?userId=${userId}&selleId=${itemList.userVO.userId}&itemId=${itemList.itemId}"> <i class="fa fa-user"></i>채팅 ${crnum[status.index] }
											</a>
											</c:when>
											<c:otherwise>
											<i class="fa fa-user"></i>채팅 ${crnum[status.index] }
											</c:otherwise>
										</c:choose>
										</figure>
									</div>
									<!--end meta-->
								</div>
								<!-- <div class="wrapper"> -->
							</div>
							<!-- <div class="item"> -->
						</c:forEach>
					</div>
					<!--end item----------------------------------------------------------------------------------------------------------------------------->
					<!--============ End Items ======================================================================-->
					<div class="center">
						<a href="#" class="btn btn-primary btn-framed btn-rounded">Load
							More</a>
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

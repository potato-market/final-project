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
						<h1>Frequently Asked Questions</h1>
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
						<div class="col-md-12">
							<section>
								<form class="form inputs-underline">
									<h3>Search in Answers  ${TotalFAQCount }</h3>
									<a href="faq-write-form">글쓰기</a>
									<div class="form-group">
										<input type="text" class="form-control" name="name" id="name"
											placeholder="Enter your search">
									</div>
									<!--end form-group-->
								</form>
							</section>
							<section>
							<c:forEach var="l" items="${list }">
								<div class="answer">
									<div class="box">
									<form method="post" action="deleteFAQ">
										<h3>${l.faqTitle } ${l.userVO.userId }</h3>
										<p>${l.faqContent }</p>
										<input type="hidden" value="${l.faqId }" name="faqId">
										<button class="btn btn-primary text-caps btn-framed">삭제</button>
									</form>
									<button class="btn btn-primary text-caps btn-framed" type="button" onclick="location.href='faq-update-form?faqId='+${l.faqId }">수정</button>
									</div>
								</div>
								<!--end answer-->
								</c:forEach>
							</section>
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

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
			<a href="adminManagement">관리자</a> <a href="categoryManagement">카테고리</a>
			<a href="faqManagement">FAQ</a>
		</div>
	</div>

	<header class="hero" style="content: none;">
		<div class="hero-wrapper" style="padding-bottom: 0rem;">
			<!--============ Secondary Navigation ===============================================================-->
			<div class="secondary-navigation">
				<div class="container">
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
	<!--*********************************************************************************************************-->
	<!--************ CONTENT ************************************************************************************-->
	<!--*********************************************************************************************************-->
	<div style="margin-left:10px; margin-top:10px;">
	<a href="faqManagement" style="text-decoration:underline double;">뒤로가기</a>
	</div>
	<section class="content">
		<section class="block">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<section>
							<h3>글 작성</h3>
						</section>
						<form class="form form-submit" method="post" action="writeFAQ">
							<sec:csrfInput />
							<section style="margin-bottom: 0px">
								<div class="row">
									<div class="col-md-8">
										<div class="form-group">
											<input type="hidden" value="${userId}" name="userVO.userId">
											<label for="title" class="col-form-label required">Title</label>
											<input name="faqTitle" type="text" class="form-control"
												id="title" value="${faqData.faqTitle }" required>
										</div>
										<!--end form-group-->
									</div>
									<!--end col-md-8-->
								</div>
							</section>
							<!--end basic information-->
							<section style="margin-bottom: 0px">
								<div class="form-group">
									<label for="details" class="col-form-label">Additional
										Details</label>
									<textarea name="faqContent" id="details" class="form-control"
										rows="4" required	>${faqData.faqContent }</textarea>
								</div>
								<!--end form-group-->
							</section>
							<section class="clearfix">
								<div class="form-group">
									<button type="submit"
										class="btn btn-primary large icon float-right">
										완료<i class="fa fa-chevron-right"></i>
									</button>
								</div>
							</section>
						</form>
						<!--end form-submit-->
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
</body>
</html>
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
<style>
table {
	border-collapse: collapse;
	border-spacing: 0;
	width: 100%;
	border: 1px solid #ddd;
	background-color: white;
	table-layout:fixed
}

th, td {
	text-align: left;
	padding: 16px;
	overflow:hidden;
	white-space:nowrap;
	text-overflow:ellipsis;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}
</style>
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
	<div style="margin-left: 10px; margin-top: 10px;">
		<a href="adminMain" style="text-decoration: underline double;">뒤로가기</a>
	</div>
	<section class="content">
		<section class="block">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<section>
							<h3>FAQ 관리 (${TotalFAQCount })</h3>
							<a href="faq-write-form" style="float: right;">글쓰기</a>
							<!--end form-group-->
						</section>
						<section>
							<table>
								<tr>
									<th style="width:80px;"><a href="#">No.</a></th>
									<th style="width:250px;"><a href="#">제목</a></th>
									<th >내용</th>
									<th style="width:100px;">작성자</th>
									<th style="width:80px;text-align:center;">수정</th>
									<th style="width:80px;text-align:center;">삭제</th>
								</tr>
								<c:forEach var="l" items="${list }" varStatus="status">
									<form method="post" action="deleteFAQ" id="deleteForm">
										<sec:csrfInput />
										<input type="hidden" value="${l.faqId }" name="faqId">
										<tr>
											<td>${status.count}</td>
											<td>${l.faqTitle }</td>
											<td >${l.faqContent }</td>
											<td>${l.userVO.userId }</td>
											<td style="text-align:center;"><a href="faq-update-form?faqId=${l.faqId }"><i class="fa fa-wrench"></i></a></td>
											<td style="text-align:center;"><a href="#" class="deleteBtn"><i class="fa fa-trash"></i></a></td>
										</tr>
									</form>
								</c:forEach>
							</table>
						</section>
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
	<script>
		$(document).ready(function() {
			$(".deleteBtn").click(function() {
				if (!confirm("삭제 하시겠습니까?")) {
					location.href = "#";
				} else {
					$("#deleteForm").submit();
				}
			});
		});
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- spring security custom tag를 사용하기 위한 선언 --%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%-- javascript 한글처리가 안될 때는 변수에 담아서 el로 처리한다  --%>
<sec:authentication property="principal.userId" var="userId" />

<head>
<title>Bootstrap Example</title>
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
</head>
<body>
	<!-- 해야할일 ajax 를 통해 post 방식으로 카테고리 삭제 ,수정 ,추가 -->
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
					<ul class="left">
						<li><a href="main"> <i class="fa fa-home"></i>Home
						</a></li>
					</ul>
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
	<div style="margin-left: 10px; margin-top: 10px;">
		<a href="adminMain" style="text-decoration: underline double;">뒤로가기</a>
	</div>

	<div class="container">
		<section>
			<h3>카테고리 관리</h3>
			<a href="categoryWriteForm" style="float: right;">카테고리추가</a>
			<!--end form-group-->
		</section>
		<table class="table">
			<thead>
				<tr>
					<th>ID</th>
					<th>NAME</th>
					<th>DEL</th>
					<th>EDIT</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="l" items="${list}">
					<tr>
						<td>${l.categoryId}</td>
						<td>${l.categoryName}</td>
						<td><form action="categoryDel" method="POST">
								<sec:csrfInput />
								<input type="hidden" name="categoryId" value="${l.categoryId}" />
								<button type="submit">DEL</button>
							</form></td>
						<td><form action="categoryUpForm" method="post">
								<sec:csrfInput />
								<input type="hidden" name="categoryId" value="${l.categoryId}" />
								<input type="hidden" name="categoryName"
									value="${l.categoryName}" />
								<button type="submit">EDIT</button>
							</form></td>
						<td></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
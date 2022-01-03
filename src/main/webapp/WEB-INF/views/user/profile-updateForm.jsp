<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
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
<link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.css"
	type="text/css">
<link rel="stylesheet" href="/assets/fonts/font-awesome.css"
	type="text/css">
<link rel="stylesheet" href="/assets/css/selectize.css" type="text/css">
<link rel="stylesheet" href="/assets/css/style.css">
<link rel="stylesheet" href="/assets/css/user.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
							<form method="post" class="form" action="profileUpdate" enctype="multipart/form-data">
								<sec:csrfInput />
								<sec:authentication var="user" property="principal" />
								<!-- <form class="form"> -->
								<div class="row">
									<div class="col-md-8">
										<h3>회원정보 변경</h3>
										<section>
											<div class="row">
												<div class="col-md-4">
													<div class="form-group">
														<label for="name" class="col-form-label required">Your
															Name</label> <input name="userId" type="text"
															class="form-control" id="name" placeholder="Your Name"
															value="${user.userId}" readonly required />
													</div>
													<!--end form-group-->
												</div>
												<div class="col-md-8">
													<!--end form-group-->
													<div class="form-group">
														<label for="" class="col-form-label">Location</label> <input
															name="userAddress" type="text"
															value="${user.userAddress}" placeholder="주소"
															class="form-control" id="address" readonly required />
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
															name="userTel" type="text" class="form-control"
															id="phone" placeholder="Your Phone"
															value="${user.userTel}">
													</div>
													<!--end form-group-->
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label for="email" class="col-form-label">Email</label> <input
															name="userEmail" type="email" class="form-control"
															id="email" placeholder="Your Email"
															value="${user.userEmail}">
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
												<c:choose>
													<c:when test="${not empty user.userImage}">
														<img src="assets/upload/${user.userImage}" alt="">
													</c:when>
													<c:otherwise>
														<img src="assets/img/author-09.jpg" alt="">
													</c:otherwise>
												</c:choose>
												<img src="assets/img/author-09.jpg" alt="">
											</div>
											<div class="single-file-input">
												<input type="file" id="user_image" name="update_user_image">
												
												<div class="btn btn-framed btn-primary small">Upload a
													picture</div>
											</div>
										</div>
									</div>
									<!--end col-md-3-->
								</div>
							</form>
						</div>
					</div>
				</div>
			</section>
			<!-- end block -->
		</section>
		<!-- end content -->

	</div>
	<!--end page-->
	<script type="text/javascript">
		//비밀번호 확인 후 ajax문구 띄운다  //수업 때 배운 jquery-ajax 발전방식으로 바꿔야 함
		/*   function passwordResult() {
		     let password = document.forms[0];
		     let pass1 = password.userPassword.value;
		     let pass2 = password.login_password_check.value;
		     if (pass1 != pass2) {
		        document.getElementById("passwordResult").style.color = "red";
		        document.getElementById("passwordResult").innerHTML = "비밀번호가 일치하지 않습니다.";
		     } else {
		        document.getElementById("passwordResult").style.color = "green";
		        document.getElementById("passwordResult").innerHTML = "비밀번호가 일치합니다.";
		     }
		  }
		 */
		//가입하기 누를 때 발생하는 이벤트 
		$(document).ready(function() {
			$("#passwordUpdateForm").submit(function() {
				//alert("떠라제발");
				//아래 코드는 passwordResult()와 중복되는데 리팩토링 필요할 듯
				let password = document.forms["passwordUpdateForm"];
				// let password = document.forms[0];
				let pass1 = password.userPassword.value;
				let pass2 = password.repeat_new_current_password.value;
				if (pass1 != pass2) {
					alert("패스워드가 일치하지 않습니다.");
					$("#repeat_new_current_password").focus();
					return false;

					//     let pass1 = password.userPassword.elements[1];
					//let pass1 = document.passwordUpdateForm.userPassword;
					//let pass2 = document.passwordUpdateForm.repeat_new_current_password;
					//     let pass2 = password.repeat_new_current_password.elements[2];
					//if (pass1 != pass2) {
					// alert("패스워드가 일치하지 않습니다.");
					// $("#repeat_new_current_password").focus();
					// return false;
				}
			});
		});

		$(function() {
			$('#phone')
					.keydown(
							function(event) {
								var key = event.charCode || event.keyCode || 0;
								$text = $(this);
								if (key !== 8 && key !== 9) {
									if ($text.val().length === 3) {
										$text.val($text.val() + '-');
									}
									if ($text.val().length === 8) {
										$text.val($text.val() + '-');
									}
								}
								return (key == 8 || key == 9 || key == 46
										|| (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
							});
		});
	</script>
</body>
</html>

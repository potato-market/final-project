<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
							<form method="post" class="form" action="profileUpdate">
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

													<!-- 	<div class="form-group">
														<label for="title" class="col-form-label">Location</label>
														<select name="title" id="title" data-placeholder="<label for="title" class="col-form-label">Location</label>Title">
															<option value="">Title</option>
															<option value="1" selected>Mrs</option>
															<option value="2">Mr</option>
														</select>
													</div> -->
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
			<!--  주소 변경~!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
			<div class="row">
				<div class="col-md-3"></div>
				<!--end col-md-3-->
				<div class="col-md-6">
					<!-- <div class="col-md-6 offset-md-3"> -->
					<form method="post" class="form" action="profileAddressUpdate">
						<sec:csrfInput />
						<sec:authentication var="user" property="principal" />
						<input name="userId" type="hidden" class="form-control" id="name"
							placeholder="Your Name" value="${user.userId}" readonly required />
						<div class="row">
							<div class="col-md-8">
								<section>
									<div class="form-group">
										<input name="userAddress" type="text" value="" placeholder="주소"
									class="form-control check" id="login_address" required />

										 <div id="map" style="width: 100%; height: 100px; display: none;"></div> 
										<!-- 부트스트랩 primary 버튼 -->
										 <button type="button" id="getMyPositionBtn"
									style="display: none;">내 위치 가져오기</button>
										<button type="button" id="stopMovingBtn" style="display: none;">지도
									드래그 이동 끄기</button>
									</div>
								</section>
								<!-- <section class="clearfix">
										</section> -->
							</div>
							<div class="col-md-4">
								<button type="submit" class="btn btn-primary float-right">Address
									Changes</button>
							</div>
							<!--end col-md-8-->
					</form>
				</div>


				<div class="col-md-12" style="margin-top: 20px;">
					<!-- *************************************************************************************** -->
					<!-- 비밀번호 변경 -->
					<!-- ******************************************************************************************* -->
					<form method="post" class="form" action="PasswordUpdate"
						id="passwordUpdateForm" name="passwordUpdateForm">
						<!-- 비밀번호 비교 컨트롤러에서 만들어야 함-->
						<sec:csrfInput />
						<sec:authentication var="user" property="principal" />
						<input name="userId" type="hidden" class="form-control" id="name"
							placeholder="Your Name" value="${user.userId}" readonly required />
						<%-- 	<sec:authentication var="user" property="principal"/> --%>
						<div class="row justify-content-center">
							<div class="col-md-6">
								<h3>비밀번호 변경</h3>
								<!-- <div class="form-group">
											<label for="current_password" class="col-form-label required">Current
												Password</label> <input name="userPassword" type="password"
												class="form-control" id="current_password"
												placeholder="Current Password" required>
										</div> -->
								<!--end form-group-->
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="new_current_password"
												class="col-form-label required">New Password</label> <input
												name="userPassword" type="password" class="form-control"
												id="userPassword" placeholder="New Password" required>
										</div>
										<!--end form-group-->
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="repeat_new_current_password"
												class="col-form-label required">Repeat Password</label> <input
												type="password" class="form-control"
												id="repeat_new_current_password"
												placeholder="Repeat New Password" required
												name="repeat_new_current_password">
										</div>
										<!--end form-group-->
									</div>
								</div>
								<button type="submit" class="btn btn-primary float-right">Change
									Password</button>
							</div>
							<!--end col-md-6-->
						</div>
					</form>
				</div>
				<!--end col-md-9-->
				
				<div class="col-md-12" style="margin-top: 20px;">
					<form method="post" class="form" action="PasswordUpdate"
						id="passwordUpdateForm" name="passwordUpdateForm">
						
						<!-- 비밀번호 비교 컨트롤러에서 만들어야 함-->
						<sec:csrfInput />
						<sec:authentication var="user" property="principal" />
						<input name="userId" type="hidden" class="form-control" id="name"
							placeholder="Your Name" value="${user.userId}" readonly required />
						<%-- 	<sec:authentication var="user" property="principal"/> --%>
						<div class="row justify-content-center">
							<div class="col-md-6">
								<h3>회원 탈퇴</h3>
								<button type="submit" class="btn btn-primary float-right">회원 탈퇴</button>
							</div>
							<!--end col-md-6-->
						</div>
					</form>
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
				alert("떠라제발");
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
	</script>

	<!--*********************************************************************************************************-->
	<!--************ FOOTER *************************************************************************************-->
	<!--*********************************************************************************************************-->
	<footer class="footer">
		<div class="wrapper">
			<div class="container">
				<div class="row">
					<div class="col-md-5">
						<a href="#" class="brand"> <img src="assets/img/logo.png"
							alt="">
						</a>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut
							nec tincidunt arcu, sit amet fermentum sem. Class aptent taciti
							sociosqu ad litora torquent per conubia nostra.</p>
					</div>
					<!--end col-md-5-->
					<div class="col-md-3">
						<h2>Navigation</h2>
						<div class="row">
							<div class="col-md-6 col-sm-6">
								<nav>
									<ul class="list-unstyled">
										<li><a href="#">Home</a></li>
										<li><a href="#">Listing</a></li>
										<li><a href="#">Pages</a></li>
										<li><a href="#">Extras</a></li>
										<li><a href="#">Contact</a></li>
										<li><a href="#">Submit Ad</a></li>
									</ul>
								</nav>
							</div>
							<div class="col-md-6 col-sm-6">
								<nav>
									<ul class="list-unstyled">
										<li><a href="#">My Ads</a></li>
										<li><a href="#">Sign In</a></li>
										<li><a href="#">Register</a></li>
									</ul>
								</nav>
							</div>
						</div>
					</div>
					<!--end col-md-3-->
					<div class="col-md-4">
						<h2>Contact</h2>
						<address>
							<figure>
								124 Abia Martin Drive
								<br> New York, NY 10011
							</figure>
							<br> <strong>Email:</strong> <a href="#">hello@example.com</a>
							<br> <strong>Skype: </strong> Craigs <br> <br> <a
								href="contact.html" class="btn btn-primary text-caps btn-framed">Contact
								Us</a>
						</address>
					</div>
					<!--end col-md-4-->
				</div>
				<!--end row-->
			</div>
			<div class="background">
				<div class="background-image original-size">
					<img src="assets/img/footer-background-icons.jpg" alt="">
				</div>
				<!--end background-image-->
			</div>
			<!--end background-->
		</div>
	</footer>
	<!--end footer-->
	</div>
	<!--end page-->
		<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=56536b4d771a0c6ee4f8be08caeac525&libraries=services"></script>
	<script type="text/javascript" src="/assets/js/map.js"></script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
<!--  jquery-ajax 사용을 위한 소스 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>home</title>

</head>
<body>
	<section class="block">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-4 col-lg-5 col-md-6 col-sm-8">
					<div id="container_border"
						style="background-color: #f7fcf9; padding-bottom: 10px;">
						<!-- form strat -->
						<form method="post" class="form clearfix" id="registerForm"
							action="/guest/registerUser">
							<sec:csrfInput/><%-- csrf 토큰 --%>
							<div class="profile-image" id="register-image">
								<div class="image background-image">
									<img src="/assets/img/루피감자.png" alt="">
									<!-- author-default.png -->
								</div>
								<div class="single-file-input">
									<input type="file" id="user_image" name="user_image">
									<div class="btn btn-framed btn-primary small">Upload a
										picture</div>
								</div>
							</div>
							<br>
							<!--  user css id 셀렉터 형식이 login_id login_password 형식이므로 id 형식을 맞추도록 한다 -->
							<!--  컨트롤러로 넘겨주는 방식이 name값과 vo필드 변수명과 일치시켜줘야 한다-->
							<div class="form-group">
								<input name="userId" type="text" placeholder="아이디"
									class="form-control check" id="login_id" placeholder="Your Name"
									required onkeyup="IdCheckResult()">
							</div>
							<span id="IdCheckResult"></span>
							<!--end form-group-->
							<!--  패스워드 -->
							<div class="form-group">
								<input name="userPassword" id="login_password" type="password"
									placeholder="비밀번호" class="form-control check" required>
							</div>
							<div class="form-group">
								<input name="login_password_check" id="login_password_check"
									type="password" placeholder="비밀번호 확인" class="form-control check"
									required onkeyup="passwordResult()">
							</div>
							<span id="passwordResult"></span>
							<!-- /패스워드 -->
							<div class="form-group">
								<input name="userEmail" type="text" placeholder="이메일"
									class="form-control check" id="login_email" placeholder="Your Name"
									required>
							</div>
							<!--end form-group-->
							<div class="form-group">
								<input name="userTel" type="tel" placeholder="전화번호"
									class="form-control check" id="login_tel" required>
							</div>
							<!--end form-group-->
							<div class="form-group">
								<input name="userAddress" type="text" value="여주" placeholder="주소"
									class="form-control check" id="login_address" readonly required />

								<div id="map" style="width: 100%; height: 100px; display: none;"></div>
								<!-- 부트스트랩 primary 버튼 -->
								<button type="button" id="getMyPositionBtn"
									style="display: none;">내 위치 가져오기</button>
								<button type="button" id="stopMovingBtn" style="display: none;">지도
									드래그 이동 끄기</button>
							</div>
							<!--end form-group-->
							<div class="form-group">
								<button type="submit" class="btn btn-primary2 width-100"
									style="font-size: 1.3rem;">가입하기</button>
							</div>
						</form>
					</div>
					<hr>
					<div>
						<button type="button" class="btn btn-primary width-100"
							style="border: none; background-color: yellow; color: brown; font-size: 1.3rem;">
							<i class="fa fa-comment"></i> 카카오톡계정으로 가입하기
						</button>
					</div>
					<br>
					<div style="text-align: center; font-size: 1.3rem;">
						<a href="login">이미 계정이 있으신가요?</a>
					</div>
				</div>
				<!--end col-md-6-->
			</div>
			<!--end row-->
		</div>
		<!--end container-->
	</section>

	<%@ include file="../templates/common-js.jsp"%>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=56536b4d771a0c6ee4f8be08caeac525&libraries=services"></script>
	<script type="text/javascript" src="/assets/js/map.js"></script>
	<script type="text/javascript" src="/assets/js/registCheck.js"></script>
</body>
</html>

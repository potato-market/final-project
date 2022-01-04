<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authentication property="principal.userId" var="headeruserId" />
	 
 <header class="hero" style="content:none;">
            <div class="hero-wrapper">
		<!--============ Secondary Navigation ===============================================================-->
		<div class="secondary-navigation">
			<div class="container">
			<ul class="left"><li><a href="main"> <i class="fa fa-home"></i>Home
						</a></li></ul>
				<ul class="right">
				<sec:authorize access="hasRole('ROLE_ADMIN')">
				<li><a href="adminHome"> <i class="fa fa-wrench"></i>관리자 페이지</a></li>
				</sec:authorize>
				 <sec:authorize access="hasRole('ROLE_MEMBER')">
					<li><a href="profile"> <i class="fa fa-heart"></i>내 감자</a></li>
					</sec:authorize>
			<script type="text/javascript">
					$(document).ready(function() {
					$("#logoutAction").click(function() {
						if(!confirm("로그아웃 하시겠습니까?")){
							location.href="#";
						}else{
							$("#logoutForm").submit();
						}
			});
		});
		</script>
		<li><a href="#" id="logoutAction"> <i class="fa fa-sign-in"></i>Sign Out </a></li>
		<form id="logoutForm" action="/logout" method="post"  style="display: none">
					<sec:csrfInput/>								
					</form>
				</ul>
				<!--end right-->
			</div>
			<!--end container-->
		</div>
		<!--============ End Secondary Navigation ===========================================================-->
		 <!--============ Main Navigation ====================================================================-->
		<div class="main-navigation">
                    <div class="container">
                        <nav class="navbar navbar-expand-lg navbar-light justify-content-between">
                            <a class="navbar-brand" href="main">
                                <img src="assets/img/logo.PNG" alt="" style="width:129px; height:46px;">
                            </a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse" id="navbar">
                                <!--Main navigation list-->
                                <ul class="navbar-nav">
                                    <li class="nav-item active">
                                        <a class="nav-link" href="main">홈</a>
                                    </li>
                                     <li class="nav-item">
                                        <a class="nav-link" href="communityBoard">동네생활</a>
                                    </li>
                                     <li class="nav-item">
                                        <a class="nav-link" href="headerChatForm?userId=${headeruserId}" >채팅</a>
                                    </li>
                                     <li class="nav-item">
                                        <a href="faqBoard" class="nav-link">FAQ</a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="writeForm" class="btn btn-primary text-caps btn-rounded btn-framed">중고거래 글쓰기</a>
                                    </li>
                                </ul>
                                <!--Main navigation list-->
                            </div>
                            <!--end navbar-collapse-->
                        </nav>
                        <!--end navbar-->
                    </div>
                    <!--end container-->
                </div>
                <!--============ End Main Navigation ================================================================-->
	</div>
</header>
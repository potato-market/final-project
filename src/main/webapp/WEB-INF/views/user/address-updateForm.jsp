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
                  <form method="post" class="form" action="profileAddressUpdate">
                  	<sec:csrfInput />
                  	<sec:authentication var="user" property="principal" />
                  	<!-- <form class="form"> -->
                  	<div class="row">
                  		<div class="col-md-8">
                  			<h3>내 동네 설정</h3>
                  			<section>
                  			<div class="row">
                  			<div class="col-md-6">
                  			<div class="form-group">
                              <input name="userAddress" type="text" value="" placeholder="주소"
                           		class="form-control check" id="login_address" required />
                           		<hr>
                           		<div id="map" style="width: 150%; height: 200px;"></div> 
                              	<!-- 부트스트랩 primary 버튼 -->
                               <button type="button" id="getMyPositionBtn"
                           			style="display: none;">내 위치 가져오기</button>
                               <button type="button" id="stopMovingBtn" style="display: none;">지도
                           			드래그 이동 끄기</button>
                           </div>
                           </section>
                           </div>
                           <div class="col-md-4">
                        		<button type="submit" class="btn btn-primary float-right">Address
                          		 Changes</button>
                     	   </div>
                    </form>
            		</div>
                  </div>
         	   </div>
            </div>
       </section>
       </section> 
   <script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=56536b4d771a0c6ee4f8be08caeac525&libraries=services"></script>
   <script type="text/javascript" src="/assets/js/map.js"></script>  
</body>
</html>
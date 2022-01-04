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

<%@ include file="../templates/common-js.jsp"%>
<script src="assets/js/admin.js"></script>
<title>admin main</title>
<style>
#column1 {
	float: left;
	width: 80%;
	padding: 5px;
}

#column2 {
	float: left;
	width: 20%;
	padding: 5px;
}

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
				<ul class="left"><li><a href="main"> <i class="fa fa-home"></i>Home
						</a></li></ul>
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
							<h3>Admin 계정 관리</h3>
							<!--end form-group-->
						</section>
						<div id="column1">
								<div class="col-md-4" style="display:block;">
									<label for="find" class="col-form-label">회원 계정 검색</label>
									<input name="userId" type="text" id="findUser" placeholder="사원 아이디">
								</div>
							<section>
								<div class="col-lg-4" style="display:block;">
								<table style="margin-top:30px;">
									<thead>
										<tr>
											<th>아이디</th>
											<th style="80px;text-align:center;">추가</th>
										</tr>
									</thead>
									<tbody id="userInfo">
										<!-- 검색결과 ajax 반응 -->
									</tbody>
								</table>
								</div>
							</section>
						</div>
						<!--end column-->

						<div id="column2">
							<label for="admin" class="col-form-label">Admin 계정</label>
							<section>
								<table >
									<thead>
										<tr>
											<th>아이디</th>
											<th style="80px;text-align:center;">삭제</th>
										</tr>
									</thead>
									<tbody  id="userTable">
										<c:forEach var="l" items="${list }" varStatus="status">
										<tr id="${l.userId}">
											<td>${l.userId}</td>
											<td style="80px;text-align:center;"class="deleteTd" data-name="${l.userId}"><i class='fa fa-ban' ></i></td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							</section>
						</div>
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
$(document).ready(function(){
	   $('#findUser').keydown(function(key) {
		   $("#userInfo").empty();
		   if(key.keyCode ==13){
	      	let userId = $("#findUser").val();
	      	$.ajax({
					type:"get",
					url:"findMemberUserById",
					data:"userId="+userId,
					success:function(result){
						
						if(!result){
							let userInfo="";
							userInfo+="<tr>";
							userInfo="<td colspan='2'>검색결과가 존재하지 않습니다</td>"
							userInfo+="</tr>";
							$("#userInfo").append(userInfo);
						}else{
							let userInfo="";
							userInfo+="<tr>";
							userInfo+="<td>"+result.userId+"</td>";
							userInfo+="<td style='80px;text-align:center;' id='addBtn' data-id='"+result.userId+"'><i class='fa fa-user-plus' id='"+result.userId+"'></i></td>";
							userInfo+="</tr>";
					
							$("#userInfo").append(userInfo);
							
							$("#addBtn").on("click","#"+result.userId,function(){
		                  		let userId=result.userId;
		                		console.log(userId);
		 						if(!confirm("관리자로 등록하시겠습니까?")){
									return false;
		 						}else{
		 							//ajax 전송시, 'x-csrf-token' 같은 헤더 정보를 추가해서 csrf 토큰값 전달
		 							var csrfHeaderName = "${_csrf.headerName}";
		 							var csrfTokenValue = "${_csrf.token}";
		                     
		 							//beforeSend는 시큐리티 적용시, 추가적인 헤더를 지정해서 ajax전송시 csrf를 토큰값 같이전송
		 							$.ajax({
		 								type:"post",
		 								url:"addAdmin",
		 								data:"userId="+userId,
		 								beforeSend: function(xhr){
											xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
										},
										success:function(result){
											alert("관리자 등록이 완료 되었습니다.");
											let html="<tr id='"+result.userId+"'>";
											html+="<td>"+result.userId+"</td>";
											html+="<td style='80px;text-align:center;' class='deleteTd' data-name='"+result.userId+"'><i class='fa fa-ban'></i></td>";
											html+="</tr>";
											
											$("#userTable").append(html);
											$("#userInfo").empty();
											
											
											$("#"+result.userId).on("click",".deleteTd",function(){
												let userName=$(this).data("name");
												
												//ajax 전송시, 'x-csrf-token' 같은 헤더 정보를 추가해서 csrf 토큰값 전달
												var csrfHeaderName = "${_csrf.headerName}";
												var csrfTokenValue = "${_csrf.token}";
												
												if(!confirm("관리자 목록에서 제거 하시겠습니까?")){
													return false;
												}else{
													alert("관리자 권한을 제거하였습니다.");
													
													$.ajax({
														type:"post",
														url:"deleteAdmin",
														data:"userName="+userName,
														beforeSend: function(xhr){
															xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
														},
														success:function(result){
															$("#"+result.userId).remove();
														}//success callback
													});//ajax
												}//if
											}); // on click
											
										}//success callback
									});//ajax
								}//if
							});//addBtn click
						}
					}//success callback
				});//ajax
		   } //if
	   }); //keydown
	});//ready

$(function(){
	$(".deleteTd").click(function() {
		let userName=$(this).data("name");
		//ajax 전송시, 'x-csrf-token' 같은 헤더 정보를 추가해서 csrf 토큰값 전달
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
		$.ajax({
			type:"post",
			url:"deleteAdmin",
			data:"userName="+userName,
			beforeSend: function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
			},
			success:function(result){
				if(!confirm("관리자 목록에서 제거 하시겠습니까?")){
					return false;
				}else{
					alert("관리자 권한을 제거하였습니다.");
					$("#"+result.userId).remove();
				}
			}//success callback
		});//ajax
	}); //click
}); //ready
</script>
</body>
</html>
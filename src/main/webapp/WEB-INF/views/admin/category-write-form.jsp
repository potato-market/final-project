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
	width: 70%;
	padding: 5px;
}

#column2 {
	float: left;
	width: 30%;
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

.scrolltable {
  display: block;
  overflow: auto;
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
							<h3>카테고리 추가</h3>
							<!--end form-group-->
						</section>
						<div id="column1">
								<div class="col-md-4" style="display:block;">
									<input name="categoryName" type="text" id="categoryName" placeholder="카테고리명">
								</div>
						</div>
						<!--end column-->

						<div id="column2">
							<label for="admin" class="col-form-label">category</label>
							<section>
								<table class='scrolltable'style="height: 300px;width:68%;">
									<thead>
										<tr>
											<th>아이디</th>
											<th>카테고리명</th>
										</tr>
									</thead>
									<tbody  id="categoryTable">
										<c:forEach var="l" items="${list }" varStatus="status">
										<tr>
											<td>${l.categoryId}</td>
											<td>${l.categoryName}</td>
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
	$("#categoryName").empty();
	   $('#categoryName').keydown(function(key) {
		   
		   if(key.keyCode ==13){
	      	let categoryName = $("#categoryName").val();
	      	
	      	var csrfHeaderName = "${_csrf.headerName}";
			var csrfTokenValue = "${_csrf.token}";
			
	      	$.ajax({
					type:"post",
					url:"categoryWrite",
					data:"categoryName="+categoryName,
					beforeSend: function(xhr){
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
					},
					success:function(result){
						
							let categoryInfo="";
							categoryInfo+="<tr>";
							categoryInfo+="<td>"+result.categoryId+"</td>";
							categoryInfo+="<td>"+result.categoryName+"</td>";
							categoryInfo+="</tr>";
							$("#categoryTable").append(categoryInfo);
							
					}//success callback
				});//ajax
		   } //if
	   }); //keydown
	});//ready
</script>
</body>
</html>
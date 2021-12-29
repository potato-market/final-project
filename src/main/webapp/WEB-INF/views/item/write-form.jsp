<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal.userId" var="userId"/>
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
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.css"
	type="text/css">
<link rel="stylesheet" href="assets/fonts/font-awesome.css"
	type="text/css">
<link rel="stylesheet" href="assets/css/selectize.css" type="text/css">
<link rel="stylesheet" href="assets/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/user.css">

<title>Register Items</title>

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
							<li class="breadcrumb-item"><a href="index.html">Home</a></li>
							<li class="breadcrumb-item"><a href="#">Pages</a></li>
							<li class="breadcrumb-item active">Submit</li>
						</ol>
						<!--end breadcrumb-->
					</div>
					<!--end container-->
				</div>
				<!--============ End Main Navigation ================================================================-->
				<!--============ Page Title =========================================================================-->
				<div class="page-title">
					<div class="container">
						<h1>중고거래 글쓰기</h1>
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
					<form class="form form-submit" action="registerItem" method="post">
					<input type="hidden" name="userVO.userId" value="${userId}"> 
					<sec:csrfInput/>
						<section style="margin-bottom: 0px">
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label for="submit-category" class="col-form-label">Category</label>
										
										<!-- 1. CATEGORY -->
										
										<select class="change-tab" data-change-tab-target="category-tabs" name="categoryVO.categoryId" id="submit_category" data-placeholder="Select Category" required="required">
											<option value="">Select Category</option>
												<c:forEach items="${categoryList}" var="category">
												<option value="${category.categoryId}">${category.categoryName}</option>
											</c:forEach>
										</select>
									</div>
									<!--end form-group-->
								</div>
								<!--end col-md-4-->
							</div>
							<!--end row-->
						</section>
						<section style="margin-bottom: 0px">
							<div class="row">
								<!-- 2. TITLE -->
								<div class="col-md-8">
									<div class="form-group">
										<label for="itemTitle" class="col-form-label required">Title</label>
										<input name="itemTitle" type="text" class="form-control" id="itemTitle" placeholder="Title" maxlength="13" required>
									</div>
								</div>
								<!-- 3. PRICE -->
								<div class="col-md-4">
									<div class="form-group">
										<label for="itemPrice" class="col-form-label required">Price</label>
										<input name="itemPrice" type="number" class="form-control" id="itemPrice" required> <span class="input-group-addon">원</span>
									</div>
								</div>
							</div>
						</section>
						<!--end basic information-->
						<section style="margin-bottom: 0px">
						
						<!-- 4. Item Content-->
							<div class="form-group">
								<label for="itemContent" class="col-form-label">Additional Details</label>
								<textarea name="itemContent" id="itemContent" class="form-control" rows="4"></textarea>
							</div>
							<!--end form-group-->
						</section>
						<section>
						   
						  <!-- 5. Item Image -->
							<div class="file-upload-previews"></div>
							<div class="file-upload">
								<input type="file" name="files[]" class="file-upload-input with-preview" multiple title="Click to add files" maxlength="10" accept="gif|jpg|png">
								<span><i class="fa fa-plus-circle"></i>Click or drag images here</span>
							</div>
						</section>
						 <section class="clearfix">
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary large icon float-right">완료<i class="fa fa-chevron-right"></i></button>
                            </div>
                        </section>
					</form>
					<!--end form-submit-->
				</div>
				<!--end container-->
			</section>
			<!--end block-->
		</section>
		<!--end content-->
	</div>
	<!--end page-->
</body>
</html>

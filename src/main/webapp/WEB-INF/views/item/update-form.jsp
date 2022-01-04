<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.css"
	type="text/css">
<link rel="stylesheet" href="assets/fonts/font-awesome.css"
	type="text/css">
<link rel="stylesheet" href="assets/css/selectize.css" type="text/css">
<link rel="stylesheet" href="assets/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/user.css">



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
							<li class="breadcrumb-item"><a href="index.html">Home</a></li>
							<li class="breadcrumb-item"><a href="#">Pages</a></li>
							<li class="breadcrumb-item active">${itemDetail.categoryVO.categoryName}</li>
						</ol>
						<!--end breadcrumb-->
					</div>
					<!--end container-->
				</div>
				<!--============ End Main Navigation ================================================================-->
				<!--============ Page Title =========================================================================-->
				<div class="page-title">
					<div class="container">
						<h1>중고거래 글 수정</h1>
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
					<form class="form form-submit" action="updateItem" method="post" enctype="multipart/form-data">
						<sec:csrfInput />
						<section style="margin-bottom: 0px">
							<div class="row">
							<!-- 1. CATEGORY -->
								<div class="col-md-4">
									<div class="form-group">
										<label for="submit-category" class="col-form-label">Category</label>
										<select class="change-tab" data-change-tab-target="category-tabs" name="categoryVO.categoryId"  id="submit_category" data-placeholder="Select Category" required="required">
											<!-- <option value="">Select Category</option> -->
												<c:forEach items="${categoryList}" var="category">
														<option value="${category.categoryId}">${category.categoryName}</option>
												   <c:if test=" ${itemDetail.categoryVO.categoryId} eq ${category.categoryId} ">
												  	  <option value="${itemDetail.categoryVO.categoryId}" selected>${itemDetail.categoryVO.categoryName}</option>
												  </c:if>
												</c:forEach>
										</select>
									</div>
								</div>
							    <!-- 2. Change Item Status -->
								<div class="col-md-4">
									<div class="form-group">
										<label for="submit-category" class="col-form-label">Item Status</label>
										<select class="change-tab" data-change-tab-target="category-tabs" name="itemStatus"  id="submit_category" data-placeholder="Select Category" required="required">
											<option value="">Change Item Status</option>
												<option value="SELLING">SELLING</option>
												<option value="RESERVED">RESERVED</option>
												<option value="SOLD">SOLD</option>
										</select>
											<%-- <c:when test="${itemDetail.itemStatus=='SELLING'}">
												<option value="${itemDetail.itemStatus}">${itemDetail.itemStatus}</option>
												<option value="SOLD">SOLD</option>
											</c:when>
											<c:otherwise>
												<option value="${itemDetail.itemStatus}">${itemDetail.itemStatus}</option>
												<option value="SELLING">SELLING</option>
											</c:otherwise> --%>
									</div>
									<!--end form-group-->
								</div>
								<!--end col-md-4-->
								<!-- 3. 작성자 -->
								<div class="col-md-4">
									<div class="form-group">
										<label for="submit-atcegory" class="col-form-label">작성자</label>
										<input readonly name="userId" type="text" class="form-control"
											id="userId" value="${itemDetail.userVO.userId}">
									</div>
									<!--end form-group-->
								</div>
								<!--end col-md-4-->
							</div>
							<!--end row-->
						</section>
						<section style="margin-bottom: 0px">
							<div class="row">
							<!-- 4.TITLE -->
								<div class="col-md-8">
									<div class="form-group">
										<label for="itemTitle" class="col-form-label required">Title</label>
										<input name="itemTitle" type="text" class="form-control"
											id="itemTitle" placeholder="Title" maxlength="20"  required="required"
											value="${itemDetail.itemTitle}">
									</div>
									<!--end form-group-->
								</div>
								<!--end col-md-8-->
					        <!--5. PRICE -->
								<div class="col-md-4">

									<!--3. PRICE -->

									<div class="form-group">
										<label for="itemPrice" class="col-form-label required">Price</label>
										<input name="itemPrice" type="text" class="form-control"
											id="itemPrice"  min="0" required="required"
											value="${itemDetail.itemPrice}"> <span
											class="input-group-addon">원</span>
									</div>
									<!--end form-group-->
								</div>
							</div>
						</section>
						<!--end basic information-->
						<section style="margin-bottom: 0px">
							<!-- 4.ADDITIONAL DETAILS -->

							<div class="form-group">
								<label for="itemContent" class="col-form-label">Additional
									Details</label>
								<textarea name="itemContent" id="itemContent"
									class="form-control" rows="4">${itemDetail.itemContent}</textarea>
							</div>
							<!--end form-group-->
						</section>
						<!-- 7.file-upload-previews -->
						<section>



	



							<div class="file-upload-previews">
								
				 
								<c:forEach var="kwon" items="${imageList}" varStatus="status">
									<div class="MultiFile-label" id="${status.index }">
										 <span><span
											class="MultiFile-label"> <span
												class="MultiFile-title">기존사진												
												 </span>
												 <img
												class="MultiFile-preview"
												style="max-height: 100px; max-width: 100px;"
												src="/assets/upload/${kwon.imageName}">
										</span>
										<input type="checkbox"  name="delList" value="${kwon.imageId }">
										
										</span>
									</div>
								</c:forEach>
										<input type="hidden"  name="delList" value="0">
										 
								  
							</div>
							
													
							
							 

							<div class="file-upload">
								<!--
								-----issue--------								
								update 
								기존 저장된 사진과 변경해야 할 사진 간의 문제 발생
								변경해야 할 사진이 바로 저장될경우 업데이트해야할 기존 파일 변경문제 
								
								-----solution------
								삭제 해야할 리스트 넘기기? --- 수정 되어야 할 사진 리스트 출력후 
																							
							 -->
								<!-- 우선기존 사진 불러오기 -->




								<input type="file" name="item_Images"
									class="file-upload-input with-preview" multiple
									title="Click to add files" maxlength="10" accept="gif|jpg|png"
									 
									>
							 
								 
								
								<span><i class="fa fa-plus-circle"></i>Click or drag
									images here</span>

							</div>
						</section>
						<section class="clearfix">
							<div class="form-group">
								<input type="hidden" name="itemId" value="${itemDetail.itemId}">
								<button type="submit"
									class="btn btn-primary large icon float-right">
									완료<i class="fa fa-chevron-right"></i>
								</button>
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
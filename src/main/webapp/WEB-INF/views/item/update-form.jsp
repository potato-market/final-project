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
								<div class="col-md-4">
									<div class="form-group">

										<!-- 1. CATEGORY -->

										<label for="submit-category" class="col-form-label">Category</label>
										<select class="change-tab"
											data-change-tab-target="category-tabs"
											name="categoryVO.categoryId" id="submit-category"
											data-placeholder="Select Category" required="required">
											<option value="">Select Category</option>
											<option value="1">디지털기기</option>
											<option value="2">생활가전</option>
											<option value="3">가구/인테리어</option>
											<option value="4">유아동</option>
											<option value="5">생활/가공식품</option>
											<option value="6">유아도서</option>
											<option value="7">스포츠/레저</option>
											<option value="8">여성잡화</option>
											<option value="9">여성의류</option>
											<option value="10">남성패션/잡화</option>
											<option value="11">게임/취미</option>
											<option value="12">뷰티/미용</option>
											<option value="13">반려동물용품</option>
											<option value="14">도서/티켓/음반</option>
											<option value="15">식물</option>
											<option value="16">기타 중고물품</option>
											<option value="17">삽니다</option>
										</select>
									</div>
									<!--end form-group-->
								</div>
								<!--end col-md-4-->
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
								<div class="col-md-8">

									<!-- 2.TITLE -->

									<div class="form-group">
										<label for="itemTitle" class="col-form-label required">Title</label>
										<input name="itemTitle" type="text" class="form-control"
											id="itemTitle" placeholder="Title" required="required"
											value="${itemDetail.itemTitle}">
									</div>
									<!--end form-group-->
								</div>
								<!--end col-md-8-->
								<div class="col-md-4">

									<!--3. PRICE -->

									<div class="form-group">
										<label for="itemPrice" class="col-form-label required">Price</label>
										<input name="itemPrice" type="text" class="form-control"
											id="itemPrice" required="required"
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
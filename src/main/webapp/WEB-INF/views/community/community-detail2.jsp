<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authentication property="principal.userId" var="userId" />
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
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/user.css">

<title>Craigs - Easy Buy & Sell Listing HTML Template</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
<style>
#deleteAtag:hover {
	color: red;
	cursor: pointer;
}
</style>
<script>
//a tag form 제출
function deleteCommunity() {
	if (!confirm("정말 삭제하시겠습니까?")) {
		return false;
	} else {
		document.getElementById("communityForm").submit();
	}
}

function deleteComment() {
	if (!confirm("정말 삭제하시겠습니까?")) {
		return false;
	} else {
		document.getElementById("commentForm").submit();
	}
}
</script>
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
						<h1>동네생활 글 상세보기</h1>
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
			<section class="block" style="background-color: #f2f2f2f2;">
				<form method="post" action="deleteCommunity" id=communityForm">
					<sec:csrfInput />
					<input type="hidden" name="communityId"
						value="${communityData.communityId }">
					<div class="container">
						<!--Author-->
						<section id="article-profile">
							<div class="row">
								<div class="col-md-12">
									<a id="article-profile-link" href="#">
										<div id="article-profile-image">
											<img alt="${communityData.userVO.userId }"
												src="https://dnvefa72aowie.cloudfront.net/origin/profile/202111/812C55C307D33D81E0FBC697E4E7DADC17FA56C2FA09E4EB87DAA79ED6EB5FB3.jpg?q=82&amp;s=80x80&amp;t=crop">
										</div>
										<div id="article-profile-left">
											<div id="nickname">${communityData.userVO.userId }</div>
											<div id="region-name">${communityData.userVO.userAddress }</div>
										</div>
									</a>
								</div>
							</div>
						</section>
						<!-- End Author -->
						<!--description-->
						<div class="col-md-12"
							style="border-bottom: 1px solid #e9ecef; padding-bottom: 23px;">
							<p>${communityData.communityContent  }</p>
							<div class="float-right float-xs-none d-xs-none">
								<a
									href="updateCommunityForm?communityId=${communityData.communityId}">수정</a>&nbsp
								<a onclick="return deleteCommunity()" id="deleteAtag">삭제</a>
							</div>
						</div>
						<!--end description-->
					</div>
				</form>
				<div class="container">
					<div class="row">
						<div class="col-12" id="reply_card${tmp.no }">
							<section
								style="padding-top: 23px; border-bottom: 1px solid #e9ecef; ">
								<!-- 댓글 -->
								<div class="card-body">
									<!-- 댓글 목록 -->
									<div class="reply-list reply-list${tmp.no }">
										<!-- 댓글 목록이 들어가는 곳 -->
									</div>
									<!-- 댓글 작성 -->
									<div class="row ">
										<div class="col-10">
											<div class="form-group" class="input_reply_div">
												<input name=communityContent type="text"
													class="form-control" id="input_reply"
													placeholder="댓글을 입력해주세요.">
											</div>
											<!-- end form-group -->
										</div>
										<div class="col-2">
											<div class="form-group">
												<button class="btn btn-primary" idx="" type="button">댓글 등록</button>
											</div>
											<!-- end form-group -->
										</div>
									</div>
									<!-- end row -->
								</div>
							</section>

							<section>
								<div class="comments">
									<form method="post" action="deleteComment" id="deleteComment">
										<div class="comment">
											<div class="author" >
												<a href="#" class="author-image" style="width: 40px; height: 40px;">
													<div class="background-image">
														<img src="assets/img/author-09.jpg" alt="">
													</div>
												</a>
												<div class="author-description" style="margin-left: 0rem;  padding-top: 0rem; margin-left: 6rem;  padding-bottom: 1rem;">
													<div class="meta">
														<h5>
															<a href="#">Jane Doe</a>
														</h5>
														<span>02.05.2017</span>
														<div class="float-right float-xs-none d-xs-none">
															<a href="#">수정</a>&nbsp <a
																onclick="return deleteComment()">삭제</a>
														</div>
													</div>
													<!--end meta-->
													<p>댓글 내용</p>
												</div>
												<!--end author-description-->
											</div>
											<!--end author-->
										</div>
										<!--end comment-->
									</form>
									<!--end form-->
								</div>
								<!--end comments-->
								<div class="center">
									<a href="#" class="btn btn-primary btn-rounded btn-framed">Load
										More</a>
								</div>
							</section>
						</div>
						<!--end col-12-->
					</div>
					<!--end row-->
				</div>
				<!--end container-->
			</section>
			<!--end block-->
		</section>
		<!--end content-->
	</div>
	<!--end page-->
<script>
	
	
	
	
	
	
		/*
		 * 댓글 등록하기(Ajax)
		 */
		function fn_comment(code) {

			$.ajax({
				type : 'POST',
				url : "<c:url value='/board/addComment.do'/>",
				data : $("#commentForm").serialize(),
				success : function(data) {
					if (data == "success") {
						getCommentList();
						$("#comment").val("");
					}
				},
				error : function(request, status, error) {
					//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}

			});
		}

		/**
		 * 초기 페이지 로딩시 댓글 불러오기
		 */
		$(function() {

			getCommentList();

		});

		/**
		 * 댓글 불러오기(Ajax)
		 */
		function getCommentList() {

			$
					.ajax({
						type : 'GET',
						url : "<c:url value='/board/commentList.do'/>",
						dataType : "json",
						data : $("#commentForm").serialize(),
						contentType : "application/x-www-form-urlencoded; charset=UTF-8",
						success : function(data) {

							var html = "";
							var cCnt = data.length;

							if (data.length > 0) {

								for (i = 0; i < data.length; i++) {
									html += "<div>";
									html += "<div><table class='table'><h6><strong>"
											+ data[i].writer + "</strong></h6>";
									html += data[i].comment
											+ "<tr><td></td></tr>";
									html += "</table></div>";
									html += "</div>";
								}

							} else {

								html += "<div>";
								html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
								html += "</table></div>";
								html += "</div>";

							}

							$("#cCnt").html(cCnt);
							$("#commentList").html(html);

						},
						error : function(request, status, error) {

						}

					});
		}
</script>
</body>
</html>

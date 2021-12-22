<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
<script>
	var IDX = getQueryStringObject().idx;
	 function getQueryStringObject() {
	    var a = window.location.search.substr(1).split('&');
	    if (a == "") return {};
	    var b = {};
	    for (var i = 0; i < a.length; ++i) {
	        var p = a[i].split('=', 2);
	        if (p.length == 1)
	            b[p[0]] = "";
	        else
	            b[p[0]] = decodeURIComponent(p[1].replace(/\+/g, " "));
	    }
	    return b;
	}
	function drawReply(replys) {
		$("#cnt").text("등록된 댓글 - " + replys.length)
		var html = '';
		html += '<form class="form-inline" action="writeReply" method="post"><input type="hidden" name="idx" value = "' + IDX + '"><input type="hidden" name="replyIdx" value = "0"><input type="text" class="form-control mb-2 mr-sm-2" id="contents" placeholder="답글" name="contents"><button type="submit" class="btn btn-primary mb-2">등록</button></form>';
		replys.forEach(function(reply){ 
			if (reply.replyIdx == 0) {
				var rc = 0;
				replys.forEach(function(i){
					if (reply.idx == i.replyIdx) rc++;
				})
				html += '<div class="row"><div class="col-sm-12">';
				html += '<form class="form-inline" action="writeReply" method="post"><label for="pwd" class="mr-sm-2">' + reply.contents + '(' + rc + ')' + '</label>'
				html += '<input type="hidden" name="idx" value = "' + IDX + '"><input type="hidden" name="replyIdx" value = "' + reply.idx + '"><input type="text" class="form-control mb-2 mr-sm-2" id="contents" placeholder="답글" name="contents"><button type="submit" class="btn btn-primary mb-2">등록</button></form>';
				html += '<div class="row"><div class="col-sm-12 sub' + reply.idx + '"></div></div></div></div>';
			}
		})
		$("#replyArea").append(html);
		replys.forEach(function(reply){ 
			if (reply.replyIdx != 0) {
				var rc = 0;
				replys.forEach(function(i){
					if (reply.idx == i.replyIdx) rc++;
				})
				var subHtml = '';
				subHtml = '<div class="row"><div class="col-sm-12 subReply">';
				subHtml += '<form class="form-inline" action="writeReply" method="post"><label for="pwd" class="mr-sm-2">' + reply.contents + '(' + rc + ')' + '</label>'
				subHtml += '<input type="hidden" name="idx" value = "' + IDX + '"><input type="hidden" name="replyIdx" value = "' + reply.idx + '"><input type="text" class="form-control mb-2 mr-sm-2" id="contents" placeholder="답글" name="contents"><button type="submit" class="btn btn-primary mb-2">등록</button></form>';
				subHtml += '<div class="row"><div class="col-sm-12 sub' + reply.idx + '"></div></div></div></div>';
				$(".sub" + reply.replyIdx).append(subHtml);
			}
		})
	}
	  $.ajax({url: "boardView?idx="+IDX, success: function(result){
		  $("#image").append('<img src="resources/'+ result.image + '" style="width: 100%;">');
		  $("#title").text(result.title);
		  $("#contents").text(result.contents);
	   }});
	  $.ajax({url: "replyList?idx="+IDX, success: function(replys){
		  drawReply(replys)
	   }});
	  
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
						<h1>Frequently Asked Questions</h1>
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
				<div class="container">
					<!--Author-->
					<section id="article-profile">
						<div class="row">
							<div class="col-md-12">
								<a id="article-profile-link" href="#">
									<div id="article-profile-image">
										<img alt="이름"
											src="https://dnvefa72aowie.cloudfront.net/origin/profile/202111/812C55C307D33D81E0FBC697E4E7DADC17FA56C2FA09E4EB87DAA79ED6EB5FB3.jpg?q=82&amp;s=80x80&amp;t=crop">
									</div>
									<div id="article-profile-left">
										<div id="nickname">이름</div>
										<div id="region-name">주소</div>
									</div>
								</a>
							</div>
						</div>
					</section>
					<!-- End Author -->
					<!--description-->
					<div class="col-md-12"
						style="border-bottom: 1px solid #e9ecef; padding-bottom: 23px;">
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut
							nec tincidunt arcu, sit amet fermentum sem. Class aptent taciti
							sociosqu ad litora torquent per conubia nostra, per inceptos
							himenaeos.</p>
					</div>
					<!--end description-->
				</div>
				<div class="background">
					<div class="background-image original-size background-repeat-x">
						<img src="assets/img/gradient-background.png" alt="">
					</div>
					<!--end background-image-->
				</div>
				<!--end background-->
				
				 <h2 id = "cnt"></h2>
				<div class="container">
					<div class="col-12">
						<section
							style="padding-top: 23px; border-bottom: 1px solid #e9ecef; padding-bottom: 23px;">
							<div id = "replyArea"></div>
							
							<!-- <form class="form" action="writeComment">
								<div class="row">
									<div class="col-10">
										<div class="form-group">
											<input name="subject" type="text" class="form-control"
												id="subject" placeholder="댓글을 입력해주세요.">
										</div>
										end form-group
									</div>
									end col-md-8
									<div class="col-2">
										<div class="form-group">
											<button class="btn btn-primary" type="submit">댓글 등록</button>
										</div>
										end form-group
									</div>
									end col-md-4
								</div>
								end row
							</form>
							end form -->
						</section>
					</div>
					<!--end col-12-->
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

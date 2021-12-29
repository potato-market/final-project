<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authentication property="principal.userId" var="userId" />
<!doctype html>

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


<title>Chatting</title>

</head>
<body>
<a href="/">home</a>
	<noscript>
		<h2>Sorry! Your browser doesn't support Javascript</h2>
	</noscript>
	<section class="content">
		<section class="block">

			<div id="username-page">
				<div class="username-page-container">
					<form id="usernameForm" name="usernameForm" style="display: none;">
						<div class="form-group">
							<!-- <input type="text" id="name" placeholder="Username"
						autocomplete="off" class="form-control" /> -->
							<input type="hidden" id="name" name="name" value=${userId } /> <input
								type="hidden" id="chatRoomId" name="chatRoomId"
								value=${chatRoomId } class=chatRoomId /> <input type="hidden"
								name="itemId" value="${itemId }" />
						</div>
						<div class="form-group">
							<button type="submit" id="userFormAutoClick"
								class="accent username-submit">button</button>
						</div>
					</form>
				</div>
			</div>

			<div class="container">
				<div class="row">
					<div class="col-md-6 col-lg-6 col-xl-5">
						<!--============ Section Title===========================================================-->
						<div class="section-title clearfix">
							<h3>People</h3>
						</div>
						<div id="messaging__chat-list" class="messaging__box">
							<div class="messaging__header">
								<ul class="nav nav-pills">
									<li class="nav-item"><a class="nav-link active" href="#">All</a>
									</li>
								</ul>
							</div>
							<!-- 작업드가자~ -->
							<div class="messaging__content">
								<ul class="messaging__persons-list">

									<c:forEach var="item" items="${itemchatlist}"
										varStatus="status">
					 
										<li><a href="chatForm?userId=${userId}&selleId=${item.userVO.userId}&itemId=${item.itemId}" class="messaging__person">
												<figure class="messaging__image-person"
												data-background-image="assets/upload/${itemimglist[status.index] }"
													>
											
												</figure>
												<figure class="content">
													<h5>

														<!-- 이름 -->
														<small> ${item.userVO.userId} <!-- 장소 -->
														</small> &nbsp&nbsp&nbsp ${item.userVO.userAddress} <small>
															<!-- 시간 --> ${chatmessagelist[status.index].updateAt}
														</small>
													</h5>
													<p>
														<!-- 
															채팅 내용		
												 													
													 -->
														${chatmessagelist[status.index].content}
													</p>
												</figure>
												<figure class="messaging__image-item" 
												data-background-image="assets/upload/${userimglist[status.index] }"
												>
											    </figure>

										</a> <!--messaging__person--></li>
									</c:forEach>

								</ul>
								<!--end messaging__persons-list-->
							</div>


							<!--messaging__content-->
						</div>
						<!--end section-title-->
					</div>
					<!--end col-md-3-->
					<div class="col-md-6 col-lg-6 col-xl-7">
						<!--============ Section Title===========================================================-->
						<div class="section-title clearfix">
							<h3>Message Window</h3>
						</div>
						<!--end section-title-->
						<div id="messaging__chat-window" class="messaging__box">
							<!-- 메세지 창 머리 -->
							<div class="messaging__header">
								<div class="float-left flex-row-reverse messaging__person">
									<h5 class="font-weight-bold">Rosina Warner</h5>
									<figure class="mr-4 messaging__image-person"
										data-background-image="assets/img/author-02.jpg"></figure>
								</div>
							</div>

							<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
							<div id="chat-page" class="messaging__content"
								data-background-color="rgba(0,0,0,.05)">
								<div class="messaging__main-chat">

									<c:forEach var="l" items="${chatHistory}" varStatus="listatus">
										<c:choose>

											<c:when test="${l.sender eq userId}">
												<div class="messaging__main-chat__bubble user">
													<ul>
														<p>${l.content}</p>
													</ul>
												</div>
											</c:when>
											<c:otherwise>
												<div class="messaging__main-chat__bubble">
													<ul>
														<p>${l.content}</p>
													</ul>
												</div>
											</c:otherwise>

										</c:choose>

									</c:forEach>
									<div>
										<ul id="messageArea">

										</ul>
									</div>
 
								</div>
							</div>

							<div class="messaging__footer">
								<form class="form" id="messageForm" name="messageForm"
									nameForm="messageForm">
									<div class="input-group">
										<div class="input-group clearfix">
											<input type="text" id="message"
												placeholder="Type a message..." autocomplete="off"
												class="form-control" />
											<div class="input-group-append">
												<button class="btn btn-primary" type="submit">
													Send <i class="fa fa-send ml-3"></i>
												</button>
											</div>
										</div>
									</div>
								</form>
							</div><!-- end messaging__footer -->
						</div>
					</div>
					<!--end col-md-9-->
				</div>
				<!--end row-->
			</div>
			<!--end container-->
		</section>
		<!--end block-->
	</section>






	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
	<script src="/assets/js/chatting.js"></script>

	<script src="assets/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="assets/js/popper.min.js"></script>
	<script type="text/javascript"
		src="assets/bootstrap/js/bootstrap.min.js"></script>

	<script src="assets/js/selectize.min.js"></script>
	<script src="assets/js/masonry.pkgd.min.js"></script>
	<script src="assets/js/icheck.min.js"></script>
	<script src="assets/js/jquery.validate.min.js"></script>
	<script src="assets/js/custom.js"></script>
</body>
</html>

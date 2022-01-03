<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
<sec:authentication property="principal.userId" var="userId" />
<!doctype html>
<html lang="en">
<head>
<meta name="csrf-token" content="principal.">
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
            <form method="post" action="deleteCommunity" id="communityForm">
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
                     <c:choose>
                     	<c:when test="${userId==communityData.userVO.userId}">
                    		<div class="float-right float-xs-none d-xs-none">
                       	 		<a href="updateCommunityForm?communityId=${communityData.communityId}">수정</a>&nbsp
                        		<a onclick="return deleteCommunity()" id="deleteAtag">삭제</a>
                     		</div>
                     	</c:when>
                     </c:choose>
                  </div>
                  <!--end description-->
               </div>
            </form>
            <!-- end form -->
            <div class="container">
               <div class="row">
                  <div class="col-12">
                  <!-- comment form section -->
                     <section style="padding-top: 15px; border-bottom: 1px solid #e9ecef;margin-bottom: 3rem">
                           <!-- 댓글 작성 -->
                           <div class="row ">
                              <div class="col-10">
                                 <div class="form-group" class="input_reply_div">
                                    <input type="hidden" id="userId" value="${userId }"> 
                                    <input type="hidden" id="communityId" value="${communityData.communityId }">
                                    <input name=communityContent type="text" class="form-control" id="commentContent" placeholder="댓글을 입력해주세요."  autofocus="autofocus">
                                 </div>
                                 <!-- end form-group -->
                              </div>
                              <div class="col-2">
                                 <div class="form-group">
                                    <button class="btn btn-primary" id="writeCommentBtn" type="button">댓글 등록</button>
                                 </div>
                                 <!-- end form-group -->
                              </div>
                           </div>
                           <!-- end row -->
                     </section>
                     <!-- end comment form section -->
                     <!-- comment list section -->
                     <section>
                        <div class="comments"  id="commentList">
                           <c:forEach items="${commemtList}" var="commemtList">
                              <div class="comment"  id="${commemtList.commentId }">
                                 <form method="post" action="deleteComment" id="commentForm">
                                 <sec:csrfInput />
                                    <div class="author">
                                       <a href="#" class="author-image"
                                          style="width: 40px; height: 40px;">
                                          <div class="background-image">
                                             <img src="assets/img/author-09.jpg" alt="">
                                          </div>
                                       </a>
                                       <div class="author-description"
                                          style="margin-left: 0rem; padding-top: 0rem; margin-left: 6rem; padding-bottom: 1rem;">
                                          <div class="meta">
                                             <h5>
                                                <a href="#">${commemtList.userVO.userId }</a>
                                                <a href="#">${commemtList.commentId } </a>
                                             </h5>
                                             <span>${commemtList.commentCreatedAt }</span>
                                             <c:choose>
                     							 <c:when test="${userId==commemtList.userVO.userId}">
                                             		<div class="float-right float-xs-none d-xs-none">
                                                		<a class='updateCommentAtag"+result.commentId+"' data-id=${commemtList.commentId } >수정</a>&nbsp
                                                		<a id="deleteCommentAtag" class='deleteCommentAtag' data-id=${commemtList.commentId } >삭제</a>
                                            	 	</div>
                                            	 </c:when>
                                             </c:choose>
                                          </div>
                                          <!--end meta-->
                                          <p>${commemtList.commentContent }</p>
                                       </div>
                                       <!--end author-description-->
                                    </div>
                                    <!--end author-->
                                 </form>
                                 <!--end form-->
                                 </div>
                                 <!--end comment-->
                           </c:forEach>
                           <!--end c:forEach-->
                        </div>
                        <!--end comments-->
                        <div class="center">
                           <a href="#" class="btn btn-primary btn-rounded btn-framed">Load More</a>
                        </div>
                     </section>
                     <!-- end comment list section -->
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
//a tag form 제출
function deleteCommunity() {
	if (!confirm("정말 삭제하시겠습니까?")) {
		return false;
	} else {
		document.getElementById("communityForm").submit();
	}
}

$(function(){
	$("#writeCommentBtn").click(function() {
		let commentContent=$("#commentContent").val();
		let communityId=$("#communityId").val();
		let userId = $("#userId").val();
         
		if(commentContent==""){
 			alert("댓글 내용을 입력해주세요");
			$('#commentContent').focus();
		}else{
 			//ajax 전송시, 'x-csrf-token' 같은 헤더 정보를 추가해서 csrf 토큰값 전달
			var csrfHeaderName = "${_csrf.headerName}";
			var csrfTokenValue = "${_csrf.token}";
         
			//beforeSend는 시큐리티 적용시, 추가적인 헤더를 지정해서 ajax전송시 csrf를 토큰값 같이전송
			$.ajax({
				type:"post",
				url:"writeComment",
				data:"communityVO.communityId="+communityId+"&commentContent="+commentContent+"&userVO.userId="+userId,
				beforeSend: function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
				},
				success:function(result){
					$("#commentContent").val("");
					let commentInfo="";
               
					commentInfo+="<div class='comment' id='"+result.commentId+"'>";
					commentInfo+="<form method='post' action='deleteComment' id='deleteComment"+result.commentId+"'>";
					commentInfo+="   <input type='hidden' name='commentId' id='hiddenId'>";
          	      	commentInfo+="      <div class='author'>";
            	    commentInfo+="         <a href='#' class='author-image' style='width: 40px; height: 40px;'>";
                	commentInfo+="            <div class='background-image'>";
  	              	commentInfo+="               <img src='assets/img/author-09.jpg' alt=''>";
    	            commentInfo+="            </div>";
        	        commentInfo+="         </a>";
            	    commentInfo+="         <div class='author-description' style='margin-left: 0rem; padding-top: 0rem; margin-left: 6rem; padding-bottom: 1rem;'>";
                	commentInfo+="            <div class='meta'>";
 	               	commentInfo+="               <h5>";
    	            commentInfo+="                  <a href='#'>"+result.userVO.userId+"</a>";
        	        commentInfo+="                  <a href='#'>"+result.commentId +"</a>";
            	    commentInfo+="               </h5>";
  	              	commentInfo+="               <span>"+result.commentCreatedAt+"</span>";
    	            commentInfo+="               <div class='float-right float-xs-none d-xs-none' id='buttonDiv"+result.commentId+"'>";
        	        commentInfo+="                  	<a class='updateCommentAtag"+result.commentId+"'>수정</a>&nbsp ";
        	        commentInfo+="					<a id=+'+result.commentId' class='deleteCommentAtag"+result.commentId+"'>삭제</a>";
            	    commentInfo+="               </div>";
                	commentInfo+="            </div>";
  	             	 commentInfo+="            <p>"+result.commentContent+"</p>";
    	            commentInfo+="         </div>";
        	        commentInfo+="      </div>";
            	    commentInfo+="</form>";
                	commentInfo+="</div>";
               
					/* html 동적 생성 */
					$("#commentList").append(commentInfo);
					$(".deleteCommentAtag").attr("id","deleteCommentAtag"+result.commentId);
					$(".updateCommentAtag").attr("id","updateCommentAtag"+result.commentId);
               
					/* data 동적 생성 */
					//$("#hiddenId").data("id",result.commentId);
              	 	//alert($("#hiddenId").data("id")); //동적 생성되는 commentId 확인을 위한 alert
              	    
              	 	/* 삭제 click event 동적 생성 */
                	$("#buttonDiv"+result.commentId).on("click",".deleteCommentAtag"+result.commentId,function(){
						console.log(result.commentId);
						//let commentId=$("#hiddenId").data("id");
                  		let commentId=result.commentId;
                		console.log(commentId);
 						if(!confirm("정말 삭제하시겠습니까?")){
							return false;
 						}else{
 							//ajax 전송시, 'x-csrf-token' 같은 헤더 정보를 추가해서 csrf 토큰값 전달
 							var csrfHeaderName = "${_csrf.headerName}";
 							var csrfTokenValue = "${_csrf.token}";
                     
 							//beforeSend는 시큐리티 적용시, 추가적인 헤더를 지정해서 ajax전송시 csrf를 토큰값 같이전송
 							$.ajax({
 								type:"post",
 								url:"deleteComment",
 								data:"commentId="+result.commentId,
 								beforeSend: function(xhr){
									xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
								},
								success:function(result){
									console.log(commentId);
									alert(commentId);
										$("#"+commentId).remove();
									//$(this).parents(".comment").remove();
									console.log("dynamic remove"+commentId);
									alert("삭제되었습니다.");
								}//success callback
							});//ajax
						}//if
					});//delete click
					
					
					
				}//success callback
			});//ajax
		}//if
	});//click
});//ready


$(function(){      
	$(".deleteCommentAtag").click(function() {
		let commentId=$(this).data("id");
		//alert($(this).data("id"));
         
		if(!confirm("정말 삭제하시겠습니까?")){
			return false;
		}else{
			//ajax 전송시, 'x-csrf-token' 같은 헤더 정보를 추가해서 csrf 토큰값 전달
			var csrfHeaderName = "${_csrf.headerName}";
			var csrfTokenValue = "${_csrf.token}";
            
			//beforeSend는 시큐리티 적용시, 추가적인 헤더를 지정해서 ajax전송시 csrf를 토큰값 같이전송
			$.ajax({
				type:"post",
				url:"deleteComment",
				data:"commentId="+commentId,
				beforeSend: function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
				},
				success:function(result){
					$("#"+commentId).remove(); 
					console.log("static remove"+commentId);
					alert("삭제되었습니다.");
				}//success callback
			});//ajax
		}//if
	});//click
});//ready
	
	
//static update
$(function(){      
	$(".updateCommentAtag").click(function() {
		let commentId=$(this).data("id");
		//alert($(this).data("id"));
	         
		if(!confirm("정말 삭제하시겠습니까?")){
			return false;
		}else{
			//ajax 전송시, 'x-csrf-token' 같은 헤더 정보를 추가해서 csrf 토큰값 전달
			var csrfHeaderName = "${_csrf.headerName}";
			var csrfTokenValue = "${_csrf.token}";
	            
			//beforeSend는 시큐리티 적용시, 추가적인 헤더를 지정해서 ajax전송시 csrf를 토큰값 같이전송
			$.ajax({
				type:"post",
				url:"deleteComment",
				data:"commentId="+commentId,
				beforeSend: function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
				},
				success:function(result){
					$("#"+commentId).remove(); 
					console.log("static remove"+commentId);
					alert("삭제되었습니다.");
				}//success callback
			});//ajax
		}//if
	});//click	
});//ready
</script>
</body>
</html>
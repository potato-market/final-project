//a tag form 제출
function deleteCommunity() {
	if (!confirm("정말 삭제하시겠습니까?")) {
		return false;
	} else {
		document.getElementById("communityForm").submit();
	}
}

$(function() {
	$("#writeCommentBtn").click(function() {
		let commentContent = $("#commentContent").val();
		let communityId = $("#communityId").val();
		let userId = $("#userId").val();

		if (commentContent == "") {
			alert("댓글 내용을 입력해주세요");
			$('#commentContent').focus();
		} else {
			//ajax 전송시, 'x-csrf-token' 같은 헤더 정보를 추가해서 csrf 토큰값 전달
			var csrfHeaderName = "${_csrf.headerName}";
			var csrfTokenValue = "${_csrf.token}";

			//beforeSend는 시큐리티 적용시, 추가적인 헤더를 지정해서 ajax전송시 csrf를 토큰값 같이전송
			$.ajax({
				type: "post",
				url: "writeComment",
				data: "communityVO.communityId=" + communityId + "&commentContent=" + commentContent + "&userVO.userId=" + userId,
				beforeSend: function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
				},
				success: function(result) {
					$("#commentContent").val("");
					let commentInfo = "";

					commentInfo += "<div class='comment' id='" + result.commentId + "'>";
					commentInfo += "<form method='post' action='deleteComment' id='deleteComment" + result.commentId + "'>";
					commentInfo += "   <input type='hidden' name='commentId' id='hiddenId'>";
					commentInfo += "      <div class='author'>";
					commentInfo += "         <a href='#' class='author-image' style='width: 40px; height: 40px;'>";
					commentInfo += "            <div class='background-image'>";
					commentInfo += "               <img src='assets/img/author-09.jpg' alt=''>";
					commentInfo += "            </div>";
					commentInfo += "         </a>";
					commentInfo += "         <div class='author-description' style='margin-left: 0rem; padding-top: 0rem; margin-left: 6rem; padding-bottom: 1rem;'>";
					commentInfo += "            <div class='meta'>";
					commentInfo += "               <h5>";
					commentInfo += "                  <a href='#'>" + result.userVO.userId + "</a>";
					commentInfo += "                  <a href='#'>" + result.commentId + "</a>";
					commentInfo += "               </h5>";
					commentInfo += "               <span>" + result.commentCreatedAt + "</span>";
					commentInfo += "               <div class='float-right float-xs-none d-xs-none' id='buttonDiv" + result.commentId + "'>";
					commentInfo += "                  <a href='#'>수정</a>&nbsp <a id=+'+result.commentId' class='deleteCommentAtag" + result.commentId + "' data-id='" + result.commentId + "'>삭제</a>";
					commentInfo += "               </div>";
					commentInfo += "            </div>";
					// commentInfo+="            <p>"+result.commentContent+result.commentId+"</p>";
					commentInfo += "         </div>";
					commentInfo += "      </div>";
					commentInfo += "</form>";
					commentInfo += "</div>";

					/* html 동적 생성 */
					$("#commentList").append(commentInfo);
					$("#deleteCommentAtag").attr("id", "deleteCommentAtag" + result.commentId);

					/* data 동적 생성 */
					//$("#hiddenId").data("id",result.commentId);
					//alert($("#hiddenId").data("id")); //동적 생성되는 commentId 확인을 위한 alert
					/* click event 동적 생성 */
					$("#buttonDiv" + result.commentId).on("click", result.commentId, function() {
						console.log(result.commentId);
						//let commentId=$("#hiddenId").data("id");
						let commentId = result.commentId;
						console.log(commentId);
						if (!confirm("정말 삭제하시겠습니까?")) {
							return false;
						} else {
							//ajax 전송시, 'x-csrf-token' 같은 헤더 정보를 추가해서 csrf 토큰값 전달
							var csrfHeaderName = "${_csrf.headerName}";
							var csrfTokenValue = "${_csrf.token}";

							//beforeSend는 시큐리티 적용시, 추가적인 헤더를 지정해서 ajax전송시 csrf를 토큰값 같이전송
							$.ajax({
								type: "post",
								url: "deleteComment",
								data: "commentId=" + result.commentId,
								beforeSend: function(xhr) {
									xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
								},
								success: function(result) {
									console.log(commentId);

									alert(commentId);
									$("#" + commentId).remove();
									//$(this).parents(".comment").remove();
									console.log("dynamic remove" + commentId);
									alert("삭제되었습니다.");

								}//success callback
							});//ajax
						}//if
					});
				}//success callback
			});//ajax
		}//if
	});//click
});//ready


$(function() {
	$(".deleteCommentAtag").click(function() {
		let commentId = $(this).data("id");
		//alert($(this).data("id"));

		if (!confirm("정말 삭제하시겠습니까?")) {
			return false;
		} else {
			//ajax 전송시, 'x-csrf-token' 같은 헤더 정보를 추가해서 csrf 토큰값 전달
			var csrfHeaderName = "${_csrf.headerName}";
			var csrfTokenValue = "${_csrf.token}";

			//beforeSend는 시큐리티 적용시, 추가적인 헤더를 지정해서 ajax전송시 csrf를 토큰값 같이전송
			$.ajax({
				type: "post",
				url: "deleteComment",
				data: "commentId=" + commentId,
				beforeSend: function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
				},
				success: function(result) {
					$("#" + commentId).remove();
					console.log("static remove" + commentId);
					alert("삭제되었습니다.");
				}//success callback
			});//ajax
		}//if
	});//click
});//ready

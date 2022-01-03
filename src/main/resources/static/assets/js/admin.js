$(document).ready(function() {
		$("#logoutAction").click(function() {
			if (!confirm("로그아웃 하시겠습니까?")) {
				location.href = "#";
			} else {
				$("#logoutForm").submit();
			}
		});

		$("#managingBtn").click(function() {
			openNav();
		});
	});

	function openNav() {
		document.getElementById("myNav").style.width = "100%";
	}

	function closeNav() {
		document.getElementById("myNav").style.width = "0%";
	}
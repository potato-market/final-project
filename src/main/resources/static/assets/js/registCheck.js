let id = 1;

		//ID 중복체크 ajax방식
		function IdCheckResult() {
			let IdCheckInfo = $("#login_id").val(); //입력한 id를 get
			//alert(IdCheckInfo); //입력값이 넘어오는지 확인
			$(document).ready(
					function() {
						$.ajax({
							type : "get",
							url : "registerIdCheck",
							//data:"userId=IdCheckInfo",
							data : "userId=" + IdCheckInfo,
							success : function(result) {
								//alert(result);
								//span요소인 IdCheckResult 에 뿌려준다
								if (result == 0) {
									$("#IdCheckResult").text("사용 가능한 아이디입니다").css("color", "green");
									 id = 0;
								} else {
									$("#IdCheckResult").text("중복된 아이디입니다").css("color", "red");
									 id = 1;
								}
								//$("#IdCheckResult").text(result).css("color","red");	
								/* if(result.contains("사용"){
									$("#IdCheckResult").text(result).css("color","green");
								}else{
									$("#IdCheckResult").text(result).css("color","red");	
								} */
								//alert(result);
							}
						}); //$.ajax
					});//ready
		}//IdCheckResult

		//비밀번호 확인 후 ajax문구 띄운다  //수업 때 배운 jquery-ajax 발전방식으로 바꿔야 함
		function passwordResult() {
			let password = document.forms[0];
			let pass1 = password.userPassword.value;
			let pass2 = password.login_password_check.value;
			if (pass1 != pass2) {
				document.getElementById("passwordResult").style.color = "red";
				document.getElementById("passwordResult").innerHTML = "비밀번호가 일치하지 않습니다.";
			} else {
				document.getElementById("passwordResult").style.color = "green";
				document.getElementById("passwordResult").innerHTML = "비밀번호가 일치합니다.";
			}
		}

		//가입하기 누를 때 발생하는 이벤트 
		$(document).ready(function() {
			$("#registerForm").submit(function() {
				//아래 코드는 passwordResult()와 중복되는데 리팩토링 필요할 듯
				let password = document.forms[0];
				let pass1 = password.userPassword.value;
				let pass2 = password.login_password_check.value;
				if (pass1 != pass2) {
					alert("패스워드가 일치하지 않습니다.");
					$("#login_password_check").focus();
					return false;
				}
				let login_id=$("#login_id").val();
				//let login_id = document.getElementById("login_id").value;
				if (login_id == "") {
					alert("아이디를 입력해주세요.");
					return false;
				}
				
				if (id == 1) {
					alert("아이디 중복을 확인해주세요.");
					$("#login_id").focus();
					document.getElementById("login_id").focus();
					return false;
				}
				
				//공백 사용 제한 var12345 지저분한데 리팩토링 필요...
				var str1 = document.getElementById('login_id');
				var str2 = document.getElementById('login_password');
				var str3 = document.getElementById('login_password_check');
				var str4 = document.getElementById('login_tel');
				var str5 = document.getElementById('login_Email');
						var blank_pattern = /[\s]/g;
						if( blank_pattern.test( str1.value) == true){
						    alert("공백은 사용할 수 없습니다. ");
						    $("#login_id").focus();
						    return false;
						}
						if( blank_pattern.test( str2.value) == true){
						    alert("공백은 사용할 수 없습니다. ");
						    $("#login_password").focus();
						    return false;
						}
						if( blank_pattern.test( str3.value) == true){
						    alert("공백은 사용할 수 없습니다. ");
						    $("#login_password_check").focus();
						    return false;
						}
						if( blank_pattern.test( str4.value) == true){
						    alert("공백은 사용할 수 없습니다. ");
						    $("#login_tel").focus();
						    return false;
						}
						if( blank_pattern.test( str5.value) == true){
						    alert("공백은 사용할 수 없습니다. ");
						    $("#login_Email").focus();
						    return false;
						}
						
						/* let special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
						if( special_pattern.test(str1.value) == true ){
						    alert("특수문자는 사용할 수 없습니다.");
						    return false; 	
						} */
					/* 	var pattern10 = /[0-9]/;
						var pattern20 = /[a-zA-Z]/; 
						var pattern30 = /[~!@#$%^&*()_+|<>?:{}]/; 
						if(!pattern10.test(str2) || !pattern20.test(str2) || !pattern30.test(str2) || str.length < 8) { 
							alert("비밀번호는 8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다."); 
							return false; 
						} */
				else {
					return confirm("가입할래?");
				}

				//var str = document.getElementsByClassName("check");
				//var blank_pattern = /[\s]/g;
				//if( blank_pattern.test( str.value) == true){
				  //  alert("공백은 사용할 수 없습니다."");
				    //return false;
				//}
				//var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
				 //if( special_pattern.test(str.value) == true ){
				 //alert('특수문자는 사용할 수 없습니다.');
				 //return false;
				 
			});
		});
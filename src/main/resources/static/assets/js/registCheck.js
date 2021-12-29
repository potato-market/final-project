let id = 1;
let TelCheck=1;


$(function(){ 
   $('#login_tel').keydown(function(event) { 
      var key = event.charCode || event.keyCode || 0; 
      $text = $(this); 
      if (key !== 8 && key !== 9) { 
         if ($text.val().length === 3) { 
            $text.val($text.val() + '-'); 
         } 
         if ($text.val().length === 8) { 
            $text.val($text.val() + '-'); 
         } 
      } 
   return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105)); 
   }); 
});

//이메일에 도메인주소 추가하기
function setEmailDomain(domain) {
			//alert("emailtest2");
			$("#email_domain").val(domain);
			
			$("#emailSelect option:selected").each(function () {
		if($(this).val()== "1"){ //직접입력일 경우
			 $("#email_domain").val("");                        //값 초기화
			 $("#email_domain").attr("disabled",false); //활성화
		}else{ //직접입력이 아닐경우
			 $("#email_domain").val($(this).text());      //선택값 입력
			 $("#email_domain").attr("disabled",true); //비활성화
		}//else
   }); //option
			
			
		}
//위와 아래는 2개로 나누면 충돌이 발생해서 change이벤트는 하나로 만들어줘야 한다
//$("#emailSelect").change(function(){
  // $("#emailSelect option:selected").each(function () {
		
	//	if($(this).val()== "1"){ //직접입력일 경우
		//	 $("#email_domain").val("");                        //값 초기화
			// $("#email_domain").attr("disabled",false); //활성화
		//}else{ //직접입력이 아닐경우
		//	 $("#email_domain").val($(this).text());      //선택값 입력
		//	 $("#email_domain").attr("disabled",true); //비활성화
		//}//else
   //}); //option
//});//change




//ID 중복체크 ajax방식
function IdCheckResult() {
	let IdCheckInfo = $("#login_id").val(); //입력한 id를 get
	$(document).ready(
		function() {
			$.ajax({
				type: "get",
				url: "registerIdCheck",
				data: "userId=" + IdCheckInfo,
				success: function(result) {
				var id_rule=/^[a-z0-9_-]{4,20}$/;
				if (!id_rule.test(IdCheckInfo)) {
				$("#IdCheckResult").text("아이디는 4~20자의 영문 소문자, 숫자, 특수기호(-),(_)만 가능합니다").css("color", "red");
				}else if(result == 0){
					$("#IdCheckResult").text("사용가능한 아이디입니다").css("color", "green");
					id = 0;
					}else{
					$("#IdCheckResult").text("중복된 아이디입니다").css("color", "red");
					id = 1;
					}
					
					
					//alert(result);
					//span요소인 IdCheckResult 에 뿌려준다
					//아이디에 공백 입력시
					//alert(IdCheckInfo);
					//var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
					//if( special_pattern.test(IdCheckInfo) == true ){
					//alert("특수문자는 사용할 수 없습니다.");}
					//var id_rule = /^[가-힣]+$/i;
					//var blank_pattern = /[\s]/g;
					
					
					
				//	if (id_rule.test(IdCheckInfo)) {
				//	$("#IdCheckResult").text("아이디에  한글은 사용할 수 없습니다").css("color", "red");
				//}
					
					//if (blank_pattern.test(IdCheckInfo) == true) {
					//	$("#IdCheckResult").text("아이디에 공백은 사용할 수 없습니다").css("color", "red");
					//}
					
					//if (special_pattern.test(IdCheckInfo) == true) {
					//	$("#IdCheckResult").text("특수문자는 사용할 수 없습니다").css("color", "red");
					//} else if(result == 0) {
					//	$("#IdCheckResult").text("사용가능한 아이디입니다").css("color", "green");
					//	id = 0;
					//}else if(blank_pattern.test(IdCheckInfo) == true){
					//	$("#IdCheckResult").text("아이디에 공백은 사용할 수 없습니다").css("color", "red");
					//}else{
					//	$("#IdCheckResult").text("중복된 아이디입니다").css("color", "red");
					//	id = 1;
					//}
					
					//$("#IdCheckResult").text(result).css("color","red");	
					/* if(result.contains("사용"){
						$("#IdCheckResult").text(result).css("color","green");
					}else{
						$("#IdCheckResult").text(result).css("color","red");	
					} */
					
				}//alert(result);
			}); //$.ajax
		});//ready
}//IdCheckResult


//전화번호 중복체크
function EmailheckResult() {
	let telCheckInfo = $("#login_tel").val(); //입력한 id를 get
	$(document).ready(
		function() {
			$.ajax({
				type: "get",
				url: "registerTelCheck",
				//data:"userTel=telCheckInfo",
				data: "userTel=" + telCheckInfo,
				success: function(result) {
					//span요소인 IdCheckResult 에 뿌려준다
					 if(result == 0) {
						$("#telCheckResult").text("사용 가능한 전화번호입니다").css("color", "green");
						TelCheck=0;
					}else{
						$("#telCheckResult").text("사용 불가능한 전화번호입니다").css("color", "red");
						TelCheck=1;
					}
				}//alert(result);
			}); //$.ajax
		});//ready
}//TelCheckResult






//비밀번호 일치여부 확인
function passwordChek1(){
	let password = document.forms[0];
	let pass1 = password.userPassword.value;
	let password_rule= /(?=.*[a-zA-ZS])(?=.*?[#?!@$%^&*-]).{6,18}/;
	
	if(!password_rule.test(pass1)){
		document.getElementById("passwordResult1").style.color = "red";
		document.getElementById("passwordResult1").innerHTML = "비밀번호는 6~18자리의 문자와 특수문자 조합이어야 합니다.";
	}else{
		document.getElementById("passwordResult1").style.color = "green";
		document.getElementById("passwordResult1").innerHTML = "사용가능한 비밀번호입니다.";
	}
}
function passwordChek2() {
	let password = document.forms[0];
	let pass1 = password.userPassword.value;
	let pass2 = password.login_password_check.value;
	//let password_rule= /(?=.*[a-zA-ZS])(?=.*?[#?!@$%^&*-]).{6,18}/;
	
	if (pass1 != pass2) {
		document.getElementById("passwordResult2").style.color = "red";
		document.getElementById("passwordResult2").innerHTML = "비밀번호가 일치하지 않습니다.";
	} else {
		document.getElementById("passwordResult2").style.color = "green";
		document.getElementById("passwordResult2").innerHTML = "비밀번호가 일치합니다.";
	}
}


//가입하기 누를 때 발생하는 이벤트 
$(document).ready(function() {
	$("#registerForm").submit(function() {
		let password = document.forms[0];
		let pass1 = password.userPassword.value;
		let pass2 = password.login_password_check.value;
		if (pass1 != pass2) {
			alert("패스워드가 일치하지 않습니다.");
			$("#login_password_check").focus();
			return false;
		}
		let login_id = $("#login_id").val();
		//let login_id = document.getElementById("login_id").value;
		if (login_id == "") {
			alert("아이디를 입력해주세요.");
			return false;
		}
		if (id == 1) {
			alert("아이디 중복을 확인해주세요.");
			$("#login_id").focus();
			document.getElementById("login_id").focus();
			$("#email_id").val("");
			return false;
		}
			let IdCheckInfo = $("#login_id").val(); //입력한 id를 get
			var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
			if( special_pattern.test(IdCheckInfo) == true ){
			alert("특수문자는 사용할 수 없습니다.");
			$("#email_id").val("");
			return false;
			}
			var email_rule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;	
			var email_id = $("#email_id").val();
			var email_domain = $("#email_domain").val();
			var email = "";

		if (!email_id) {  //확인
			alert("이메일을 입력해주세요");
			$("#email_id").focus();
			$("#email_id").val("");
			return false;
		}
		if (!email_domain) {  //확인
			alert("도메인을 입력해주세요");
			$("#email_domain").focus();
			$("#email_id").val("");
			return false;
		}
		mail = email_id + "@" + email_domain;  //확인
		$("#email_id").val(mail);
			
		if (!email_rule.test(mail)) {
			alert("이메일을 형식에 맞게 입력해주세요");
			$("#email_id").val("");
			return false;
			}
			
		if(TelCheck == 1){
		alert("전화번호 중복을 확인해주세요");
		$("#login_tel").focus();
		document.getElementById("login_tel").focus();
		$("#email_id").val("");
		return false;
		}
			
			
		//공백 사용 제한 var12345 지저분한데 리팩토링 필요...
		var str1 = document.getElementById('login_id');
		var str2 = document.getElementById('login_password');
		var str3 = document.getElementById('login_password_check');
		var str4 = document.getElementById('login_tel');
		var str5 = document.getElementById('login_Email');
		var blank_pattern = /[\s]/g;
		if (blank_pattern.test(str1.value) == true) {
			alert("공백은 사용할 수 없습니다. ");
			$("#login_id").focus();
			$("#email_id").val("");
			return false;
		}
		if (blank_pattern.test(str2.value) == true) {
			alert("공백은 사용할 수 없습니다. ");
			$("#login_password").focus();
			$("#email_id").val("");
			return false;
		}
		if (blank_pattern.test(str3.value) == true) {
			alert("공백은 사용할 수 없습니다. ");
			$("#login_password_check").focus();
			$("#email_id").val("");
			return false;
		}
		return confirm("가입하시겠습니까?");
		
		//if (blank_pattern.test(str4.value) == true) {
		//	alert("공백은 사용할 수 없습니다. ");
		//	$("#login_tel").focus();
		//	$("#email_id").val("");
		//	return false;
		//}
		//if (blank_pattern.test(str5.value) == true) {
		//	alert("공백은 사용할 수 없습니다. ");
		//	$("#login_Email").focus();
		//	$("#email_id").val("");
		//	return false;
		//
			
		


		
		//var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
		//if( special_pattern.test(str.value) == true ){
		//alert('특수문자는 사용할 수 없습니다.');
		//return false;

		//if(IdCheckInfo.search(/\W|\s/g) > -1 ){
   		 //alert( '특수문자 또는 공백을 입력할 수 없습니다.' );
  		 // IdCheckInfo.focus();
    	//	return false;}	
	});
});

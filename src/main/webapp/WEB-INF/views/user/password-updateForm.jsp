<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.css"
   type="text/css">
<link rel="stylesheet" href="/assets/fonts/font-awesome.css"
   type="text/css">
<link rel="stylesheet" href="/assets/css/selectize.css" type="text/css">
<link rel="stylesheet" href="/assets/css/style.css">
<link rel="stylesheet" href="/assets/css/user.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
                  <h1>My Profile</h1>
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
               <div class="row">
                  <div class="col-md-3">
                     <%@ include file="sidebar.jsp"%>
                  </div>
                  <!--end col-md-3-->
                 <form method="post" class="form" action="PasswordUpdate"
                  id="passwordUpdateForm" name="passwordUpdateForm">
                  <!-- 비밀번호 비교 컨트롤러에서 만들어야 함-->
                  <sec:csrfInput />
                  <sec:authentication var="user" property="principal" />
                        <!-- <form class="form"> -->
                        <div class="row">
                           <div class="col-md-8">
                              <h3>비밀번호 변경</h3>
                              <section>
                              	<div class="row">
                              		<div class="col-md-10">                               
                              			<div class="form-group">
                                 			<label for="new_current_password"
                                    		class="col-form-label required">New Password</label> <input
                                    		name="userPassword" type="password" class="form-control"
                                    		id="userPassword" placeholder="New Password" required>
                              			</div>
                              		</div>
                              		<div class="col-md-10">
                              			<div class="form-group">
                                 			<label for="repeat_new_current_password"
                                   			 class="col-form-label required">Repeat Password</label> <input
                                    		 type="password" class="form-control"
                                    		 id="repeat_new_current_password"
                                    		 placeholder="Repeat New Password" required
                                    		 name="repeat_new_current_password">
                              			</div>
                              <!--end form-group-->
                           			</div>       
                                </div>
                                <hr>
								<button type="submit" class="btn btn-primary float-left">Change
                           			Password</button>
                           	</div>
                          </div>
                         </div>	
                        </div> 
                        
                        <div class="col-md-12" style="margin-top: 20px;">
              			 	<form method="post" class="form" action="PasswordUpdate"
                  			id="passwordUpdateForm" name="passwordUpdateForm">
                  
                  			<!-- 비밀번호 비교 컨트롤러에서 만들어야 함-->
                  			<sec:csrfInput />
                  			<sec:authentication var="user" property="principal" />
                  			<input name="userId" type="hidden" class="form-control" id="name"
                     			placeholder="Your Name" value="${user.userId}" readonly required />
                  			<%--    <sec:authentication var="user" property="principal"/> --%>
                 </form>
            </div>
            </div>    
            </section>
            </section>                                                  
          
         
         
         
         <!--  주소 변경~!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
         
            <!-- <div class="col-md-3"></div>  -->      
            
               <!-- *************************************************************************************** -->
               <!-- 비밀번호 변경 -->
               <!-- ******************************************************************************************* -->
               <!--end form-group-->
                           
                           
                       
                        
                     
                     <!--end col-md-6-->
                 
          
            <!--end col-md-9-->
            
            
                        
                      
                        
           
            
        
         <!--end row-->
   
   <!--end container-->
   
   <!--end block-->
  
   <!--end content-->
   <script type="text/javascript">
      //비밀번호 확인 후 ajax문구 띄운다  //수업 때 배운 jquery-ajax 발전방식으로 바꿔야 함
      /*   function passwordResult() {
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
       */
      //가입하기 누를 때 발생하는 이벤트 
      $(document).ready(function() {
         $("#passwordUpdateForm").submit(function() {
            //alert("떠라제발");
            //아래 코드는 passwordResult()와 중복되는데 리팩토링 필요할 듯
            let password = document.forms["passwordUpdateForm"];
            // let password = document.forms[0];
            let pass1 = password.userPassword.value;
            let pass2 = password.repeat_new_current_password.value;
            if (pass1 != pass2) {
               alert("패스워드가 일치하지 않습니다.");
               $("#repeat_new_current_password").focus();
               return false;

               //     let pass1 = password.userPassword.elements[1];
               //let pass1 = document.passwordUpdateForm.userPassword;
               //let pass2 = document.passwordUpdateForm.repeat_new_current_password;
               //     let pass2 = password.repeat_new_current_password.elements[2];
               //if (pass1 != pass2) {
               // alert("패스워드가 일치하지 않습니다.");
               // $("#repeat_new_current_password").focus();
               // return false;
            }
         });
      });
       
   
   </script>

   <!--*********************************************************************************************************-->
   <!--************ FOOTER *************************************************************************************-->
   <!--*********************************************************************************************************-->
   <footer class="footer">
      <div class="wrapper">
         <div class="container">
            <div class="row">
               <div class="col-md-5">
                  <a href="#" class="brand"> <img src="assets/img/logo.png"
                     alt="">
                  </a>
                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut
                     nec tincidunt arcu, sit amet fermentum sem. Class aptent taciti
                     sociosqu ad litora torquent per conubia nostra.</p>
               </div>
               <!--end col-md-5-->
               <div class="col-md-3">
                  <h2>Navigation</h2>
                  <div class="row">
                     <div class="col-md-6 col-sm-6">
                        <nav>
                           <ul class="list-unstyled">
                              <li><a href="#">Home</a></li>
                              <li><a href="#">Listing</a></li>
                              <li><a href="#">Pages</a></li>
                              <li><a href="#">Extras</a></li>
                              <li><a href="#">Contact</a></li>
                              <li><a href="#">Submit Ad</a></li>
                           </ul>
                        </nav>
                     </div>
                     <div class="col-md-6 col-sm-6">
                        <nav>
                           <ul class="list-unstyled">
                              <li><a href="#">My Ads</a></li>
                              <li><a href="#">Sign In</a></li>
                              <li><a href="#">Register</a></li>
                           </ul>
                        </nav>
                     </div>
                  </div>
               </div>
               <!--end col-md-3-->
               <div class="col-md-4">
                  <h2>Contact</h2>
                  <address>
                     <figure>
                        124 Abia Martin Drive
                        <br> New York, NY 10011
                     </figure>
                     <br> <strong>Email:</strong> <a href="#">hello@example.com</a>
                     <br> <strong>Skype: </strong> Craigs <br> <br> <a
                        href="contact.html" class="btn btn-primary text-caps btn-framed">Contact
                        Us</a>
                  </address>
               </div>
               <!--end col-md-4-->
            </div>
            <!--end row-->
         </div>
         <div class="background">
            <div class="background-image original-size">
               <img src="assets/img/footer-background-icons.jpg" alt="">
            </div>
            <!--end background-image-->
         </div>
         <!--end background-->
      </div>
   </footer>
   <!--end footer-->
   </div>
   <!--end page-->
</body>
</html>
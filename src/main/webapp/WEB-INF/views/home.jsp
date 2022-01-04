<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

 
<meta charset="UTF-8">
<title>Home</title>
<meta name="viewport" content="width-device-width, initial-scale=1">
<style>
 
  df-messenger {
   --df-messenger-bot-message: #878fac;
   --df-messenger-button-titlebar-color: #df9b56;
   --df-messenger-chat-background-color: #fafafa;
   --df-messenger-font-color: white;
   --df-messenger-send-icon: #878fac;
   --df-messenger-user-message: #479b3d;
  }
  
  body, html {
  height: 100%;
  margin: 0;
  font: 400 15px/1.8 "Lato", sans-serif;
  color: #777;
}

.bgimg-1, .bgimg-2, .bgimg-3 {
  position: relative;
  opacity: 0.65;
  background-attachment: fixed;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;

}
.bgimg-1 {
  background-image: url("assets/img/홈화면.png");
  min-height: 100%;
}

.bgimg-2 {
  background-image: url("assets/img/채팅.png");
  min-height: 400px;
}

.bgimg-3 {
  background-image: url("assets/img/동네생활.png");
  min-height: 400px;
}

.caption {
  position: absolute;
  left: 0;
  top: 50%;
  width: 100%;
  text-align: center;
  color: #000;
}

.caption span.border {
  background-color: #9D5C0D; 
 /*  background-color: #8B4513; */
  color: #fff;
  padding: 18px;
  font-size: 25px;
  letter-spacing: 10px;
}

h3 {
  letter-spacing: 5px;
  text-transform: uppercase;
  font: 20px "Lato", sans-serif;
  color: #111;
}

/* Turn off parallax scrolling for tablets and phones */
@media only screen and (max-device-width: 1024px) {
  .bgimg-1, .bgimg-2, .bgimg-3 {
    background-attachment: scroll;
  }
}

#nameHover:hover{
	color: #FAFAFA;
	background-color:#8B4513;
	/* background-color:#9D5C0D; */
}

a{
	text-decoration:none;
}
</style>

</head>
<body>
<div class="bgimg-1">
  <div class="caption">
 <a href="/login_form" style="text-decoration:none;"><span class="border" id="nameHover"> 감자마켓 이용하기</span></a>
  </div>
</div>

<div style="color: #8B4513;background-color:white;text-align:center;padding:50px 80px;text-align: justify;">
  <h3 style="text-align:center;">감자마켓</h3>
  <p style="text-align:center;">이웃과 더 가까워지는 따뜻한 동네를 만들어요. <br>
  위치기반 중고 직거래 서비스 를 제공하고 사용자 를 최우선으로 생각합니다. <br>
  우리는 감자 마켓을 통해 동네 이웃과 소통할수있고 내 근처에 숨어있는 맛집 공유도 가능하고 ,이웃과 함께 소소한 일상을 나눌수 있는 따듯하고 아름다운 동네 생활을 꿈꿔요</p>
</div>

<div class="bgimg-2">
  <div class="caption">
  <span class="border" style="background-color:transparent;font-size:25px;color: #f7f7f7;">LESS HEIGHT</span>
  </div>
</div>

<div style="position:relative;">
  <div style="color:#ddd;background-color:#d6ae7b;text-align:center;padding:50px 80px;text-align: justify;">
  <p style="text-align:center; color:white;">동네 주민들과 가깝고 따뜻한 거래를 지금 경험해보세요</p>
  </div>
</div>

<div class="bgimg-3">
  <div class="caption">
  <span class="border" style="background-color:transparent;font-size:25px;color: #f7f7f7;">SCROLL UP</span>
  </div>
</div>

<div style="position:relative;">
  <div style="color:#ddd;background-color:#d6ae7b;text-align:center;padding:50px 80px;text-align: justify;">
  <p style="text-align:center; color:white;">이웃과 함께 하는 동네생활, 우리 동네의 다양한 이야기를 이웃과 함께 나누어요. </p>
  </div>
</div>

<div class="bgimg-1">
  <div class="caption">
  <a href="/guest/registerForm"><span class="border" id="nameHover">감자마켓 가입하기</span></a>
  </div>
</div>
 
 
<script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
<df-messenger
  intent="WELCOME"
  chat-title="PotatoAI"
  agent-id="c3277a2b-ecf7-497e-8f01-a65947bc1223"
  language-code="ko"
></df-messenger>
 
</body>
</html>
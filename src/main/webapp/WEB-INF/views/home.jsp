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
</style>

</head>
<body>
SpringBoot + Tiles Framework 
<a href="/login_form" style>로그인으로 고우고우 </a>
 
 
<script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
<df-messenger
  intent="WELCOME"
  chat-title="PotatoAI"
  agent-id="c3277a2b-ecf7-497e-8f01-a65947bc1223"
  language-code="ko"
></df-messenger>
 
</body>
</html>
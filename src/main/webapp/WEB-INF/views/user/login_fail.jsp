<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
// org.kosta.myproject.config.security.MemberAuthenticationProvider 에서 throw 한 Exception 메세지가 출력 
alert("${SPRING_SECURITY_LAST_EXCEPTION.message}");
location.href="/login_form";
</script>








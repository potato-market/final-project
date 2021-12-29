<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
 <%-- spring security custom tag를 사용하기 위한 선언 --%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<%-- javascript 한글처리가 안될 때는 변수에 담아서 el로 처리한다  --%>
<sec:authentication property="principal.userId" var="userId"/>
 <script>
 alert("${userId}님 회원정보수정되었습니다.");
 location.href="profile";
 </script>
 </body>
</html>	
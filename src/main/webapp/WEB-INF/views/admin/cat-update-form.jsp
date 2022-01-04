<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
 <%-- spring security custom tag를 사용하기 위한 선언 --%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<%-- javascript 한글처리가 안될 때는 변수에 담아서 el로 처리한다  --%>
<sec:authentication property="principal.userId" var="userId"/>

<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<!-- 해야할일 ajax 를 통해 post 방식으로 카테고리 삭제 ,수정 ,추가 -->



<div class="container">
           
   
  <form action="categoryUp" method="POST">
      <sec:csrfInput/>
      	<input type="hidden" name="categoryId" value="${cg.categoryId }"/>
       <input type="text" name="categoryName"/> 
       <button type="submit"></button> 
</div>


 
 
 </body>
</html>
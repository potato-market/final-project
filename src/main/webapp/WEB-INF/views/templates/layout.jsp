<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- title이 null인 경우는 무시된다 -->
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%-- src\main\resources\static 아래에 위치시킨다 --%>
<link rel="stylesheet" type="text/css" href="/css/home.css">
<%@ include file="common-js.jsp"%>
</head>
<body>
	<div id="header">
		<!-- Tiles header 영역 -->
		<tiles:insertAttribute name="header" />
	</div>
	<div class="container-fluid text-center">
		<div class="row content">

			<div id="main" class="col-sm-12 text-left" style="padding: 0px;">
				<!-- Tiles main 영역 -->
				<tiles:insertAttribute name="main" />
			</div>

		</div>
	</div>
	<div id="footer">
		<!-- Tiles footer 영역 -->
		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>











<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<tiles:insertDefinition name="layout">
<!-- 		<div> -->
<%-- 			<tiles:putAttribute name="header"> --%>
<!-- 				<h1>Tiles Header</h1> -->
<%-- 			</tiles:putAttribute> --%>
<!-- 		</div> -->
		<div>
			<tiles:putAttribute name="body">
				<a href="/articleList">게시판 입장~</a>
			</tiles:putAttribute>
		</div>
<!-- 		<div> -->
<%-- 			<tiles:putAttribute name="footer"> --%>
<!-- 				<h3>Tiles Footer</h3> -->
<%-- 			</tiles:putAttribute> --%>
<!-- 		</div> -->
	</tiles:insertDefinition>
</body>
</html>
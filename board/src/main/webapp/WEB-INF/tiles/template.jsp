<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="page">
		<tiles:insertAttribute name="header"/>
			<div class="content">
				<tiles:insertAttribute name="body"/>
			</div>
		<tiles:insertAttribute name="footer"/>
	</div>
</body>
</html>
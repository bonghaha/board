<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>articleInsert</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#insertCancle").click(function(){
			$("#insertAction").attr("action", "/articleList");
			$("#insertAction").attr("method", "GET");
			$("#insertAction").submit();
		});
		$("#insertSubmit").click(function(){
			$("#insertAction").attr("action", "/articleInsert");
			$("#insertAction").attr("method", "POST");
			$("#insertAction").submit();
		});
	});
</script>
</head>
<body>
	<tiles:insertDefinition name="layout">
		<tiles:putAttribute name="body">
			<h1>글쓰기</h1>
			<div>
				<form id="insertAction" action="">
					<table>
						<tr>
							<td>작성자 : </td>
							<td><input type="text" name="articleWriter"/></td>
						</tr>
						<tr>
							<td>제목 : </td>
							<td><input type="text" name="articleTitle"/></td>
						</tr>
						<tr>
							<td>내용 : </td>
							<td><textarea rows="20" cols="100" name="articleContent"></textarea></td>
						</tr>
						<tr>
							<td>비밀번호 : </td>
							<td><input type="password" name="articlePw"/></td>
						</tr>
					</table>
					<div>
						<input id="insertCancle" type="button" value="취소"/>
						<input id="insertSubmit" type="button" value="작성"/>
					</div>
				</form>
			</div>
		</tiles:putAttribute>
	</tiles:insertDefinition>
</body>
</html>
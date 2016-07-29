<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>articleDetail</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#articleList").click(function(){
			$("#articleAction").attr("action", "/articleList");
			$("#articleAction").submit();
		});
		$("#articleModify").click(function(){
			$("#articleAction").attr("action", "/articleModify");
			$("#articleAction").submit();
		});
		$("#articleDelete").click(function(){
			$("#articleAction").attr("action", "/articleDelete");
			$("#articleAction").submit();
		})
		$("#replyInsert").click(function(){
			$("#replyAction").submit();
		});
	});
</script>
</head>
<body>
	<t:insertDefinition name="layout">
		<t:putAttribute name="body">
	<!-- articleDetail �����ֱ� -->
	<h1>${article.articleTitle}</h1>
	<div>
		<span>�۹�ȣ : ${article.articleNo},</span>
		<span>�ۼ��� : ${article.articleWriter},</span>
		<span>�ۼ��� : ${article.articleDate} </span>
	</div>
	<hr>
	<h3>${article.articleContent}</h3>
	
	<hr>
	
	<!-- replyList �����ֱ� -->
	<div>
		<c:forEach var="rList" items="${replyList}">
			<div>
				<span>�ۼ��� : </span><span>${rList.replyWriter}</span><br/>
				<span>���� : </span><span>${rList.replyContent}</span>
				<span><a href="/replyDelete?articleNo=${rList.articleNo}&replyNo=${rList.replyNo}">����</a></span>
			</div>
			<div>
				<span>---------------------------------------------------------------------------------</span>
			</div>
		</c:forEach>
	</div>
	
	<!-- reply���� -->
	<div>
		<form id="replyAction" action="/replyInsert" method="POST">
			<input type="hidden" name="articleNo" value="${article.articleNo}"/>
			<div>
				<span>��� : </span><span><input type="text" name="replyContent"/></span>
			</div>
			<div>
				<span>�ۼ��� : </span><span><input type="text" name="replyWriter"/></span>
				<span>��й�ȣ : </span><span><input type="password" name="replyPw"/></span>
				<span><input id="replyInsert" type="button" value="��۵��"/></span>
			</div>
		</form>
	</div>
	<hr>
	<div>
		<form id="articleAction" action="" method="GET">
			<input type="hidden" name="articleNo" value="${article.articleNo}"/>
			<input id="articleList" type="button" value="�۸��"/>
			<input id="articleModify" type="button" value="�ۼ���"/>
			<input id="articleDelete" type="button" value="�ۻ���"/>
		</form>
	</div>
	</t:putAttribute>
	</t:insertDefinition>
</body>
</html>
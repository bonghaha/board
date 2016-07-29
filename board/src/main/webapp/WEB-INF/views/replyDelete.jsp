<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>replyDelete</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#deleteBack").click(function(){
			$("#deleteAction").attr("action", "/articleDetail");
			$("#deleteAction").attr("method", "POST");
			$("#deleteAction").submit();
		});
		
		$("#deleteSubmit").click(function(){
			if($("#replyPw").val() == ""){
				$("#replyPwHelper").text("비밀번호를 입력하세요");
			}else if($("#replyPw").val() != $("#replyPwCheck").val()){
				$("#replyPwHelper").text("");
				$("#replyPwHelper").text("비밀번호가 틀립니다");
			}else{
				$("#deleteAction").attr("action", "/replyDelete");
				$("#deleteAction").attr("method", "POST");
				$("#deleteAction").submit();
			}
			
		});
	});
</script>
</head>
<body>
	<h1>비밀번호 확인</h1>
	<div>
		<h4>비밀번호를 입력하세요</h4>
	</div>
	<div>
		<form id="deleteAction" action="">
			<div>
				<input type="hidden" name="articleNo" value="${reply.articleNo}"/>
				<input type="hidden" name="replyNo" value="${reply.replyNo}"/>
				<input id="replyPwCheck" type="hidden" value="${reply.replyPw}"/>
				<span><input id="replyPw" type="password" name="replyPw"/></span>
				<span id="replyPwHelper"></span>
			</div>
			<div>
				<input id="deleteBack" type="button" value="취소"/>
				<input id="deleteSubmit" type="button" value="확인"/>
			</div>
		</form>
	</div>
</body>
</html>
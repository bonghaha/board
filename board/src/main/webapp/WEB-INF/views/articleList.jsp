<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>board</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#articleSearch").click(function(){
			$("#articleAction").attr("action", "/articleList");
			$("#articleAction").attr("method", "GET");
			$("#articleAction").submit();
		});
		$("#goArticleInsert").click(function(){
			$("#articleAction").attr("action", "/articleInsert");
			$("#articleAction").attr("method", "GET");
			$("#articleAction").submit();
		});
	});
</script>
</head>
<body>
	<tiles:insertDefinition name="layout">
		<tiles:putAttribute name="body">
			<div>
				<h1>�� �� ��� ���̳� �޾ƶ�</h1>
				<table>
					<tr>
						<th>�۹�ȣ</th>
						<th>������</th>
						<th>�ۼ���</th>
						<th>�Խ���</th>
					</tr>
					<c:forEach var="al" items="${articleList}">
						<tr>
							<td>${al.articleNo}</td>
							<td><a href="/articleDetail1?articleNo=${al.articleNo}">${al.articleTitle}</a></td>
							<td>${al.articleWriter}</td>
							<td>${al.articleDate}</td>
						</tr>
					</c:forEach>
				</table>
			
				<div>
					<form id="articleAction" action="">
						<!-- �˻��ϱ� -->
						<div>
							<span>
								<select name="searchType">
									<option value="">::�˻�����::</option>
									<option value="article_title">����</option>
									<option value="article_content">����</option>
									<option value="article_writer">�ۼ���</option>
								</select>
							</span>
							<span><input type="text" name="searchWord"/></span>
							<span><input id="articleSearch" type="button" value="�˻�"/></span>
							<span><a href="/articleList">��ü�ۺ���</a></span>
						</div>
						
						<!-- ����¡ -->
						<div>
							<!-- ù�������� �̵� -->
							<span>
								<a href="/articleList?clickPage=1&searchType=${searchType}&searchWord=${searchWord}">ó��</a>
							</span>
							
							<!-- ������������ �̵� -->
							<c:if test="${pageHelper.clickPage>1}">
								<span>
									<a href="/articleList?clickPage=${pageHelper.clickPage-1}&searchType=${searchType}&searchWord=${searchWord}">����</a>
								</span>
							</c:if>
							
							<!-- ����¡�۾�(1,2,3, ... , 9, 10 -->
							<c:forEach var="pageNo" begin="${pageHelper.eachFirstPage}" end="${pageHelper.eachLastPage}" step="1">
								<c:choose>
									<c:when test="${pageNo eq pageHelper.clickPage}">
										<span><a href="/articleList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
									</c:when>
									<c:otherwise>
										<span><a href="/articleList?clickPage=${pageNo}&searchType=${searchType}&searchWord=${searchWord}">${pageNo}</a></span>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<!-- �������������� �̵� -->
							<c:if test="${pageHelper.clickPage<pageHelper.lastPage}">
								<span>
									<a href="/articleList?clickPage=${pageHelper.clickPage+1}&searchType=${searchType}&searchWord=${searchWord}">����</a>
								</span>
							</c:if>
							
							<!-- 10������ �ڷ� �̵� -->
							<c:if test="${pageHelper.clickPage+10<pageHelper.lastPage}">
								<span>
									<a href="/articleList?clickPage=${pageHelper.clickPage+10}&searchType=${searchType}&searchWord=${searchWord}">10������ �ڷ�</a>
								</span>
							</c:if>
						</div>
						
						<!-- Ȩ���� ���� -->
						<div>
							<span>
								<input id="goArticleInsert" type="button" value="�۾���"/>
							</span>
						</div>
					</form>
				</div>
				</div>
			</tiles:putAttribute>
	</tiles:insertDefinition>
</body>
</html>
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
				<h1>글 쓴 사람 복이나 받아라</h1>
				<table>
					<tr>
						<th>글번호</th>
						<th>글제목</th>
						<th>작성자</th>
						<th>게시일</th>
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
						<!-- 검색하기 -->
						<div>
							<span>
								<select name="searchType">
									<option value="">::검색조건::</option>
									<option value="article_title">제목</option>
									<option value="article_content">내용</option>
									<option value="article_writer">작성자</option>
								</select>
							</span>
							<span><input type="text" name="searchWord"/></span>
							<span><input id="articleSearch" type="button" value="검색"/></span>
							<span><a href="/articleList">전체글보기</a></span>
						</div>
						
						<!-- 페이징 -->
						<div>
							<!-- 첫페이지로 이동 -->
							<span>
								<a href="/articleList?clickPage=1&searchType=${searchType}&searchWord=${searchWord}">처음</a>
							</span>
							
							<!-- 이전페이지로 이동 -->
							<c:if test="${pageHelper.clickPage>1}">
								<span>
									<a href="/articleList?clickPage=${pageHelper.clickPage-1}&searchType=${searchType}&searchWord=${searchWord}">이전</a>
								</span>
							</c:if>
							
							<!-- 페이징작업(1,2,3, ... , 9, 10 -->
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
							
							<!-- 다음페이지으로 이동 -->
							<c:if test="${pageHelper.clickPage<pageHelper.lastPage}">
								<span>
									<a href="/articleList?clickPage=${pageHelper.clickPage+1}&searchType=${searchType}&searchWord=${searchWord}">다음</a>
								</span>
							</c:if>
							
							<!-- 10페이지 뒤로 이동 -->
							<c:if test="${pageHelper.clickPage+10<pageHelper.lastPage}">
								<span>
									<a href="/articleList?clickPage=${pageHelper.clickPage+10}&searchType=${searchType}&searchWord=${searchWord}">10페이지 뒤로</a>
								</span>
							</c:if>
						</div>
						
						<!-- 홈으로 가기 -->
						<div>
							<span>
								<input id="goArticleInsert" type="button" value="글쓰기"/>
							</span>
						</div>
					</form>
				</div>
				</div>
			</tiles:putAttribute>
	</tiles:insertDefinition>
</body>
</html>
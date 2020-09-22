<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>

function list(page){
	location.href="./main.ino?curPage="+page;
} 



</script>
</head>
<body>

	<div>
		<h1>자유게시판</h1>
	</div>
	<div style="width: 650px;" align="right">
		<a href="./freeBoardInsert.ino">글쓰기</a>
	</div>
	<hr style="width: 600px">

	<c:forEach items="${map.freeBoardList}" var="dto">
		<div style="width: 50px; float: left;">${dto.num}</div>
		<div style="width: 300px; float: left;">
			<a href="./freeBoardDetail.ino?num=${dto.num}">${dto.title}</a>
		</div>
		<div style="width: 150px; float: left;">${dto.name}</div>
		<div style="width: 150px; float: left;">${dto.regdate}</div>
		<hr style="width: 600px">
	</c:forEach>
	<div>
		<!-- 검색폼 -->

		<form action="./main.ino">

			<select name="search_option">

				<option value="name"
					<c:if test="${map.search_option == 'name'}">selected</c:if>>이름</option>

				<option value="title"
					<c:if test="${map.search_option == 'title'}">selected</c:if>>제목</option>

				<option value="content"
					<c:if test="${map.search_option == 'content'}">selected</c:if>>내용</option>

			</select> <input name="keyword" value="${map.keyword}"> <input
				type="submit" value="조회">

		</form>
	</div>

	<div>
		<c:if test="${map.pager.curPage > 1}">

			<a href="#" onclick="list('1')">[처음]</a>

		</c:if>

		<c:if test="${map.pager.curPage > 1}">

			<a href="#" onclick="list('${map.pager.prevPage}')"> [이전]</a>

		</c:if>

		<c:forEach var="num" begin="${map.pager.blockBegin}"
			end="${map.pager.blockEnd}">

			<c:choose>

				<c:when test="${num == map.pager.curPage}">

					<!-- 현재 페이지인 경우 하이퍼링크 제거 -->

					<span style="color: red;">${num}</span>

				</c:when>

				<c:otherwise>

					<a href="#" onclick="list('${num}')">${num}</a>

				</c:otherwise>

			</c:choose>

		</c:forEach>

		<c:if test="${map.pager.curBlock < map.pager.totBlock}">

			<a href="#" onclick="list('${map.pager.nextPage}')">[다음]</a>

		</c:if>

		<c:if test="${map.pager.curPage < map.pager.totPage}">

			<a href="#" onclick="list('${map.pager.totPage}')">[끝]</a>

		</c:if>

	</div>

</body>
</html>
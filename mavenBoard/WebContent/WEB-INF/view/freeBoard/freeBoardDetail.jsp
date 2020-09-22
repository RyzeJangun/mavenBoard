<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript">
  function cancel(){
	 if(confirm("글을 그만 쓰시겠습니까?")==true){
		document.location.replace("./main.ino");
	}else {
		return;
	}
}
  
 function updatePath(){
	 if(confirm("수정 페이지로 이동하시겠습니까?")==true){
		 document.form1.action="./freeBoardDetailUD.ino";
		 document.form1.submit();
	 }else {
		 return;
	 }
 }
</script>
<body>

	<div>
		<h1>자유게시판</h1>
	</div>
	<div style="width:650px;" align="right">
		<a href="./main.ino">리스트로</a>
	</div>
	<hr style="width: 600px">
	
	<form name="form1">
	    <input type="hidden" name="num" value="${freeBoardDto.num}">
		<div style="width: 150px; float: left;">이름 :</div>
		<div style="width: 500px; float: left;" align="left"><input type="text" name="name" value="${freeBoardDto.name}" readonly/></div>
		
		<div style="width: 150px; float: left;">제목 :</div>
		<div style="width: 500px; float: left;" align="left"><input type="text" name="title"  value="${freeBoardDto.title}" readonly/></div>
	
		<div style="width: 150px; float: left;">작성일</div>
		<div style="width: 500px; float: left;" align="left"><input type="text" name="regdate"  value="${freeBoardDto.regdate}" readonly/></div>
	
		<div style="width: 150px; float: left;">내용 :</div>
		<div style="width: 500px; float: left;" align="left"><textarea name="content" rows="25" cols="65" readonly>${freeBoardDto.content}</textarea></div>
		<div align="right">
		<input type="submit" value="수정 페이지" onclick="updatePath();">
		<input type="button" value="취소" onclick="cancel();">
		&nbsp;&nbsp;&nbsp;
		</div>
	
	</form>
	
</body>
</html>
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
	 if(confirm("���� �׸� ���ðڽ��ϱ�?")==true){
		document.location.replace("./main.ino");
	}else {
		return;
	}
}
  
 function updatePath(){
	 if(confirm("���� �������� �̵��Ͻðڽ��ϱ�?")==true){
		 document.form1.action="./freeBoardDetailUD.ino";
		 document.form1.submit();
	 }else {
		 return;
	 }
 }
</script>
<body>

	<div>
		<h1>�����Խ���</h1>
	</div>
	<div style="width:650px;" align="right">
		<a href="./main.ino">����Ʈ��</a>
	</div>
	<hr style="width: 600px">
	
	<form name="form1">
	    <input type="hidden" name="num" value="${freeBoardDto.num}">
		<div style="width: 150px; float: left;">�̸� :</div>
		<div style="width: 500px; float: left;" align="left"><input type="text" name="name" value="${freeBoardDto.name}" readonly/></div>
		
		<div style="width: 150px; float: left;">���� :</div>
		<div style="width: 500px; float: left;" align="left"><input type="text" name="title"  value="${freeBoardDto.title}" readonly/></div>
	
		<div style="width: 150px; float: left;">�ۼ���</div>
		<div style="width: 500px; float: left;" align="left"><input type="text" name="regdate"  value="${freeBoardDto.regdate}" readonly/></div>
	
		<div style="width: 150px; float: left;">���� :</div>
		<div style="width: 500px; float: left;" align="left"><textarea name="content" rows="25" cols="65" readonly>${freeBoardDto.content}</textarea></div>
		<div align="right">
		<input type="submit" value="���� ������" onclick="updatePath();">
		<input type="button" value="���" onclick="cancel();">
		&nbsp;&nbsp;&nbsp;
		</div>
	
	</form>
	
</body>
</html>
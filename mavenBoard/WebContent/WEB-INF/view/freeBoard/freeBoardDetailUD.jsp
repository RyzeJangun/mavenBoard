<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
 function update(){
	 if(confirm("���� ���� �Ͻðڽ��ϱ�?")==true){
		document.form2.action="./freeBoardUpdate.ino";
		document.form2.submit();
		alert("�Խñ��� �����Ǿ����ϴ�.");
	 }else {
		 return;
	 }
 }
	 
	 function del(){
		 if(confirm("���� ���� �Ͻðڽ��ϱ�?")==true){
				document.form2.action="./freeBoardDelete.ino";
				document.form2.submit();
				alert("���� �����Ǿ����ϴ�.");
			 }else {
				 return;
			 }
	 }
		 
	 function cancel(){
		 if(confirm("�����ðڽ��ϱ�?")==true){
			   document.location.replace("./main.ino");
			}else {
				 return;
				 }
 }

</script>
</head>
<body>
	<div>
		<h1>�����Խ���</h1>
	</div>
	<div style="width:650px;" align="right">
		<a href="./main.ino">����Ʈ��</a>
	</div>
	<hr style="width: 600px">
	<form name="form2" method="get">
	    <input type="hidden" name="num" value="${freeBoardDto.num}">
		<div style="width: 150px; float: left;">�̸� :</div>
		<div style="width: 500px; float: left;" align="left"><input type="text" name="name" value="${freeBoardDto.name}"/></div>
		
		<div style="width: 150px; float: left;">���� :</div>
		<div style="width: 500px; float: left;" align="left"><input type="text" name="title" value="${freeBoardDto.title}" readonly/></div>
	
		<div style="width: 150px; float: left;">�ۼ���</div>
		<div style="width: 500px; float: left;" align="left"><input type="text" name="regdate" value="${freeBoardDto.regdate}" readonly/></div>
	
		<div style="width: 150px; float: left;">���� :</div>
		<div style="width: 500px; float: left;" align="left"><textarea name="content" rows="25" cols="65">${freeBoardDto.content}</textarea></div>
		<div align="right">
		<input type="submit" value="����" onclick="update();">
		<input type="submit" value="����" onclick="del();">
		<input type="button" value="���" onclick="cancel();">
		&nbsp;&nbsp;&nbsp;
		</div>
	</form>
</body>
</html>
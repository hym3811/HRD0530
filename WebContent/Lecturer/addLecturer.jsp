<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="../MAIN/style.css">

<title>Insert title here</title>

<script>
	function check(){
		var doc=document.form;
		var ctn=0;
		var rdo=document.getElementsByName("week");
		
		for(var i=0;i<rdo.length;i++){
			if(rdo[i].checked==true){
				ctn++;
				break;
			}
		}
		
		if(doc.name.value==""){
			alert("[강사명]\n과목명을 입력하세요.");
			doc.name.focus();
		}else if(doc.name.value.length>10){
			alert("[강사명]\n과목명은 10자를 넘을 수 없습니다.");
			doc.name.focus();
		}else if(doc.major.value==""){
			alert("[전공]\n전공을 입력하세요.");
			doc.major.focus();
		}else if(doc.major.value.length>40){
			alert("[전공]\n전공은 40자 미만입니다.");
			doc.major.focus();
		}else if(doc.field.value==""){
			alert("[세부전공]\n전공을 입력하세요.");
			doc.field.focus();
		}else if(doc.field.value.length>40){
			alert("[세부전공]\n세부전공은 40자 미만입니다.");
			doc.field.focus();
		}else{
			doc.action="addLecturerProcess.jsp";
			doc.submit();
		}
	}
</script>

</head>
<body>

<%@ include file="../MAIN/header.jsp" %>
<%@ include file="../MAIN/nav.jsp" %>

<section>
	<form name=form>
		<br><h3 style="text-align:center;font-size:2em;font-weight:bold;">강사 정보 추가</h3><br>
		<table border=1 style="margin:0 auto; width:40%;">
		<%
			Integer idx=0;
			try{
				sql="select max(idx) from lecturer0530";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()){
					idx=(rs.getInt(1)+1);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		%>
			<tr>
				<th style="width:25%;">강사 코드</th>
				<td><input type=number name=idx style="width:100%;height:40px; font-size:1.2em;" value="<%=idx %>" readonly></td>
			</tr>
			<tr>
				<th>강사명</th>
				<td><input type=text name=name style="width:100%;height:40px; font-size:1.2em;"></td>
			</tr>
			<tr>
				<th style="height:40px;">전공</th>
				<td style="font-size:1.2em;"><input type=text name=major style="width:100%;height:40px; font-size:1.2em;"></td>
			</tr>
			<tr>
				<th style="height:40px;">세부 전공</th>
				<td style="font-size:1.2em;"><input type=text name=field style="width:100%;height:40px; font-size:1.2em;"></td>
			</tr>
			<tr>
				<td colspan=2 style="height:40px;text-align:center;">
					<input type=button value="등록" onclick=check() style="width:120px;height:40px; font-size:1.3em; font-weight:bold;">
					<input type=button value="취소" onclick=reset() style="width:120px;height:40px; font-size:1.3em; font-weight:bold;">
				</td>
			</tr>
		</table>
	</form>
</section>

<%@ include file="../MAIN/footer.jsp" %>

</body>
</html>
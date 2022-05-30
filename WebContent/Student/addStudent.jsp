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
		var ctn1=0;
		var ctn2=0;
		var rdo=document.getElementsByName("position");
		var hobby=document.getElementsByName("hobby");
		
		for(var i=0;i<rdo.length;i++){
			if(rdo[i].checked==true){
				ctn1++;
				break;
			}
		}
		
		for(var i=0;i<hobby.length;i++){
			if(hobby[i].checked==true){
				ctn2++;
				break;
			}
		}
		
		if(doc.studno.value==""){
			alert("[학번]\n학번을 입력하세요.");
			doc.studno.focus();
		}else if(doc.studno.value.length!=8){
			alert("[학번]\n학번은 숫자8자리입니다.");
			doc.studno.focus();
		}else if(doc.name.value==""){
			alert("[성명]\n성명을 입력하세요.");
			doc.name.focus();
		}else if(doc.name.value.length>20){
			alert("[성명]\n성명은 20자를 넘을 수 없습니다.");
			doc.name.focus();
		}else if(doc.dept.value==""){
			alert("[학과]\n학과를 선택하세요.");
			doc.dept.focus();
		}else if(ctn1==0){
			alert("[학년]\n학년을 선택하세요.");
			doc.position.focus();
		}else if(ctn2==0){
			alert("[취미]\n취미를 선택하세요.");
			doc.hobby.focus();
		}else if(doc.address.value==""){
			alert("[주소]\n주소를 입력하세요.");
			doc.address.focus();
		}else if(doc.address.value.length>80){
			alert("[주소]\n주소는 80자를 넘을 수 없습니다.");
			doc.address.focus();
		}else if(doc.phone.value==""){
			alert("[연락처]\n연락처를 입력하세요.");
			doc.phone.focus();
		}else if(doc.phone.value.length!=13){
			alert("[연락처]\n연락처는 -포함 13자리여야합니다.");
			doc.phone.focus();
		}else{
			doc.action="addStudentProcess.jsp";
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
		<br><h3 style="text-align:center;font-size:2em;font-weight:bold;">학사 정보 등록 화면</h3><br>
		<table border=1 style="margin:0 auto; width:40%;">
			<tr>
				<th style="width:25%;">학번</th>
				<td><input type=number name=studno style="width:100%;height:40px; font-size:1.2em;"></td>
			</tr>
			<tr>
				<th>성명</th>
				<td><input type=text name=name style="width:100%;height:40px; font-size:1.2em;"></td>
			</tr>
			<tr>
				<th>학과</th>
				<td>
					<select name=dept style="width:100%;height:40px;">
						<option value="">학과를 선택하세요.</option>
						<option value="1">컴퓨터공학과[1]</option>
						<option value="2">기계공학과[2]</option>
						<option value="3">전자과[3]</option>
						<option value="4">영문학과[4]</option>
						<option value="5">일어과[5]</option>
						<option value="6">경영학과[6]</option>
						<option value="7">무역학과[7]</option>
						<option value="8">교육학과[8]</option>
					</select>
				</td>
			</tr>
			<tr>
				<th style="height:40px;">학년</th>
				<td style="font-size:1.2em;">
					<input type=radio name=position value="1">1학년
					<input type=radio name=position value="2">2학년
					<input type=radio name=position value="3">3학년
					<input type=radio name=position value="4">4학년
				</td>
			</tr>
			<tr>
				<th style="height:40px;">취미</th>
				<td>
					<input type=checkbox name="hobby" value="프로그램">프로그램
					<input type=checkbox name="hobby" value="독서">독서
					<input type=checkbox name="hobby" value="등산">등산
					<input type=checkbox name="hobby" value="여행">여행
					<input type=checkbox name="hobby" value="낚시">낚시
					<input type=checkbox name="hobby" value="영화보기">영화보기
					<input type=checkbox name="hobby" value="잠자기">잠자기
					<input type=checkbox name="hobby" value="멍때리기">멍때리기
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type=text name=address style="width:100%;height:40px; font-size:1.2em;"></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><input type=text name=phone style="width:100%;height:40px; font-size:1.2em;"></td>
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
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
		
		if(doc.id.value==""){
			alert("[교과목 코드]\n교과목 코드를 입력하세요.");
			doc.id.focus();
		}else if(doc.id.value.length!=5){
			alert("[교과목 코드]\n교과목 코드는 5자리입니다.");
			doc.id.focus();
		}else if(doc.name.value==""){
			alert("[과목명]\n과목명을 입력하세요.");
			doc.name.focus();
		}else if(doc.name.value.length>20){
			alert("[과목명]\n과목명은 40자를 넘을 수 없습니다.");
			doc.name.focus();
		}else if(doc.credit.value==""){
			alert("[학점]\n학점을 입력하세요.");
			doc.credit.focus();
		}else if(doc.credit.value<=0){
			alert("[학점]\n학점은 양수입니다..");
			doc.credit.focus();
		}else if(doc.lecturer.value==""){
			alert("[담당강사]\n담당강사를 선택하세요.");
			doc.lecturer.focus();
		}else if(ctn==0){
			alert("[요일]\n요일을 선택하세요.");
			doc.week.focus();
		}else if(doc.start_hour.value==""){
			alert("[시작 시간]\n시작 시간을 선택하세요.");
			doc.start_hour.focus();
		}else if(doc.end_hour.value==""){
			alert("[종료 시간]\n시작 시간을 선택하세요.");
			doc.end_hour.focus();
		}else{
			doc.action="updateCourseProcess.jsp";
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
		<br><h3 style="text-align:center;font-size:2em;font-weight:bold;">교과목 추가</h3><br>
		<%
			String id=request.getParameter("id");
			String name=null;
			Integer credit=0;
			String lecturer=null;
			Integer week=0;
			Integer start_hour=0;
			Integer end_hour=0;
			try{
				sql="select * from course0530 where id=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs=pstmt.executeQuery();
				if(rs.next()){
					name=rs.getString(2);
					credit=rs.getInt(3);
					lecturer=rs.getString(4);
					week=rs.getInt(5);
					start_hour=(rs.getInt(6)/100);
					end_hour=(rs.getInt(7)/100);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		%>
		<table border=1 style="margin:0 auto; width:40%;">
			<tr>
				<th style="width:25%;">교과목 코드</th>
				<td><input type=number name=id style="width:100%;height:40px; font-size:1.2em;" value="<%=id %>" readonly></td>
			</tr>
			<tr>
				<th>과목명</th>
				<td><input type=text name=name style="width:100%;height:40px; font-size:1.2em;" value="<%=name%>"></td>
			</tr>
			<tr>
				<th style="height:40px;">학점</th>
				<td style="font-size:1.2em;"><input type=number name=credit style="width:100%;height:40px; font-size:1.2em;" value="<%=credit%>"></td>
			</tr>
			<tr>
				<th>담당강사</th>
				<td>
					<select name=lecturer style="width:100%;height:40px;">
						<option value="" style="font-size:1.2em;">담당강사를 선택하세요.</option>
					<%
						try{
							sql="select idx,name from lecturer0530";
							pstmt=conn.prepareStatement(sql);
							rs=pstmt.executeQuery();
							int j=0;
							while(rs.next()){
								String idx=rs.getString(1);
								String name1=rs.getString(2);
								j++;
					%>
						<option value="<%=idx %>" style="font-size:1.2em;" <%=lecturer.equals(idx) ? "selected" : "" %>><%=name1+"["+idx+"]"%></option>
					<%
							}
						}catch(Exception e){
							e.printStackTrace();
						}
					%>
					</select>
				</td>
			</tr>
			<tr>
				<th style="height:40px;">요일</th>
				<td style="font-size:1.2em;">
					<input type=radio name=week value="1" <%=week==1 ? "checked" : "" %>>월요일
					<input type=radio name=week value="2" <%=week==2 ? "checked" : "" %>>화요일
					<input type=radio name=week value="3" <%=week==3 ? "checked" : "" %>>수요일
					<input type=radio name=week value="4" <%=week==4 ? "checked" : "" %>>목요일
					<input type=radio name=week value="5" <%=week==5 ? "checked" : "" %>>금요일
					<input type=radio name=week value="6" <%=week==6 ? "checked" : "" %>>토요일
				</td>
			</tr>
			<tr>
				<th style="height:40px;">시작</th>
				<td>
					<select name=start_hour style="height:40px;width:100%;">
						<option value="" value="" style="font-size:1.2em;">시작 시간</option>
						<%
							for(int i=9;i<=18;i++){
						%>
						<option value=<%=i*100 %> value="" style="font-size:1.2em;" <%=start_hour==i ? "selected" : "" %>><%=i %>:00</option>
						<%
							}
						%>
					</select>
				</td>
			</tr>
			<tr>
				<th style="height:40px;">종료</th>
				<td>
					<select name=end_hour style="height:40px;width:100%;">
						<option value="" style="font-size:1.2em;">종료 시간</option>
						<%
							for(int i=9;i<=18;i++){
						%>
						<option value=<%=i*100 %> style="font-size:1.2em;" <%=end_hour==i ? "selected" : "" %>><%=i %>:00</option>
						<%
							}
						%>
					</select>
				</td>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<%@ include file="../MAIN/header.jsp" %>
<%@ include file="../MAIN/nav.jsp" %>

<section>
	<form name=form>
		<br><h3 style="text-align:center; font-size:2em;">강사정보 목록</h3><br>
		<%
			Integer no=0;
			try{
				sql="select count(idx) from lecturer0530";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()){
					no=rs.getInt(1);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		%>
		<pre style="font-size:1.2em; font-weight:bold;">총 <%=no %>명의 강사정보가 있습니다.</pre><hr><br>
		<table border=1 style="margin:0 auto; width:80%;">
			<tr style="font-size:1.2em;">
				<th style="height:40px;">강사코드</th>
				<th>강사명</th>
				<th>전공</th>
				<th>연구분야</th>
				<th>구분</th>
			</tr>
		<%
			try{
				sql="select * from lecturer0530";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()){
					Integer idx=rs.getInt(1);
					String name=rs.getString(2);
					String major=rs.getString(3);
					String field=rs.getString(4);
		%>
			<tr style="font-size:1.2em; text-align:center;">
				<td style="height:40px;"><%=idx %></td>
				<td><%=name %></td>
				<td><%=major %></td>
				<td><%=field %></td>
				<td id=a1><a href="updateLecturer.jsp?idx=<%=idx%>">수정</a>/<a href="#" onclick=del()>삭제</a></td>
			</tr>
<script>
	function del(){
		if(!confirm("정말 삭제하시겠습니까?")){
			location.href="selectLecturer.jsp";
		}else{
			location.href="deleteLecturerProcess.jsp?idx=<%=idx%>";
		}
	}
</script>
		<%
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		%>
		</table>
	</form>
	
</section>

<%@ include file="../MAIN/footer.jsp" %>
</body>
</html>
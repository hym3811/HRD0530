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
		<br><h3 style="text-align:center; font-size:2em;">학사정보 목록</h3><br>
		<%
			Integer no=0;
			try{
				sql="select count(studno) from stud0530";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()){
					no=rs.getInt(1);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		%>
		<pre style="font-size:1.2em; font-weight:bold;">총 <%=no %>명의 학사정보가 있습니다.</pre><hr><br>
		<table border=1 style="margin:0 auto; width:80%;">
			<tr style="font-size:1.2em;">
				<th style="height:40px;">학번</th>
				<th>성명</th>
				<th>학과</th>
				<th>학년</th>
				<th>주소</th>
				<th>연락처</th>
				<th>취미</th>
				<th>관리</th>
			</tr>
		<%
			try{
				sql="select * from stud0530";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()){
					Integer studno=rs.getInt(1);
					String name=rs.getString(2);
					Integer d=rs.getInt(3);
					String dept=null;
					switch(d){
					case 1:
						dept="컴퓨터공학과";
						break;
					case 2:
						dept="기계공학과";
						break;
					case 3:
						dept="전자과";
						break;
					case 4:
						dept="영문학과";
						break;
					case 5:
						dept="일어과";
						break;
					case 6:
						dept="경영학과";
						break;
					case 7:
						dept="무역학과";
						break;
					case 8:
						dept="교육학과";
						break;
					}
					Integer position=rs.getInt(4);
					String address=rs.getString(5);
					String phone=rs.getString(6);
					String hobby=rs.getString(7);
		%>
			<tr style="font-size:1.2em; text-align:center;">
				<td style="height:40px;"><%=studno %></td>
				<td><%=name %></td>
				<td><%=dept %></td>
				<td><%=position %>학년</td>
				<td><%=address %></td>
				<td><%=phone %></td>
				<td style="width:25%;"><%=hobby %></td>
				<td id=a1><a href="updateStudent.jsp?studno=<%=studno%>">수정</a>/<a href="#" onclick=del()>삭제</a></td>
			</tr>
<script>
	function del(){
		if(!confirm("정말 삭제하시겠습니까?")){
			location.href="selectStudent.jsp";
		}else{
			location.href="deleteStudentProcess.jsp?studno=<%=studno%>";
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
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
		<br><h3 style="text-align:center; font-size:2em;">교과목 목록</h3><br>
		<%
			Integer no=0;
			try{
				sql="select count(id) from course0530";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()){
					no=rs.getInt(1);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		%>
		<pre style="font-size:1.2em; font-weight:bold;">총 <%=no %>개의 교과목 정보가 있습니다.</pre><hr><br>
		<table border=1 style="margin:0 auto; width:80%;">
			<tr style="font-size:1.2em;">
				<th style="height:40px;">과목코드</th>
				<th>과목명</th>
				<th>학점</th>
				<th>담당강사</th>
				<th>요일</th>
				<th>시작시간</th>
				<th>종료시간</th>
				<th>관리</th>
			</tr>
		<%
			try{
				sql="select * from course0530";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()){
					String id=rs.getString(1);
					String name=rs.getString(2);
					Integer credit=rs.getInt(3);
					Integer l=Integer.parseInt(rs.getString(4));
					Integer w=rs.getInt(5);
					Integer start_hour=rs.getInt(6);
					Integer end_hour=rs.getInt(7);
					String lecturer=null;
					String week=null;
					switch(l){
					case 1:
						lecturer="김교수";
						break;
					case 2:
						lecturer="이교수";
						break;
					case 3:
						lecturer="박교수";
						break;
					case 4:
						lecturer="우교수";
						break;
					case 5:
						lecturer="최교수";
						break;
					case 6:
						lecturer="강교수";
						break;
					case 7:
						lecturer="황교수";
						break;
					}
					switch(w){
					case 1:
						week="월요일";
						break;
					case 2:
						week="화요일";
						break;
					case 3:
						week="수요일";
						break;
					case 4:
						week="목요일";
						break;
					case 5:
						week="금요일";
						break;
					case 6:
						week="토요일";
						break;
					}
		%>
			<tr style="font-size:1.2em; text-align:center;">
				<td style="height:40px;"><%=id %></td>
				<td><%=name %></td>
				<td><%=credit %></td>
				<td><%=lecturer %></td>
				<td><%=week %></td>
				<td><%=start_hour/100 %>:00</td>
				<td><%=end_hour/100 %>:00</td>
				<td id=a1><a href="updateCourse.jsp?id=<%=id%>">수정</a>/<a href="#" onclick=del()>삭제</a></td>
			</tr>
<script>
	function del(){
		if(!confirm("정말 삭제하시겠습니까?")){
			location.href="selectCourse.jsp";
		}else{
			location.href="deleteCourseProcess.jsp?id=<%=id%>";
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
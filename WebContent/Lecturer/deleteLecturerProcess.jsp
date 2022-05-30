<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../DBConn.jsp" %>
<%
	String idx=request.getParameter("idx");

	try{
		sql="delete from lecturer0530 where idx=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, idx);
		pstmt.executeUpdate();
%>
<script>
	alert("강사 정보 삭제 성공");
	location.href="selectLecturer.jsp";	
</script>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>
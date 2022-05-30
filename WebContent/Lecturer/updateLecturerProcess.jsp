<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../DBConn.jsp" %>
<%
	String idx=request.getParameter("idx");
	String name=request.getParameter("name");
	String major=request.getParameter("major");
	String field=request.getParameter("field");
	
	try{
		sql="update lecturer0530 set name=?,major=?,field=? where idx=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(4, idx);
		pstmt.setString(1, name);
		pstmt.setString(2, major);
		pstmt.setString(3, field);
		pstmt.executeUpdate();
%>
<script>
alert("강사 정보 수정 성공");
location.href="selectLecturer.jsp";
</script>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>
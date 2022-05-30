<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../DBConn.jsp" %>
<%
	String studno=request.getParameter("studno");
	String name=request.getParameter("name");
	String dept=request.getParameter("dept");
	String position=request.getParameter("position");
	String address=request.getParameter("address");
	String phone=request.getParameter("phone");
	String[] h=request.getParameterValues("hobby");
	String h1=Arrays.toString(h).replace("[", "");
	String hobby=h1.replace("]", "");
	try{
		sql="update stud0530 set name=?,dept=?,position=?,address=?,phone=?,hobby=? where studno=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(7, studno);
		pstmt.setString(1, name);
		pstmt.setString(2, dept);
		pstmt.setString(3, position);
		pstmt.setString(4, address);
		pstmt.setString(5, phone);
		pstmt.setString(6, hobby);
		pstmt.executeUpdate();
%>
<script>
alert("학사정보 수정 성공");
location.href="selectStudent.jsp";
</script>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../DBConn.jsp" %>
<%
	String idx=request.getParameter("idx");
	String name=request.getParameter("name");
	String major=request.getParameter("major");
	String field=request.getParameter("field");
	
	try{
		sql="select table_name from user_tables where table_name='LECTURER0530'";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(rs.next()==false){
			sql="create table lecturer0530(idx number(6) primary key,name varchar2(10),major varchar2(40),field varchar2(40))";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
%>
<script>
alert("lecturer0530 데이터 테이블 생성 완료");
</script>
<%
		}
		sql="select * from lecturer0530 where idx=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, idx);
		rs=pstmt.executeQuery();
		if(rs.next()){
%>
<script>
alert("이미 등록된 강사정보입니다.");
location.href="addLecturer.jsp";
</script>
<%
		}else{
			sql="insert into lecturer0530 values(?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			pstmt.setString(2, name);
			pstmt.setString(3, major);
			pstmt.setString(4, field);
			pstmt.executeUpdate();
%>
<script>
alert("강사 정보 등록 성공");
location.href="addLecturer.jsp";
</script>
<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
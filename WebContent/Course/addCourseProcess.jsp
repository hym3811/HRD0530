<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../DBConn.jsp" %>
<%
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String credit=request.getParameter("credit");
	String lecturer=request.getParameter("lecturer");
	String week=request.getParameter("week");
	String start_hour=request.getParameter("start_hour");
	String end_hour=request.getParameter("end_hour");
	
	try{
		sql="select table_name from user_tables where table_name='COURSE0530'";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(rs.next()==false){
			sql="create table course0530(id varchar2(5) primary key,name varchar2(40),credit number(6),lecturer varchar2(10),week number(2),start_hour number(4),end_hour number(4))";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
%>
<script>
alert("course0530 데이터 테이블 생성 완료");
</script>
<%
		}
		sql="select * from course0530 where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		if(rs.next()){
%>
<script>
alert("이미 등록된 교과목 코드입니다.");
location.href="addCourse.jsp";
</script>
<%
		}else{
			sql="insert into course0530 values(?,?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, credit);
			pstmt.setString(4, lecturer);
			pstmt.setString(5, week);
			pstmt.setString(6, start_hour);
			pstmt.setString(7, end_hour);
			pstmt.executeUpdate();
%>
<script>
alert("교과목 정보 등록 성공");
location.href="addCourse.jsp";
</script>
<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
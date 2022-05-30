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
		sql="select table_name from user_tables where table_name='STUD0530'";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(rs.next()==false){
			sql="create table stud0530(studno number(8) primary key,name varchar2(20) not null,dept number(3) not null,position number(1) not null,address varchar2(80),phone varchar2(13),hobby varchar2(80))";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
%>
<script>
alert("stud0530 데이터 테이블 생성 완료");
</script>
<%
		}
		sql="select * from stud0530 where studno=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, studno);
		rs=pstmt.executeQuery();
		if(rs.next()){
%>
<script>
alert("이미 등록된 학번입니다.");
location.href="addStudent.jsp";
</script>
<%
		}else{
			sql="insert into stud0530 values(?,?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, studno);
			pstmt.setString(2, name);
			pstmt.setString(3, dept);
			pstmt.setString(4, position);
			pstmt.setString(5, address);
			pstmt.setString(6, phone);
			pstmt.setString(7, hobby);
			pstmt.executeUpdate();
%>
<script>
alert("학사 정보 등록 성공");
location.href="addStudent.jsp";
</script>
<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql=null;
	
	request.setCharacterEncoding("utf-8");
	try{
		String url="jdbc:oracle:thin:@//localhost:1521/xe";
		String user="system";
		String pass="3811";
		String driver="oracle.jdbc.OracleDriver";
		Class.forName(driver);
		conn=DriverManager.getConnection(url,user,pass);
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<%@page import="java.sql.ResultSet"%>
<%@page import="test.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 목록</title>
</head>
<body>
<%
String sql = "select food_num, food_name, food_price from food";
try{
	PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	out.write("<table border=\"1\">");
	while(rs.next()){
		out.write("<tr>");
		out.write("<td>"+rs.getString("food_num")+"</td>");
		out.write("<td>"+rs.getString("food_name")+"</td>");
		out.write("<td>"+rs.getInt("food_price")+"</td>");
		out.write("</tr>");
	}
	out.write("</table>");
}catch(Exception e){
	out.println(e);
}finally{
	DBCon.close();
}
%>
</body>
</html>
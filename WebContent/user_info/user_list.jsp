<%@page import="java.sql.ResultSet"%>
<%@page import="test.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form>
이름:<input type="text" name="uiName">
<button>검색</button>

<%
String uiName = request.getParameter("uiName");

String sql = " select ui_num, ui_name, ui_id, ui_age, ui_etc from user_info";
if(uiName != null){
	sql += " where ui_name like '%' || ? ||'%'";
}
PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
if(uiName != null){
	ps.setString(1,uiName);
}
ResultSet rs = ps.executeQuery();
out.write("<table border=\"1\">");
%>
<tr>
<td>번호</td>
<td>이름</td>
<td>아이디</td>
<td>나이</td>
<td>기타사항</td>
<td>버튼</td>
</tr>
<%
while (rs.next()){
	
%>
<tr>
<td><%=rs.getString("ui_num") %></td>
<td><a href="/jsp-study/user_info/user_view.jsp?ui_num=<%=rs.getString("ui_num") %>"><%=rs.getString("ui_name") %></a></td>
<td><%=rs.getString("ui_id") %></td>
<td><%=rs.getString("ui_age") %></td>
<td><%=rs.getString("ui_etc") %></td>
<td><button type="button" onclick="goDeletePage()">삭제</button></td>
</tr>
<%
}
out.write("</table>");
%>
</form>
<script>
function goDeletePage(){
	location.href="/jsp-study/user_info/user_delete_ok.jsp";
}
</script>
</body>
</html>
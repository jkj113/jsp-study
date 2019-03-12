<%@page import="java.sql.ResultSet"%>
<%@page import="test.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CAR_INFO</title>
</head>
<body>
<%

String ciYear = request.getParameter("ci_year");
String ciName = request.getParameter("ci_name");
String ciVendor = request.getParameter("ci_vendor");
if(ciName != null){
%>
검색하신 차의 이름 :<%=ciName%><br>
검색하신 차의 회사 :<%=ciVendor%><br>
검색하신 차의 년식 :<%=ciYear%><br>
<%
}
%>
<form>
검색 할 차의 이름 : <input type="text" name="ci_name"><br>
검색 할 회사의 이름 : <input type="text" name="ci_vendor"><br>
검색 할 차의 년식 : <input type="number" name="ci_year"><br>
<button>검색</button>
</form>
<%
String sql = "select ci_num, ci_name, ci_vendor, ci_year, ci_etc from car_info";
sql += " where 1=1";
if(ciName != null && !"".equals(ciName)){
	sql += " and ci_name like ?";
}
if(ciVendor != null && !"".equals(ciVendor)){
	sql += " and ci_vendor like ?";
}
if(ciYear != null && !"".equals(ciYear)){
	sql += " and where ci_year = ?";
}
sql += " order by ci_num";
try{
PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
int cnt = 1;
if(ciName != null && !"".equals(ciName)){
	ps.setString(cnt++,"%"+ ciName + "%");
}
if(ciVendor != null && !"".equals(ciVendor)){
	ps.setString(cnt++,"%" + ciVendor + "%");
}
if(ciYear != null && !"".equals(ciYear)){
	ps.setString(cnt++,ciYear);
}
ResultSet rs = ps.executeQuery();
out.write("<table border=\"1\">");
while(rs.next()){
	out.write("<tr>");
	out.write("<td>"+rs.getInt("ci_num")+"</td>");
	out.write("<td>");
	out.write("<a href=\"/jsp-study/car/view.jsp?ciNum="+rs.getInt("ci_num")+"\">");
	out.write(rs.getString("ci_name")+"</a></td>");
	out.write("<td>"+rs.getInt("ci_year")+"</td>");
	out.write("<td>"+rs.getString("ci_vendor")+"</td>");
	out.write("<td>"+rs.getString("ci_etc")+"</td>");
	out.write("<td><button onclick=\"foorDelte("+rs.getString("ci_num")+")\">삭제</button></td>");
	out.write("</tr>");
}
out.write("</table>");
}catch(Exception e){
	out.println(e);
}finally{
	DBCon.close();
}
%>
<a href = "/jsp-study/car/insert.jsp">차 등록</a>
<script>
function carDelete(ciNum){
	var isDelete = confirm("삭제하시겠습니까?");
	if(isDelete){
		location.href="/jsp-study/car/delete_ok.jsp?ciNum="+ciNum;
	}
}
</script>
</body>
</html>
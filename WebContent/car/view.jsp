<%@page import="java.sql.ResultSet"%>
<%@page import="test.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String ciNum = request.getParameter("ciNum");
    String sql = " select ci_num, ci_name, ci_year, ci_vendor, ci_etc from car_info";
    	   sql += " where ci_num = ?";
    PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
    ps.setString(1,ciNum);
    ResultSet rs = ps.executeQuery();
    if(rs.next()){
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
선택한 자동차 번호 :<%=ciNum%>
<form method="post" action="/jsp-study/car/update_ok.jsp">
번호 : <input type="number" name="ciNum" value=<%=ciNum%>"readonly="readonly"><br>
자동차 이름 :<input type="text" name="ci_name" value="<%=rs.getString("ci_name")%>"><br>
자동차 회사 :<input type="text" name="ci_vendor" value="<%=rs.getString("ci_vendor")%>"><br>
자동차 년식 :<input type="number" name="ci_year" value="<%=rs.getString("ci_year")%>"><br>
참고 사항 : <input type="text" name="ci_etc" value="<%=rs.getString("ci_etc")%>"><br>
<button>수정</button>
</form>
<a href="/jsp-study/car/list.jsp">자동차 리스트</a>
</body>
</html>
<%
}else{
	out.write("<b>조회하신 "+ ciNum +" 번호는 존재하지 않습니다.");
	out.write("<a href=\"/jsp-study/car/list.jsp\">자동차 리스트</a>");
}
%>
<%@page import="test.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    String ciName = request.getParameter("ci_name");
    String ciYear = request.getParameter("ci_year");
    String ciVendor = request.getParameter("ci_vendor");
    String ciEtc = request.getParameter("ci_etc");
    if(ciName==null){
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자동차 등록</title>
</head>
<body>
<form method="post">
자동차 이름 : <input type="text" name="ci_name"><br>
자동차 회사 : <input type="text" name="ci_vendor"><br>
자동차 년식 : <input type="number" name="ci_year"><br>
참고사항 : <input type="text" name="ci_etc"><br>
<button>자동차 등록</button>
</form>
</body>
</html>
<%
}else{
	String sql = "insert into car_info(ci_num, ci_name, ci_vendor, ci_year, ci_etc)"
			+ " values((select nvl(max(ci_num),0)+1 from car_info),?,?,?,?)";
	PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
	ps.setString(1,ciName);
	ps.setString(2,ciVendor);
	ps.setString(3,ciYear);
	ps.setString(4,ciEtc);
	int cnt = ps.executeUpdate();
	if(cnt==1){
		out.println("자동차 등록 완료!!");
	}else{
		out.println("자동차 등록 실패");
	}
	out.println("<a href=\"/jsp-study/car/list.jsp\">자동차 목록</a>");
}
%>
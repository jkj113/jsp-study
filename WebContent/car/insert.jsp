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
자동차 이름 : <input type="text" name="ciName"><br>
자동차 회사 : <input type=""
자동차 년식 : <input type="number" name="ciYear"><br>
</form>
</body>
</html>
<%
}
%>
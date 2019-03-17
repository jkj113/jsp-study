<%@page import="test.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제 페이지입니다.</title>
</head>
<body>
<%
String uiNum=request.getParameter("ui_num");
String sql = " delete user_info where ui_num = ?";
PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
ps.setString(1,uiNum);
int cnt = ps.executeUpdate();
String result = "삭제가 실패하였씁니다.";
if(cnt==1){
	result="삭제가 성공하였습니다.";
}
%>
<script>
alert("<%=result%>");
location.href="/jsp-study/user_info/user_list.jsp"
</script>
</body>
</html>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="test.jsp.study.db.DBCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업데이트가 완료되었습니다.</title>
</head>
<body>

<%
request.setCharacterEncoding("utf-8");
String uiNum = request.getParameter("uiNum");
String uiName = request.getParameter("uiName");
String uiAge = request.getParameter("uiAge");
String uiId = request.getParameter("uiId");
String uiEtc = request.getParameter("uiEtc");

String sql = " update user_info set ui_name = ?, ui_age = ?, ui_id = ?, ui_etc = ?";
sql += " where ui_num = ?";
try{
	PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
ps.setString(1,uiName);
ps.setString(2,uiAge);
ps.setString(3,uiId);
ps.setString(4,uiEtc);
ps.setString(5,uiNum);
int cnt = ps.executeUpdate();

String result = "업데이트가 실패하였습니다.";
if(cnt==1){
	result = "업데이트가 성공하였습니다.";
}
out.print(result);
out.write("<br> <a href=\"/jsp-study/user_info/user_list.jsp\">메인으로 돌아가기</a>");
}catch(Exception e){
	out.print(e);
}finally{
	DBCon.close();
}
%>
</body>
</html>
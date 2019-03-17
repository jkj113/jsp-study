<%@page import="java.sql.ResultSet"%>
<%@page import="test.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 페이지입니다.</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String uiNum = request.getParameter("uiNum");
String sql = " select ui_num, ui_name, ui_id, ui_etc, ui_age from user_info";
sql += " where ui_num = ?";
PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
ps.setString(1,uiNum);
ResultSet rs = ps.executeQuery();
if(rs.next()){
	%>
	<form method="post" action="/jsp-study/user_info/user_update_ok.jsp" id="userForm">
	번호:<%=rs.getInt("ui_num") %><br>
	이름:<input type="text" name="uiName" value="<%=rs.getString("ui_name") %>"><br>
	아이디:<input type="text" name="uiId" value="<%=rs.getString("ui_id") %>"><br>
	나이:<input type="number" name="uiAge" value="<%=rs.getString("ui_age") %>"><br>
	비고:<textarea name="uiEtc"><%=rs.getString("ui_etc")%></textarea><br>
	<button>유저수정</button>
	<button type="button" onclick="deletUser()">유저 삭제</button>
	<input type="hidden" name="uiNum" value="<%=rs.getString("ui_num") %>">
	</form>
	<%
}else{
	out.write("찾는 정보가 없습니다.<br>");
}
out.write("<a href=\"/jsp-study/user_info/user_info.jsp\">메인으로 돌아가기</a>");
%>
<script>
function deleteUesr(){
	document.getElementById("userForm").action="/jsp-study/user_info/user_delete_ok.jsp";
	document.getElementById("userForm").submit();
}
</script>
</body>
</html>
<%@page import="test.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String ciNum = request.getParameter("ciNum");
String ciName = request.getParameter("ciName");
String ciVendor = request.getParameter("ciVendor");
String ciYear = request.getParameter("ciYear");
String ciEtc = request.getParameter("ciEtc");
String sql = " update car_info set ci_name = ?, ci_vendor = ?, ci_year = ?, ci_etc = ?"
		+ " where ci_num = ?";

PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
ps.setString(1,ciName);
ps.setString(2,ciVendor);
ps.setString(3,ciYear);
ps.setString(4,ciEtc);
ps.setString(5,ciNum);
int cnt = ps.executeUpdate();
String result = "수정이 실패하였습니다.";
if(cnt==1){
	result = "수정이 성공하였습니다.";
}
%>
<script>
alert("<%=result%>");
location.href="/jsp-study/car/view.jsp?ciNum=<%=ciNum%>";
</script>
<!--  page import="test.jsp.study.db.DBCon"%>-->
<%@page import="test.jsp.study.common.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String ciNum = request.getParameter("ciNum");
String ciName = request.getParameter("ci_name");
String ciVendor = request.getParameter("ci_vendor");
String ciYear = request.getParameter("ci_year");
String ciEtc = request.getParameter("ci_etc");
String sql = " delete from car_info where ci_num = ?";

PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
ps.setString(1,ciNum);
int cnt = ps.executeUpdate();
String result = "삭제를 실패하였습니다.";
if(cnt==1){
	result = ("삭제를 성공했씁니다.");
}
%>
<script>
alert("<%=result%>");
location.href="/jsp-study/car/list.jsp";
</script>
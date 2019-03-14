<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Map<String,String[]> map = request.getParameterMap();
String[] ids = map.get("id");
String[] names= map.get("name");
String[] credats = map.get("credat");
String[] trans = map.get("trans");
String[] contents = map.get("content");
Set<String> keys = map.keySet();
Iterator<String> it = keys.iterator();
while(it.hasNext()){
	String key = it.next();
	String[] values = map.get(key);
	out.write(key+" : "+values[0]+"<br>");
}
if(ids!=null){
	out.write("ID : "+ ids[0]+"<br>");
	out.write("이름 : " + names[0]+"<br>");
	out.write("날짜 : " + credats[0]+"<br>");
	out.write("성별 : " + trans[0]+"<br>");
	out.write("내용 : " + contents[0]+"<br>");
}	
%>
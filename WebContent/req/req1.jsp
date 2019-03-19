<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setAttribute("종인","commit");
pageContext.setAttribute("난","누구");
session.setAttribute("backend","뒤끝");
application.setAttribute("왜웃어?","같이 웃자");
//response.sendRedirect("/jsp-study/req/req2.jsp");
RequestDispatcher rd = request.getRequestDispatcher("/req/req3.jsp");
rd.forward(request,response);
%>
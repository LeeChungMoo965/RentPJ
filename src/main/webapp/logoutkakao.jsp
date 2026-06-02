<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
//세션 무효화
session.invalidata();
response.sendRedirect("loginkakao.jsp");
%>
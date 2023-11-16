<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
안녕
<% List<Integer> list = Arrays.asList(1,2,3,4);



%>
<h1>순회코드</h1>
<%for (int i=0; i<list.size(); i++) {%>
<div>
<b> index : <%=  i %></b><span><%= list.get(i) %></span>
</div>
<%}%>
</body>
</html>

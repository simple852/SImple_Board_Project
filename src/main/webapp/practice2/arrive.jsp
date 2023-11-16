
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String message = (String)request.getAttribute("message");
%>
<html>
<head>
    <title>돛착!</title>
</head>
<body>
<%= message%>
<h1>도착</h1>
</body>
</html>

<%@ page import="com.example.demo1.Person" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="p" class="com.example.demo1.Person"/>
<jsp:setProperty name="p" property="name" />
<jsp:setProperty name="p" property="age" />
<html>
<head>
    <title>beans</title>
</head>
<body>
<jsp:getProperty name="p" property="name"/>
<jsp:getProperty name="p" property="age"/>



</body>
</html>

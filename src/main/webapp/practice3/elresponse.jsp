
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="p" class="com.example.demo1.Person"/>
<jsp:setProperty name="p" property="*"/>
<html>
<head>
    <title>EL RESPONSE</title>
</head>
<body>
p: ${pageScope.p}<br>
p.name: ${pageScope.p.name = "ww"}<br>
p.name: ${pageScope.p.name }<br>
p.age: ${pageScope.p.age}<br>
param : ${param}<br>
param values : ${paramValues}<br>
이름 : ${param.name}<br>
나이 : ${param.get("age")}<br>

${header}


</body>
</html>

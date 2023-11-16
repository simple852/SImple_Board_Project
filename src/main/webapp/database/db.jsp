<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<sql:query var="a" dataSource="jdbc/web">
    select member_id,member_pw from member_Tbl where member_id = '' and member_pw
</sql:query>
</body>
</html>

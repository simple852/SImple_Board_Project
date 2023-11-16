<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<fmt:requestEncoding value="utf-8" />

pdf<html>
<head>

    <title>로컬테스트</title>
</head>
<body>
<fmt:setLocale value="en_US" />
<fmt:setBundle var="message" basename="message" />
    <fmt:message key="name"/>
    <fmt:message key="age"/>
    <fmt:message key="text">
        <fmt:param value="sweet"/>
        <fmt:param value="favorite"/>
    </fmt:message>

</body>
</html>
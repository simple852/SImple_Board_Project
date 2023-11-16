<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>

<html>
<head>
    <title>jstl include</title>
</head>
<body>
<c:import url="included.jsp" charEncoding="UTF-8"/>
여기는 include 하는곳
<c:url var ="a" value="included.jsp">
    <c:param name="name" value="영식"/>
    <c:param name="age" value="20"/>
    <c:param name="etc" value="zz"/>
</c:url>
<%--<c:redirect url="${a}"/>--%>
<c:set var="won" value="123454"/>
<fn:formatNumber var="a" value="123456" currencyCode="￦"/>
${a}
</body>
</html>

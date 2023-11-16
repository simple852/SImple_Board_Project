<%@ page import="java.util.Date" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>format</title>
</head>
<body>
number: 숫자 / currency: 통화 / percent: % <br>
<c:set var="won" value="1234.56789"/>
기본 : <fmt:formatNumber type="number" value="${won}"/> <br>
max int : <fmt:formatNumber type="number" maxIntegerDigits="3" value="${won}"/><br>
max frac : <fmt:formatNumber type="number" maxFractionDigits="3" value="${won}"/><br>
percent int : <fmt:formatNumber type="percent" value="${0.25}"/><br>
pattern int : <fmt:formatNumber type="percent"  value="${won}" pattern="###.###" /><br>
currency int : <fmt:formatNumber type="number"  value="${won}" pattern="0,000.00" /><br>
currency int : <fmt:formatNumber type="currency"  value="${won}" currencySymbol="₩" /><br>
currency int : <fmt:formatNumber type="currency"  value="${won}" currencySymbol="\\" /><br>


날짜<br>
<c:set var="date" value="<%= new Date() %>" />
<fmt:formatDate value="${date}" /><br>
날짜타입 <br>
time : <fmt:formatDate value="${date}" type="time"/><br>
date : <fmt:formatDate value="${date}" type="date"/><br>
both : <fmt:formatDate value="${date}" type="both"/><br>


날짜길이 <br>

short : <fmt:formatDate value="${date}" type="both" dateStyle="short" /> <br>
medium : <fmt:formatDate value="${date}" type="both" dateStyle="medium" /> <br>
Long : <fmt:formatDate value="${date}" type="both" dateStyle="long" /> <br>
</body>
</html>

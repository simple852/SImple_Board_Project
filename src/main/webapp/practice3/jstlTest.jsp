<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<jsp:useBean id="p" class="com.example.demo1.Person"/>

<%
    List<Integer> list = Arrays.asList(1,2,3,4,5,6);
%>
<html>
<head>
    <title>jstlTest</title>
</head>
<body>
<c:set target="${p}" property="age"  value="1"  />
<c:set target="${p}" property="name"  value="james"  />

${p.age}
${p.name}
<c:if test="${p.age < 100}">
   김치!
</c:if>
<c:choose>
    <c:when test="${p.name  == 'tom'}">tom이다</c:when>
    <c:when test="${p.name  =='james'}">제임스다</c:when>
    <c:otherwise>아무도아니다</c:otherwise>
</c:choose>
<c:forEach var="n" begin="1" end="10" step="2" varStatus="stat">
    <:c:if test="${stat.first}">
        처음이다
    </:c:if>
    ${n} / ${stat.index} / ${stat.count}<br>
</c:forEach>

<c:set var="l" value="<%= list %>"/>
<c:forEach var="item" items="${l}" varStatus="stat">
    ${item}
</c:forEach>
</body>
</html>

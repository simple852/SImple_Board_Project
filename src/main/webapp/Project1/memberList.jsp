<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<sql:setDataSource var="ds" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://192.168.2.5:3306/project1" user="webuser" password="1234" />

<sql:query var="rs" dataSource="${ds}" >
    select * from member_tbl
</sql:query>


<html lang="ko">
<head>
    <title>Member List</title>
</head>
<body>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>member_Id</th>
            <th>member_Name</th>
        </tr>

      <c:forEach var="row" items="${rs.rows}">
            <tr>
                <td>${row.id}</td>
                <td>${row.member_id}</td>
                <td>${row.member_name}</td>
<%--                <td><c:out value="${row.member_pw}" /></td>--%>
            </tr>
        </c:forEach>








<%--        <tr>--%>
<%--            <c:forEach items="${rs.columnNames }" var="columnName">--%>
<%--                <th>${columnName }</th>--%>
<%--            </c:forEach>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <c:forEach items="${row }" var="column">--%>
<%--                <td>${column }</td>--%>
<%--            </c:forEach>--%>
<%--        </tr>--%>
<%--        <c:forEach items="${rs.rowsByIndex }" var="row">--%>
<%--        </c:forEach>--%>
    </table>
</body>
</html>
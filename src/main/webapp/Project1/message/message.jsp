
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

${sessionScope.get("sessionId")}
${sessionScope.get("sessionIndex")}
<c:set var="sessionId" value="${sessionScope.get('sessionId')}"/>
<c:set var="sessionIndex" value="${sessionScope.get('sessionIndex')}"/>

<sql:query var="message" dataSource="jdbc/web">

    SELECT * from message_tbl where `from` = '${sessionIndex}' or `to` = '${sessionIndex}';
</sql:query>
SELECT * from message_tbl where `from` = '${sessionId}' or `to` = '${sessionId}';

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css">

    <link rel="stylesheet" href="../css/board.css">
    <script src="../js/defualt.js"> </script>


<body >


<div class="section" style="height: 500px">
    <div class="container">
        <div class="row full-height justify-content-center">
            <div class="col-12 text-center align-self-center py-5">
                <div class="section pb-5 pt-5 pt-sm-2 text-center">

                    <button type="button" id="messageBtn">쪽지보내기</button>
                    <div class="card-3d-wrap mx-auto">
                        <div class="card-3d-wrapper">
                            <div class="card-board">
                                <table class="board">
                                    <thead>
                                    <tr>

                                        <th>보낸사람</th>
                                        <th>받은사람</th>
                                        <th>읽음</th>
                                        <th>날짜</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${message.rows}" var="values" >
                                        <tr>
                                            <td>${values.id}</td>
                                            <td>${values.from}</td>
                                            <td>${values.to}</td>
                                            <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${values.created_date}"/></td>
                                        </tr>

                                    </c:forEach>
                                    </tbody>

                                </table>



                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>


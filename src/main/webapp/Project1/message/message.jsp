
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="sessionId" value="${sessionScope.get('sessionId')}"/>
<c:set var="sessionIndex" value="${sessionScope.get('sessionIndex')}"/>

<c:if test="${sessionId == null}">
    <c:redirect url="../login.jsp"/>

</c:if>


<sql:query var="message" dataSource="jdbc/web" >
    SELECT a.id as id, a.title as title, concat(b.member_id,'') as `from`,concat(c.member_id,'') as `to`,a.`read` as `read`, a.send_date as send_date from message_tbl as a
    left join member_tbl as b on(a.`from` = b.id )
    join member_tbl as c  on(a.`to` = c.id )  where `from` = '${sessionIndex}' or `to` = '${sessionIndex}' order by a.id desc ;
</sql:query>


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

                    <button type="button" onclick="window.location='sendmessage2.jsp'">쪽지보내기</button>
                    <button type="button" onclick="window.close()">나가기</button>
                    <div class="card-3d-wrap mx-auto">
                        <div class="card-3d-wrapper">
                            <div class="card-board">
                                <table class="board">
                                    <thead>
                                    <tr>
                                        <th>구분</th>
                                        <th>제목</th>
                                        <th>보낸사람</th>
                                        <th>받은사람</th>
                                        <th>확인</th>
                                        <th>날짜</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${message.rows}" var="values" >
                                        <c:if test="${values.from == sessionId}" >
                                        <tr style="color: aliceblue" onclick="window.location='message_item.jsp?item=${values.id}'">
                                            <td>

                                            <b>보낸쪽지</b>
                                            </c:if>

                                            <c:if test="${values.from != sessionId}" >
                                        <tr style="color: #a2d9ff" onclick="window.location='message_item.jsp?item=${values.id}'">
                                            <td>
                                            <p>받은쪽지</p>
                                            </c:if>
                                            </td>
                                            <td>${values.title}</td>
                                            <td>${values.from}</td>
                                            <td>${values.to}</td>
                                        <c:if test="${values.read == '읽음'}" >
                                            <td style="color: red">${values.read}</td>
                                        </c:if>
                                        <c:if test="${values.read == '안읽음'}" >
                                            <td style="color: aliceblue">${values.read}</td>
                                        </c:if>

                                            <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${values.send_date}"/></td>
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


<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="receiveId" value="${param.receive}"/>
<c:set var="sessionId" value="${sessionScope.get('sessionId')}"/>
<c:set var="sessionIndex" value="${sessionScope.get('sessionIndex')}"/>

<c:if test="${sessionId == null}">
    <c:redirect url="../login.jsp"/>
</c:if>


<sql:query var="rs" dataSource="jdbc/web" >
    select * from member_tbl where id != ('${sessionScope.get("sessionIndex")}')
</sql:query>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css">

    <link rel="stylesheet" href="../css/board.css">

    <style>
        #checkBox {
            text-align: center;
        }

        th {
            text-align: center;
        }

        form {
            display: flex;
        }

        #div1 {
            width: 50%;
        }
        #div2 {
            width: 50%;
        }
    </style>

<body>


<div class="section">
    <div class="container">
        <div class="row full-height justify-content-center">
            <div class="col-12 text-center align-self-center py-5">
                <div class="section pb-5 pt-5 pt-sm-2 text-center">
                    <div class="card-3d-wrap mx-auto">
                        <div class="card-3d-wrapper">
                            <div class="card-board">
                                <form action="../process/send_process.jsp" method="get">
                                    <div id="div1">
                                        <input type="text" name ="title" class="title"><br>
                                        <textarea class="content" name="content"></textarea><br>
                                        <input type="hidden" name = "sendId" value = ${sessionScope.get("sessionIndex")} >


                                    </div>
                                    <div id="div2">
                                        <table border="1">
                                            <tr>
                                                <th>체크</th>

                                                <th>회원이름</th>
                                                <th>회원아이디</th>
                                            </tr>

                                            <c:forEach var="row" items="${rs.rows}">
                                                <tr>
                                                    <td id="checkBox">
                                                        <input type="checkbox" name="receiveId" value="${row.id}">
                                                    </td>

                                                    <td>${row.member_name}</td>
                                                    <td>${row.member_id}</td>
                                                        <%--                <td><c:out value="${row.member_pw}" /></td>--%>
                                                </tr>
                                            </c:forEach>


                                        </table>
                                        <button type="submit">보내기</button>
                                        <button type="button" onclick="location.href='message.jsp' ">뒤로가기</button>
                                        <%--                                        <button type="submit">보내기</button>--%>
                                    </div>
                                </form>
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
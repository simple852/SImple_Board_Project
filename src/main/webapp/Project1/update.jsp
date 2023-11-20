<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="sessionId" value="${sessionScope.get('sessionId')}"/>
<c:set var="sessionIndex" value="${sessionScope.get('sessionIndex')}"/>

<c:if test="${sessionId == null}">
    <c:redirect url="login.jsp"/>
</c:if>

<c:set var="boardId" value="${param.board_Id}" />

<sql:query var="value" dataSource="jdbc/web" >
    select * from board_tbl where id=${boardId};
</sql:query>




<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css">

    <link rel="stylesheet" href="css/board.css">

<body>


<div class="section">
    <div class="container">
        <div class="row full-height justify-content-center">
            <div class="col-12 text-center align-self-center py-5">
                <div class="section pb-5 pt-5 pt-sm-2 text-center">
                    <div class="card-3d-wrap mx-auto">
                        <div class="card-3d-wrapper">
                            <div class="card-board">
                                <c:forEach items="${value.rows}" var="result">
                                    <input type="text" name="title" class="title" id="title" value="${result.title}"><br>
                                    <c:set var="content" value="${result.content}" />
                                    <textarea class="content" name="content" id="content">${result.content}</textarea><br>
                                    <input type="hidden" name="id" id="writer" value = ${sessionId} >
                                    <button type="submit" id="sub">수정</button>
                                    <button onclick="history.back()">뒤로가기</button>
                                    <%--                                    <button type="button" onclick="location.href='main.jsp' ">뒤로가기</button>--%>
                                </c:forEach>
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
<script src="https://code.jquery.com/jquery-3.4.1.js" defer></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script>
    const title = document.querySelector("#title");
    const content = document.querySelector("#content");
    const writer = document.querySelector("#writer");
    const sub = document.querySelector("#sub"); // 수정버튼


    sub.onclick = () => {
        $.ajax({
            type: "post",
            url: "process/board_update_process.jsp",
            data : {
                title: title.value,
                content: content.value,
                writer: writer.value,
                board_id: ${boardId}
            },
            success:function (data) {
                if (data.success === false) {
                    alert('수정 실패했습니다.');

                } else if (data.success === true) {
                    alert('수정을 완료 했습니다.')
                    window.location = "board_item.jsp?item="+${boardId};
                }
            },

            error:function (data) {
                console.log('ajax 에러')
            }
        })
    }

</script>


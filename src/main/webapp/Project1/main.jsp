<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="sessionId" value="${sessionScope.get('sessionId')}"/>
<c:set var="sessionIndex" value="${sessionScope.get('sessionIndex')}"/>
<c:set var="page" value="${param.get('page')}"/>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>

<c:if test="${sessionId == null}">
    <c:redirect url="login.jsp"/>
</c:if>

<c:set var="deleteSuccess" value="${param.delete}"/>
<c:if test="${deleteSuccess == false}">
    <script>
        alert(" 회원탈퇴 실패했습니다")
    </script>
</c:if>



<sql:query var="boardCount" dataSource="jdbc/web">
    SELECT count(*) as count FROM board_tbl
</sql:query>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css">

    <link rel="stylesheet" href="css/board.css">
    <script src="js/defualt.js" defer> </script>
    <c:forEach items="${boardCount.rows}" var="values" >
        <c:set var="count" value="${values.count}"/>
    </c:forEach>

    <c:if test="${page == null || page <= 1}">
        <c:set value="${1}" var="page"/>
    </c:if>

    <c:set var="maxPage" value="${count/10+1}"/>


    <c:if test="${param.page > maxPage}">
        <fmt:formatNumber  pattern="0" value="${ count/10 +1}"   var="max"/>
        <c:set var="page" value="${max}"/>
    </c:if>


<body>


<div class="section">
    <div class="container">
        <div class="row full-height justify-content-center">
            <div class="col-12 text-center align-self-center py-5">
                <div class="section pb-5 pt-5 pt-sm-2 text-center">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <li><a href="<c:url value="/Project1/main.jsp?page=${page-1}"/>" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
                            <c:forEach begin="1" end="${count/10 +1 }" varStatus="index">
                                <li><a href="main.jsp?page=${index.count}">${index.count}</a></li>

                            </c:forEach>


                            <li><a href="<c:url value="/Project1/main.jsp?page=${page+1}"/>" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
<%--                            <select name="limit" id="limit">--%>
<%--                                <option value="10">10</option>--%>
<%--                                <option value="20">20</option>--%>
<%--                                <option value="30">30</option>--%>

<%--                            </select>--%>
                        </ul>

                    </nav>
                    로그인 중인 계정 : ${sessionId}<br>
                    <button type="button" onclick="window.open('write.jsp')">글쓰기</button>
                    <button type="button" id="messageBtn">쪽지</button>
                    <button type="button" onclick="window.location='login.jsp'">로그아웃</button>
                    <button type="button" id ="delete">회원탈퇴</button>

                    <div class="card-3d-wrap mx-auto">
                        <div class="card-3d-wrapper">
                            <div class="card-board">
                                <table class="board">
                                    <thead>
                                    <tr>
                                        <th>글번호</th>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>작성일</th>
                                        <th>조회수</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <sql:query var="board" dataSource="jdbc/web">

                                        SELECT a.id,a.title,a.created_date, a.count,b.member_id
                                        FROM board_tbl   as a
                                        join member_tbl as b on (a.member_id = b.id ) order by a.created_date desc   LIMIT 10 OFFSET ${(page-1) * 10}
                                    </sql:query>
                                        <c:forEach items="${board.rows}" var="values" >
                                          <tr>
                                              <td>${values.id}</td>
                                              <td><a href="board_item.jsp?item=${values.id}">${values.title}</a></td>
                                              <td>${values.member_id}</td>
                                              <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${values.created_date}"/></td>
                                              <td>${values.count}</td>
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

<script>

    const messageBtn = document.getElementById('messageBtn');
    var _width = 700;
    var _height = 800;

    var _left  =Math.ceil((window.screen.width-_width)/2);
    var _top  =Math.ceil((window.screen.height-_height)/2);

console.log(_top)
    const status = "toolbar=no,resizeable=yes,status=no,menubar=no," +
        "width="+_width+",height="+_height+",left="+_left+",top="+_top+""
    messageBtn.onclick=(event)=>{
        window.open("message/message.jsp","message",status)
    }




    document.getElementById('delete').onclick = () => {
        $.ajax({
            type:"get",
            url:"process/delete.jsp",
            data: {
                deleteId:'${sessionIndex}' // board id 글번호
            },
            success:function (data) {
                alert("삭제완료");
                window.location.href="login.jsp";
            },
            error:function(){
                console.log("실패")
            }

        })
    }
</script>
<script src="https://code.jquery.com/jquery-3.4.1.js" defer></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

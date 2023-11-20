<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:set var="index" value="${param.index}"/>

<sql:query var="movieInfo" dataSource="jdbc/web" >
    select * from page_info where page_id = ${index}
</sql:query>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>LINK</title>
    <link rel="stylesheet" href="sample.css">
    <script src="https://kit.fontawesome.com/d19fdaba43.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">


</head>
<body>
    <header>
        <div class="container">
            <div class="container-small">
                <a href="#" class="headA">성우무비</a>
                <button  type="button" class="headB">
                </button>
            </div>
            <nav class="headC">
                <ul>
                    <li><a href="#">TOP</a></li>
                    <li><a href="#">이벤트</a></li>
                    <li><a href="#">시사회</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <c:forEach items="${movieInfo.rows}" var="values" >
    <main>
        <section class="main-image"  style="background-image: url('${values.img1}'); "  >a</section>

        <section class="left">


            <div class="left-img">
                <img src="${values.img2}" alt="">
            </div>

            <div class="left-content">


                <p>${values.title}</p>

                <h3>응모기간</h3>
                <div>${values.date}</div>

                <h3>당첨자발표일</h3>
                <div>${values.show_date2}</div>

                <h3>당첨인원</h3>
                <div>${values.people}</div>

                <h3>시사회 일시</h3>
                <div>${values.show_date}</div>

                <h3>시사회 장소</h3>
                <div>${values.location}</div>

            </div>

            <div class="left-user-info">
                <div><span id="name">이 름</span><input type="이름" ></div>
                <div><span class="phone">전 화 번 호</span><input type="전화번호"></div>
                <div><span class="email">E m  a i l</span><input type="Email"></div>
                <textarea></textarea>
                <br>
                <button>신청하기</button>
            </div>
        </section>

        <section class="bottom">
            <iframe width="560px" height="315px" src="${values.video}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
        </section>

    </main>

    </c:forEach>
</body>
</html>
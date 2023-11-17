<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:set var="success" value="${param.success}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>LINK</title>
    <link rel="stylesheet" href="Hunger.css">
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
    <main>
        <section class="main-image">a</section>

        <section class="left">

            <div class="left-img">
                <img src="https://cdn.topstarnews.net/news/photo/202311/15418253_1200885_5740.jpg" alt="">
            </div>

            <div class="left-content">
                <p>[ Hunger Game ] 시사회</p>

                <h3>응모기간</h3>
                <div>2023년11월24일 ~ 2023년12월2일</div>

                <h3>당첨자발표일</h3>
                <div>2023년12월7일</div>

                <h3>당첨인원</h3>
                <div>50명</div>

                <h3>시사회 일시</h3>
                <div>2023년12월15일</div>

                <h3>시사회 장소</h3>
                <div>롯데시네마 동성로점</div>
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
            <iframe width="560" height="315" src="https://www.youtube.com/embed/fxKTLR-L8o4?si=AaUenTTCQxPrR6cB" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
        </section>
    </main>


</body>
</html>
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
    <link rel="stylesheet" href="Marvles.css">
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
<!--                    <i class="fa-solid fa-bars"></i>-->
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
        <section class="main-image"></section>

        <section class="left">

            <div class="left-img">
                <img src="https://www.themoviedb.org/t/p/original/qApkjVJzZ2nkFUcFhcYkTBaRnNj.jpg">
            </div>
                <div class="left-content">
                    <p>[ The Marvles ] 시사회</p>

                    <h3>응모기간</h3>
                    <div>2023년12월1일 ~ 2023년11월08일</div>

                    <h3>당첨자발표일</h3>
                    <div>2023년12월14일</div>

                    <h3>당첨인원</h3>
                    <div>50명</div>

                    <h3>시사회 일시</h3>
                    <div>2023년12월22일</div>

                    <h3>시사회 장소</h3>
                    <div>롯데시네마 신촌점</div>
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
            <iframe width="560" height="315" src="https://www.youtube.com/embed/xC-ITzh98Vo?si=EDNPhe6shE56Vfue" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
        </section>
    </main>


</body>
</html>
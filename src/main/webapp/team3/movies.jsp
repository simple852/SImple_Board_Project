<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:set var="success" value="${param.success}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>AIRBNB 실습</title>
    <script src="https://kit.fontawesome.com/d19fdaba43.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="movies.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

</head>
<style>

</style>
<body>
<header>
    <div class="container">
        <div class="container-small">
            <a href="#" class="headA">성우무비</a>
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
<br>
<br>
<br>
<br>
<br>
    <main>

            <section onclick="window.location='sample.jsp?index=1'">
                <div class="background" id="img1" ></div>
                <div class="movies">
                    <div class="title-container">
                        <span class="title">[ 30일 ] 시사회</span>
                    </div>
                    <div class="price-container">
                        <div class>CGV 용산아이파크몰</div> <div>2023년 12월 18일 오후 8시 00분</div>
                    </div>
                </div>
            </section>
            <section onclick="window.location='sample.jsp?index='">
                <div class="background" id="img2"></div>
                <div class="movies">
                    <div class="title-container">
                        <span class="title"> [ 헝거게임:노래하는 새와 뱀의 발라드 ] 시사회</span>
                    </div>
                    <div class="price-container">
                        <div class>CGV 용산아이파크몰</div> <div>2023년 12월 19일 오후 8시 00분</div>
                    </div>
                </div>
            </section>

        <section onclick="window.location='sample.jsp?movie=3'">
            <div class="background" id="img3"></div>
            <div class="movies">
                <div class="title-container">
                    <span class="title">[ 톡투미 ] 시사회</span>
                </div>
                <div class="price-container">
                    <div class>롯데시네마 건대입구</div> <div>2023년 12월 19일 오후 8시 00분</div>
                </div>
            </div>
        </section>
        <section onclick="window.location='sample.jsp?movie=2'">
            <div class="background" id="img4"></div>
            <div class="movies">
                <div class="title-container">
                    <span class="title">[ 더 마블스 ] 1부 상영회</span>
                </div>
                <div class="price-container">
                    <div class>롯데시네마 월드타워</div> <div>2023년 12월 20일 오후 5시 00분</div>
                </div>
            </div>
        </section>
        <a href="#"><section>
            <div class="background" id="img5">
                <div class="end-container">
                    <div class="blank"><span>마감했어요</span></div>
                </div>
            </div>
            <div class="movies">
                <div class="title-container">
                    <span class="title">[ 그대들은 어떻게 살것인가 ] 시사회</span>
                </div>
                <div class="price-container">
                    <div class>CGV 용산아이파크몰</div> <div>2023년 12월 22일 오후 5시 00분</div>
                </div>
            </div>
        </section>
        <section class="ended">
            <div class="background" id="img6">
                <div class="end-container">
                    <div class="blank"><span>마감했어요</span></div>
                </div>
            </div>
            <div class="movies">
                <div class="title-container">
                    <span class="title">[ 엑소시스트 : 믿는 자 ] 시사회</span>
                </div>
                <div class="price-container">
                    <div class>메가박스 코엑스</div> <div>마감</div>
                </div>
            </div>
        </section>
        <section class="ended">
            <div class="background" id="img7">
                <div class="end-container">
                    <div class="blank"><span>마감했어요</span></div>
                </div>
            </div>
            <div class="movies">
                <div class="title-container">
                    <span class="title">[ 슈퍼 마리오 브라더스 ] 이벤트</span>
                </div>
                <div class="price-container">
                    <div class>롯데시네마 건대입구</div> <div>마감</div>
                </div>
            </div>
        </section>
        <section class="ended">
            <div class="background" id="img8">
                <div class="end-container">
                    <div class="blank"><span>마감했어요</span></div>
                </div>
            </div>

            <div class="movies">
                <div class="title-container">
                    <span class="title">[ 콘크리트 유토피아 ] 시사회</span>
                </div>
                <div class="price-container">
                    <div class>씨네큐브 광화문</div> <div>마감</div>
                </div>
            </div>
        </section>
        <section class="ended">
            <div class="background" id="img9">
                <div class="end-container">
                    <div class="blank"><span>마감했어요</span></div>
                </div>
            </div>

            <div class="movies">
                <div class="title-container">
                    <span class="title">[ 스즈메의 문단속 ] 시사회</span>
                </div>
                <div class="price-container">
                    <div class>롯데시네마 건대입구</div> <div>마감</div>
                </div>
            </div>
        </section>
        <section class="ended">
            <div class="background" id="img10">
                <div class="end-container">
                    <div class="blank"><span>마감했어요</span></div>
                </div>
            </div>

            <div class="movies">
                <div class="title-container">
                    <span class="title">[ 오펜하이머 ] 시사회</span>
                </div>
                <div class="price-container">
                    <div class>CGV 용산아이파크몰</div> <div>마감</div>
                </div>
            </div>
        </section>
        <section class="ended">
            <div class="background" id="img11">
                <div class="end-container">
                    <div class="blank"><span>마감했어요</span></div>
                </div>
            </div>

            <div class="movies">
                <div class="title-container">
                    <span class="title">[ 달짝지근해 ] 시사회</span>
                </div>
                <div class="price-container">
                    <div class>씨네큐브 광화문</div> <div>마감</div>
                </div>
            </div>
        </section>
        <section class="ended">
            <div class="background" id="img12">
                <div class="end-container">
                    <div class="blank"><span>마감했어요</span></div>
                </div>
            </div>

            <div class="movies">
                <div class="title-container">
                    <span class="title">[ 타겟 ] 시사회</span>
                </div>
                <div class="price-container">
                    <div class>롯데시네마 월드타워</div> <div>마감</div>
                </div>
            </div>
        </section>
        <section class="ended">
            <div class="background" id="img13">
                <div class="end-container">
                    <div class="blank"><span>마감했어요</span></div>
                </div>
            </div>

            <div class="movies">
                <div class="title-container">
                    <span class="title">[ 몬스터 패밀리 2 ] 시사회</span>
                </div>
                <div class="price-container">
                    <div class>CGV 용산아이파크몰</div> <div>마감</div>
                </div>
            </div>
        </section>
        <section class="ended">
            <div class="background" id="img14">
                <div class="end-container">
                    <div class="blank"><span>마감했어요</span></div>
                </div>
            </div>

            <div class="movies">
                <div class="title-container">
                    <span class="title">[ 엘리멘탈 ] 시사회</span>
                </div>
                <div class="price-container">
                    <div class>씨네큐브 광화문</div> <div>마감</div>
                </div>
            </div>
        </section>
        </a>

    </main>
</body>
</html>








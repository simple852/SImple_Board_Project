<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<sql:query var="a" dataSource="jdbc/web">
    select member_id,member_pw from member_Tbl where member_id = '' and member_pw
</sql:query>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css">
    <link rel="stylesheet" href="css/style.css">


<body>


<div class="section">
    <div class="container">
        <div class="row full-height justify-content-center">
            <div class="col-12 text-center align-self-center py-5">
                <div class="section pb-5 pt-5 pt-sm-2 text-center">
                    <h6 class="mb-0 pb-3">
                        <span>Log In </span>
                        <span>Sign Up</span></h6>
                    <input class="checkbox" type="checkbox" id="reg-log" name="reg-log"/>
                    <label for="reg-log"></label>
                    <div class="card-3d-wrap mx-auto">
                        <div class="card-3d-wrapper">
                            <div class="card-front">
                                <div class="center-wrap">
                                    <div class="section text-center">


                                        <form action="process/loginProcess.jsp" method="post">
                                        <h4 class="mb-4 pb-3">Log In</h4>
                                        <div class="form-group">
                                            <input type="text" name="loginId" class="form-style" placeholder="Your ID" id="logemail" autocomplete="off">
                                            <i class="input-icon uil uil-at"></i>
                                        </div>
                                        <div class="form-group mt-2">
                                            <input type="password" name="loginPw" class="form-style" placeholder="Your Password" id="logpass" autocomplete="off">
                                            <i class="input-icon uil uil-lock-alt"></i>
                                        </div>
                                        <button type="submit" class="btn mt-4">Login</button>
                                        </form>
                                    </div>
                                </div>
                            </div>





                            <div class="card-back">
                                <div class="center-wrap">
                                    <div class="section text-center">
                                        <h4 class="mb-4 pb-3">Sign Up</h4>
                                        <div class="form-group">
                                            <input type="text" name="logname" class="form-style" placeholder="Your NAME" id="logname" autocomplete="off">
                                            <i class="input-icon uil uil-user"></i>
                                        </div>
                                        <div class="form-group mt-2">
                                            <input type="email" name="logemail" class="form-style" placeholder="Your ID" id="logemail1" autocomplete="off">
                                            <i class="input-icon uil uil-at"></i>
                                        </div>
                                        <div class="form-group mt-2">
                                            <input type="password" name="logpass" class="form-style" placeholder="Your Password" id="logpass1" autocomplete="off">
                                            <i class="input-icon uil uil-lock-alt"></i>
                                        </div>
                                        <a href="#" class="btn mt-4">submit</a>
                                    </div>
                                </div>
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
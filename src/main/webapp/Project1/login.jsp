<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:set var="success" value="${param.success}" />

${ success}

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="js/reg.js"  defer></script>
    <%--    <script src="js/defualt.js" defer></script>--%>


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
                                        <form  id ="post1">
                                            <h4 class="mb-4 pb-3">Log In</h4>
                                            <div class="form-group">
                                                <input type="text" name="loginId" class="form-style" placeholder="Your ID" id="logemail" autocomplete="off">
                                                <i class="input-icon uil uil-at"></i>
                                            </div>
                                            <div class="form-group mt-2">
                                                <input type="password" name="loginPw" class="form-style" placeholder="Your Password" id="logpass" autocomplete="off">
                                                <i class="input-icon uil uil-lock-alt"></i>
                                            </div>
                                            <button type="submit" class="btn mt-4" onclick="post1(this.form)">Login</button>
                                        </form>


                                    </div>
                                </div>
                            </div>





                            <div class="card-back">
                                <div class="center-wrap">
                                    <div class="section text-center">
                                        <h4 class="mb-4 pb-3">Sign Up</h4>
                                        <form  name="joinForm" id ="post2">
                                            <div class="form-group">
                                                <input type="text" name="joinName" class="form-style" placeholder="Your NAME" id="logname" autocomplete="off">
                                                <i class="input-icon uil uil-user" id="name_icon"></i>
                                            </div>
                                            <div class="form-group mt-2">
                                                <input type="text" name="joinId" class="form-style" placeholder="Your ID" id="logid" autocomplete="off">
                                                <label  id ="blankText2" style="display: none"></label><br>
                                                <i class="input-icon uil uil-at" id="id_icon"></i>
                                                <input type="button" class="btn mt-4" value="중복확인" id="checkId" onclick="check_id()">
                                            </div>
                                            <div class="form-group mt-2">
                                                <input type="password" name="joinPw" class="form-style" placeholder="Your Password" id="logpass1" autocomplete="off">
                                                <i class="input-icon uil uil-lock-alt" id="pw_icon"></i>
                                            </div>
                                            <button class="btn mt-4" id="join_submit" onclick="post2(this.form)">sub</button>
                                        </form>
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

<script>
    function check_id() {
        let url = "idcheck.jsp?check_id=" + joinId.value;
        window.open(url, "check_id", "width=300, height=150, menubar=no, toolbar=no, resizeable=no, left=500px, top=300px");
    }

    window.onload = function success(){
        if("${success}" === "true"){
            history.replaceState({}, null, location.pathname);
            alert("회원가입이 성공하였습니다")

        }else if("${success}" === "false"){
            alert("회원가입이 실패하였습니다")
        }
    }


</script>

<script src="https://code.jquery.com/jquery-3.4.1.js" defer></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script type="text/javascript">
    let checkID = document.getElementById('logid');
    let checkNAME = document.getElementById('logname');
    let checkPW = document.getElementById('logpass1');
    let btn = document.getElementById('join_submit');
    let blankLabel = document.getElementById('blankText2');
    const id_icon = document.querySelector("#id_icon").style.color;
    const name_icon = document.querySelector("#name_icon").style.color;
    const pw_icon = document.querySelector("#pw_icon").style.color;
    checkID.onchange =()=> {
        $.ajax({
            type:"POST",
            url:"/test",
            data: {
                id: checkID.value,
                name: checkNAME.value,
                pw: checkPW.value,
            },

            success:function(data){
              if(!data.check2){
                  blankLabel.style.display = "inline"
                  blankLabel.innerText = "중복된 아이디입니다"

                  btn.disable=true;
              }
              else if(!data.check){
                  blankLabel.style.display = "inline"
                  blankLabel.innerText = "올바르지 않은 아이디입니다"

                  btn.disable=true;
              }

              else if(id_icon !== "red" && name_icon !== "red" && pw_icon !== "red" ){
                  blankLabel.style.display = "inline"
                  blankLabel.innerText = "올바른 아이디입니다"
                  btn.disable=false;
              }
            },
            error:function(request,status,error){

                console.log("error");
            }
        });
    }


</script>
const joinId = document.querySelector('#logid');
const joinPw = document.querySelector('#logpass1');
const joinName = document.querySelector('#logname');
const join_submit = document.getElementById("join_submit");

//정규식
// id 영문 숫자 조합 6 ~ 12자리
let idReg = /^[A-za-z][0-9a-zA-Z]{5,11}/g;
// pw 영문 숫자 조합 8 ~ 20자리 이상
let pwReg = /^[A-za-z][0-9a-zA-Z]{7,19}/g;
// name 한글만 입력가능

let nameReg = /^[ㄱ-ㅎ|가-힣]/g;
joinId.onblur = () => { //id 블러이벤트 체크
    const id_icon = document.querySelector("#id_icon");
    if (idReg.test(joinId.value)) {
        // 테스트 통과
        console.log(idReg.test(joinId.value)) //아니 왜 로그를 찍어야 값이 고정되는거지? 로그는 그냥 출력만 해주는거 아닌가;
        id_icon.style.color = 'blue';
    } else {
        // 불통과
        id_icon.style.color = 'red';
    }
}

joinPw.onblur = () => { //pw 블러이벤트 체크
    const pw_icon = document.querySelector("#pw_icon");
    if (pwReg.test(joinPw.value)) {
        console.log(pwReg.test(joinPw.value))
        pw_icon.style.color = 'blue';
    } else {
        pw_icon.style.color = 'red';
    }
}

joinName.onblur = () => { //name 블러이벤트 체크
    const name_icon = document.querySelector("#name_icon");
    if (nameReg.test(joinName.value)) {
        console.log(nameReg.test(joinName.value))
        name_icon.style.color = 'blue';
    } else {
        name_icon.style.color = 'red';
    }
}

function post1(frm){
    frm.action = "../Project1/process/loginProcess.jsp";
    frm.submit();
    return true;
}

function post2(frm){
    frm.action = "/join";
    frm.submit();
    return true;
}
join_submit.onclick = (event) => {
    event.preventDefault();
    if (idReg.test(joinId.value) && pwReg.test(joinPw.value) && nameReg.test(joinName.value)) {
        const form = document.forms.item(1)
        form.action ="/join";
        form.method ="post";
        form.submit();

    }

}
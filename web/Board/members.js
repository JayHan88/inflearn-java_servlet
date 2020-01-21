// Join.jsp에서 입력한 member info 값들을 검증하는 함수
function infoConfirm() {
    if(document.regi_form.id.value == "") {
        alert("아이디를 입력해주세요.");
        document.regi_form.id.focus();
        return;
    }

    if(document.regi_form.pw.value == "") {
        alert("패스워드를 입력해주세요.");
        document.regi_form.pw.focus();
        return;
    }

    if(document.regi_form.pw.value != document.regi_form.pw_check.value) {
        alert("패스워드가 일치하지 않습니다.");
        document.regi_form.pw_check.focus();
        return;
    }

    if(document.regi_form.name.value.length == "") {
        alert("이름은 필수 입력 사항입니다.");
        document.regi_form.name.focus();
        return;
    }

    if(document.regi_form.email.value.length == 0) {
        alert("이메일은 필수 입력 사항입니다.");
        document.regi_form.email.focus();
        return;
    }

    document.regi_form.submit();
}

function updateInfoConfirm() {
    if(document.modi_form.pw.value == "") {
        alert("패스워드를 입력해주세요.");
        document.modi_form.pw.focus();
        return;
    }

    if(document.modi_form.pw_check.value == "") {
        alert("패스워드를 입력해주세요.");
        document.modi_form.pw_check.focus();
        return;
    }

    if(document.modi_form.pw.value != document.modi_form.pw_check.value) {
        alert("패스워드가 일치하지 않습니다.");
        document.modi_form.pw_check.focus();
        return;
    }

    if(document.modi_form.email.value.length == 0) {
        alert("이메일은 필수 입력 사항입니다.");
        document.modi_form.email.focus();
        return;
    }

    document.modi_form.submit();
}
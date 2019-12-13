
function infoConfirm() {
    if(document.reg_form.id.value == "") {
        alert("아이디를 입력해주세요.");
        document.reg_form.id.focus();
        return;
    }

    if(document.reg_form.pw.value == "") {
        alert("패스워드를 입력해주세요.");
        document.reg_form.pw.focus();
        return;
    }

    if(document.reg_form.pw.value != document.reg_form.pw_check.value) {
        alert("패스워드가 일치하지 않습니다.");
        document.reg_form.pw_check.focus();
        return;
    }

    if(document.reg_form.email.value.length == 0) {
        alert("이메일은 필수 입력 사항입니다.");
        document.reg_form.email.focus();
        return;
    }

    if(document.reg_form.name.value.length == "") {
        alert("이름은 필수 입력 사항입니다.");
        document.reg_form.name.focus();
        return;
    }

    document.reg_form.submit();
}

function updateInfoConfirm() {
    if(document.mod_form.pw.value == "") {
        alert("패스워드를 입력해주세요.");
        document.mod_form.pw.focus();
        return;
    }

    if(document.mod_form.pw_check.value == "") {
        alert("패스워드를 입력해주세요.");
        document.mod_form.pw_check.focus();
        return;
    }

    if(document.mod_form.pw.value != document.mod_form.pw_check.value) {
        alert("패스워드가 일치하지 않습니다.");
        document.mod_form.pw_check.focus();
        return;
    }

    if(document.mod_form.email.value.length == 0) {
        alert("이메일은 필수 입력 사항입니다.");
        document.mod_form.email.focus();
        return;
    }

    document.mod_form.submit();
}
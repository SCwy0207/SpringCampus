//输入姓名后，调用该方法，判断用户名是否可用
function nameIsNull(){
    var name = document.getElementById("username").value;
    if(name == ""){
        alert("请输入姓名！");
        document.getElementById("username").focus();
        return false;
    }
    document.getElementById("flag").value="0";
    document.registForm.submit();
    return true;
}
//注册时检查输入项
function allIsNull(){
    var pwd = document.getElementById("password").value;
    var repwd = document.getElementById("repassword").value;
    if(pwd == ""){
        alert("请输入密码！");
        document.getElementById("password").focus();
        return false;
    }
    if(repwd == ""){
        alert("请输入确认密码！");
        document.getElementById("repassword").focus();
        return false;
    }
    if(pwd != repwd){
        alert("2次密码不一致，请重新输入！");
        document.getElementById("password").value = "";
        document.getElementById("repassword").value = "";
        document.getElementById("password").focus();
        return false;
    }
    document.getElementById("flag").value = "1";
    document.registForm.submit();
    return true;
}
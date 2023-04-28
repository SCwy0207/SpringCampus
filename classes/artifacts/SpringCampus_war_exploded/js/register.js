// 动态流星雨特效代码
window.onload = function () {
    var canvas = document.getElementById("canvas");
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;
    var context = canvas.getContext("2d");

    // 定义流星的数量
    var count = 50;
    var meteors = [];

    // 定义流星对象
    function Meteor() {
        // 定义流星的位置和速度
        this.x = Math.random() * canvas.width;
        this.y = Math.random() * canvas.height;
        this.speed = Math.random() * 5 + 1;
        this.size = Math.random() * 2 + 1;

        // 绘制流星的函数
        this.draw = function () {
            context.beginPath();
            context.moveTo(this.x, this.y);
            context.lineTo(this.x - this.speed * 3, this.y + this.speed * 3);
            context.strokeStyle = "white";
            context.lineWidth = this.size;
            context.stroke();
        };

        // 更新流星的函数
        this.update = function () {
            this.x -= this.speed;
            this.y += this.speed;
            if (this.x < -50 || this.y > canvas.height +50) { // 修改这里
                this.x = Math.random() * canvas.width+400;
                this.y = -100; // 修改这里
                this.speed = Math.random() * 5 + 1;
                this.size = Math.random() * 2 + 1;
            }
            this.draw();
        };

    }

    // 初始化流星
    for (var i = 0; i < count; i++) {
        meteors.push(new Meteor());
    }

    // 绘制和更新流星
    function loop() {
        context.clearRect(0, 0, canvas.width, canvas.height);
        for (var i = 0; i < count; i++) {
            meteors[i].update();
        }
        requestAnimationFrame(loop);
    }
    loop();
};
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
    var name = document.getElementById("username").value;
    var pwd = document.getElementById("password").value;
    var repwd = document.getElementById("repassword").value;
    if(name == ""){
        alert("请输入姓名！");
        document.getElementById("username").focus();
        return false;
    }
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
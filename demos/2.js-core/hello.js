var aaa = 1;
var zzz = "hello world";
zzz = "你好，世界";

function bbb () {
    alert("我是 bbb");
    return "hello";
}
// var bbb = function bbb () {
//     alert("我是 bbb");
// }
function fff (f) {
    f();

    var res = f();
    alert("我接受的这个函数" + res + "真的好");
    // alert("我接受的这个函数" + f() + "真的好");
}

fff(bbb);

// var ccc = bbb;
// var ddd = ccc;
// var eee = ddd;
// eee();

// alert(aaa);

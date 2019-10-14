//先主动去链接服务器
var ws = io.connect("http://localhost:3000");

//客户端上面的事件 当客户端链接服务器成功后触发的
ws.on("connect", function () {
  var nickname = prompt("请输入您的昵称");
  while (!nickname) {
    nickname = prompt('请输入您的昵称');
  }

  //把昵称传递给服务器  1、事件名称，传递值
  ws.emit('nickname', nickname);
})

//接收昵称已重复的通知
ws.on('nickname', function () {
  var nickname = prompt("您的昵称已存在");
  while (!nickname) {
    nickname = prompt("您必须要输入昵称才行");
  }

  //将新输入的昵称再给回服务器来验证是否重复
  ws.emit('nickname', nickname);
});


//通知消息  from 谁  msg 什么消息
ws.on('notice', function (from, msg) {
  addMessage(from, msg);
})



var addMessage = function (from, msg) {
  var li = document.createElement("li");
  li.innerHTML = `<span>${from}</span>：${msg}`;

  //将li追加到ul当中去
  document.getElementById("chat_conatiner").appendChild(li);

  //scrollTop 滚动条距离顶部的位置  scrollHeight 元素高度
  document.getElementById("chat").scrollTop = document.getElementById("chat").scrollHeight;
}


var send = function () {
  var content = document.getElementById("content").value;

  //添加给自己的
  addMessage("[我]", content);

  //将发送的消息发给服务器
  ws.emit('message', content);

  document.getElementById("content").value = "";

  //自动产生焦点
  document.getElementById("content").focus();
}


//清屏
document.getElementById("clear").addEventListener("click", function () {
  document.getElementById('chat_conatiner').innerHTML = "";
});

//发送数据
document.getElementById('send').addEventListener("click", function () {
  send();
})

//发送数据
document.getElementById("content").addEventListener("keyup", function (e) {
  // console.log(e.keyCode);
  // console.log(e.ctrlKey);
  if (e.ctrlKey && e.keyCode == 13) {
    send();
  }
})
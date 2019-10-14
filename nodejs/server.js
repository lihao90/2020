var express = require('express'),  //一个mvc框架
  io = require('socket.io')  //通信协议服务


//创建一个应用
var app = express();  //var food = angular.module()

//设置应用的运行的端口
var server = app.listen(3000, function () {
  console.log('服务已启动');
});


//设置监听socket服务   让socket去监听哪个服务
var ws = io.listen(server);

//检测昵称重复的方法
var checkNickname = function (nickname) {
  // nickname = "demo1";
  // var arr = [
  //   {nickname:"demo1"},
  //   {nickname:"demo2"},
  //   {nickname:"demo3"},
  //   {nickname:"demo4"},
  // ];

  //ws.sockets.sockets 这个里面存放的是所有连接的客户端
  for (var k in ws.sockets.sockets) {
    if (ws.sockets.sockets[k].nickname == nickname) {
      //如果有走进来if 说明这个人已经存在了
      return true;
    }
  }

  //这个人不存在
  return false;
}

//检测是否有用户连接上来    on绑定 emit 执行

//connection 当有客户端链接上来的时候会触发
ws.on('connection', function (client) {
  //client 链接过来的客户端用户 对象
  console.log("有人链接上来了");

  //定义一个事件，让服务器接收客户端给过来的昵称
  client.on('nickname', function (nickname) {
    if (checkNickname(nickname)) {
      //已经存在，让客户重新输入用户名
      //服务器主动给客户端
      client.emit('nickname');
    } else {
      //说明该用户不存在
      client.nickname = nickname;  //给这个人增加一个自定义属性

      //让系统通知，告诉所有人，有人加入群聊
      // client.emit('notice',"[系统]",`${client.nickname}加入群聊😂😄😅😇`);

      //执行聊天室里面的所有人
      ws.sockets.emit('notice', "[系统]", `${client.nickname}加入群聊😂😄😅😇`);
    }
  });

  //当有人离开聊天室
  client.on('disconnect', function () {
    ws.sockets.emit('notice', "[系统]", `${client.nickname}离开了聊天室😈😭`);
  });

  //接收消息的方法
  client.on('message', function (msg) {

    //通过广播方法发给所有人(client) 但是除了自己
    client.broadcast.emit('notice', `${client.nickname}`, msg);
  })


  //关于画板的

  //开始绘画的鼠标按下
  client.on('down',function(obj){
    //广播给所有人但是除了自己
    client.broadcast.emit('down', obj);
  });

  //鼠标弹起
  client.on('up',function(obj){
    //广播给所有人但是除了自己
    client.broadcast.emit('up', obj);
  });

  //移动
  client.on('move',function(obj){
    //广播给所有人但是除了自己
    client.broadcast.emit('move', obj);
  })

  //buttons
  client.on('buttons', function (obj) {
    //广播给所有人但是除了自己
    client.broadcast.emit('buttons', obj);
  })
});
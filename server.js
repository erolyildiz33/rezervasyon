

'use strict';
var app = require('express')();
var server = require('http').Server(app);
var io = require('socket.io')(server);
require('dotenv').config();

app.get('/',function (req,res) {
    res.send('Burası anasayfa');
});

var redisPort = process.env.REDIS_PORT;
var redisHost = process.env.REDIS_HOST;
var ioRedis = require('ioredis');
var redis = new ioRedis(redisPort, redisHost);
redis.subscribe('channel');


redis.on('message', function (channel, message) {
    console.log(channel);
    console.log(message);
    message  = JSON.parse(message);
    io.emit("rowupdate", message.data.message);
  });

io.on('connection',(socket)=>{

    socket.on('new_appointment_create',function () {

        io.emit('admin_appointment_list');
    })

});
server.listen(3000,function () {
    console.log("server çalışıyor...");
});
// var broadcastPort = process.env.BROADCAST_PORT;
// server.listen(broadcastPort, function () {
//     console.log('Socket server is running.');
// });

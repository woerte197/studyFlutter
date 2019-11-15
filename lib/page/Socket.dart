import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class Socket extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SocketState();
  }
}

class SocketState extends State<Socket> {
  var channel;
  var text;
  TextEditingController _controller = new TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    channel = IOWebSocketChannel.connect('ws://echo.websocket.org');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("WebSocket(内容回显)"),
          Form(
              child: TextFormField(
            controller: _controller,
            decoration: InputDecoration(labelText: "send amessage"),
          )),
          StreamBuilder(
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                text = "网络不通";
              } else {
                text = "echo${snapshot.data.toString()}";
              }
              return new Padding(
                  padding: const EdgeInsets.all(21), child: new Text(text));
            },
            stream: channel.stream,
          ),
          FlatButton(onPressed: send,child: Text("点击发送"),)
        ],
      ),

    );
  }
  void send(){
    if (_controller.text.isNotEmpty) {
      channel.sink.add(_controller.text);
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    channel.sink.close();
    super.dispose();
  }
}

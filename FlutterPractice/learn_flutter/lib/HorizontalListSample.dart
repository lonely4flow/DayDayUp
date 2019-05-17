import 'package:flutter/material.dart';

class HorizontalListSample extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("水平滚动List"),),
      body: new ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          new Container(
            width: 160.0,
            height: 200,
            color: Colors.red,
          ),
          new Container(
            width: 160.0,
            height: 200,
            color: Colors.blue,
          ),
          new Container(
            width: 160.0,
            height: 200,
            color: Colors.green,
          ),
          new Container(
            width: 160.0,
            height: 200,
            color: Colors.yellow,
          ),
          new Container(
            width: 160.0,
            height: 200,
            color: Colors.orange,
          ),
        ]
      ),
    );
  }
}
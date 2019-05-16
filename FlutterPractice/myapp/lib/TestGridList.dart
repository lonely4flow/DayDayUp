import 'package:flutter/material.dart';

class TestGridList extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: "test Grid List",
      home: new Scaffold(
        appBar: new AppBar(title: new Text("hhhhh")),
        body: new GridView.count(
          // 列数
          crossAxisCount: 3,
          children: new List.generate(100,(i){
            return new Center(
              child: new Text('item $i',style: Theme.of(context).textTheme.headline)
            );
          })
        )
      )
    );
  }
}

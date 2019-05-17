import 'package:flutter/material.dart';

class GridListSample extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("GridList"),),
      body: new GridView.count(
          crossAxisCount: 2,// 列数
          children: List.generate(100, (index){
            return new Center(
              child: new Text("item $index",style: Theme.of(context).textTheme.headline,),
            );
          }),
      ),
    );
  }
}
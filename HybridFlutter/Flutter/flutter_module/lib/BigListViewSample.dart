import 'package:flutter/material.dart';

class BigListViewSample extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    final dataList = List<String>.generate(1000, (int index){
      return "item_$index";
    });
    return new Scaffold(
      appBar: new AppBar(title: new Text("Big List")),
      body: new ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: dataList.length,
        itemBuilder: (context,index){
          return ListTile(
            title: new Text("${dataList[index]}")
          );
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';

class TestDismissible extends StatelessWidget {
final items = List<String>.generate(100,(i) => "item-$i");
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Test Dismissible",
      home: new Scaffold(
        appBar: new AppBar(title: new Text("=====")),
        body: new ListView.builder(
          itemCount:items.length,
          itemBuilder: (context,index){
              final item = items[index];
            return new Dismissible(
              key: new Key(item),
              onDismissed: (direction){
                items.removeAt(index);
                Scaffold.of(context).showSnackBar(
                  new SnackBar(content: new Text("$item dismissed")));
              },
              background: new Container(color: Colors.red),
              child: new ListTile(title: new Text('$item'))

            );
          }
        )
      )
    );
  }
}

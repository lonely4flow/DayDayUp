import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';

class TestListView extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    final title = 'Basic List';
    final items = new List<String>.generate(10000,(i) => "Item $i");

    final horList = new ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        new Container(
          width: 160.0,
          color: Colors.red
        ),
        new Container(
          width: 160.0,
          color: Colors.blue
        ),
        new Container(
          width: 160.0,
          color: Colors.green
        ),
        new Container(
          width: 160.0,
          color: Colors.yellow
        ),
        new Container(
          width: 160.0,
          color: Colors.orange
        )
      ]
    );

    final verList = new ListView(
      // scrollDirection: Axis.horizontal,
      children: <Widget>[
        new ListTile(
          leading: new Icon(Icons.map),
          title: new Text('Map')
        ),
        new ListTile(
          leading: new Icon(Icons.photo),
          title: new Text('Album')
        ),
        new ListTile(
          leading: new Icon(Icons.phone),
          title: new Text('Photo')
        )
      ]
    );

    final bigList = new ListView.builder(
      itemCount: items.length,
      itemBuilder: (context,index){
        return new ListTile(
          title: new Text('${items[index]}')
        );
      }
    );

    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(title: new Text(title)),
        // body: horList
        // body: verList
        body: bigList
      )
    );
  }
}

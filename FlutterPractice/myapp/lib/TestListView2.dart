import 'package:flutter/material.dart';

abstract class ListItem {}

class HeadingItem implements ListItem {
    final String heading;

    HeadingItem(this.heading);
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender,this.body);
}

class TestListView2 extends StatelessWidget {
final items =  new List<ListItem>.generate(1000, (i) => i % 6 == 0
 ?  new HeadingItem("Heading $i")
 :  new MessageItem("Sender $i","Message body $i"));

  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: '复杂ListView',
      home: new Scaffold(
        appBar: new AppBar(title: new Text("首页")),
        body: new ListView.builder(
          itemCount:items.length,
          itemBuilder:(context,index){
            final item = items[index];
            if(item is HeadingItem){
              return ListTile(
                title: new Text(item.heading,style: Theme.of(context).textTheme.headline)
              );
            }else if(item is MessageItem){
              return new ListTile(
                title: new Text(item.sender),
                subtitle: new Text(item.body),
              );
            }

          }
        )
      )
    );
  }
}

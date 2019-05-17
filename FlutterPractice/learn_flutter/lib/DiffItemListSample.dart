import 'package:flutter/material.dart';

class DiffItemListSample extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    final items = new List<ListItem>.generate(1000, (i){
      return i % 6 == 0 ? new HeadingItem("Heading $i") : new MessageItem("Sender $i", "Message body $i");
    });
    return new Scaffold(
      appBar: new AppBar(title: new Text("Mixed List"),),
      body: new ListView.builder(
        itemCount: items.length,
        itemBuilder: (context,index){
          final item = items[index];
          if(item is HeadingItem){
            return new ListTile(
              title: new Text(item.heading)
            );
          }else if(item is MessageItem){
            return new ListTile(
              title: new Text(item.sender),
              subtitle: new Text(item.body),
            );
          }
        },
      ),
    );
  }
}

abstract class ListItem {}

// A ListItem that contains data to display a heading
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

// A ListItem that contains data to display a message
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}
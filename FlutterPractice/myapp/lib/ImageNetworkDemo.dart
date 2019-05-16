import 'package:flutter/material.dart';

class ImageNetworkDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var title = 'CachedNetworkImage Demo';

    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new Image.network(
          'https://upload.jianshu.io/users/upload_avatars/1605558/88241938-9a16-4bb0-abef-9e20a9e73cea.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240',
        ),
       ),
    );
  }
}

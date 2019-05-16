import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class TransparentImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var title = 'TransparentImage Demo';

    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new Stack(
          children: <Widget>[
            new Center(child: new CircularProgressIndicator()),
            new Center(
              child: new FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image:
                'https://upload.jianshu.io/users/upload_avatars/1605558/88241938-9a16-4bb0-abef-9e20a9e73cea.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240',
              )
            )
          ]
        )
       ),
    );
 }
}

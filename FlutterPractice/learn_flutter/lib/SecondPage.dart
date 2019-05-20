import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Second Screen"),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: new Text('Go back!'),
        ),
      ),
    );
  }
}
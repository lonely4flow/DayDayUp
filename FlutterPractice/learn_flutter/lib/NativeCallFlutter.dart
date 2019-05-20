import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class NativeCallFlutter extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return new _NativeCallFlutterState();
  }
}

class _NativeCallFlutterState extends State<NativeCallFlutter>
{
  static const EventChannel eventChannel =  EventChannel("samples.flutter.io/nativeCallFlutter");
  String _changingStatus = "init...";
  @override
  void initState() {
    eventChannel.receiveBroadcastStream().listen(_onEvent,onError:_onError);
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    return new Scaffold(
      appBar: new AppBar(title: new Text("iOS原生调用Flutter"),),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Text(_changingStatus),
        ],
      ),
    );
  }
  void _onEvent(Object event)
  {
    setState(() {
      _changingStatus = event;
      print("{$event}");
    });
  }

  void _onError(Object error)
  {
    setState(() {
      _changingStatus = "${error}";
    });
  }

}
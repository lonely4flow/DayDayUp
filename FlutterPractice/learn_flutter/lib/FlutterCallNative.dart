import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class FlutterCallNative extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return new _FlutterCallNtiveState();
  }
}

class _FlutterCallNtiveState extends State<FlutterCallNative>
{
  static const platform = const MethodChannel("samples.flutter.io/flutterCallNative");

  String _batteryLevel = "Unknown battery level.";
  String _msg = "no msg";

  @override
  Widget build(BuildContext context)
  {
    return new Material(
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new RaisedButton(
              child: new Text("Get Battery Level"),
              onPressed: _getBatteryLevel,
            ),
            new Text(_batteryLevel),
            new RaisedButton(
              child: new Text("Get Data From Native withParams"),
              onPressed: _getDataFromNative,
            ),
            new Text(_msg),
          ],
        ),
      ),
    );
  }

  Future<Null> _getDataFromNative() async
  {
    String msg;
    try{
      final Map result = await platform.invokeMethod("updateUserInfo",{"id":10,"name":"Kusina"});
      msg = "Battery level at $result % .";
    } on PlatformException catch(e) {
      msg = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _msg = msg;
    });
  }
  Future<Null> _getBatteryLevel() async
  {
    String batteryLevel;
    try{
      final int result = await platform.invokeMethod("getBatteryLevel");
      batteryLevel = "Battery level at $result % .";
    } on PlatformException catch(e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }
}
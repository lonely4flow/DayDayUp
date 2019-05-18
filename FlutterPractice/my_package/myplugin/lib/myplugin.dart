import 'dart:async';

import 'package:flutter/services.dart';

class Myplugin {
  static const MethodChannel _channel =
      const MethodChannel('myplugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}

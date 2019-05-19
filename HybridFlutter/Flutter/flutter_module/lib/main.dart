import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'simple_page_widgets.dart';
import 'package:flutter/services.dart';
typedef void NativeCallBack(Object event);
Map<String,NativeCallBack> callbakcs = {};

 const EventChannel eventChannel = const EventChannel("samples.flutter.io/nativeCallFlutter");
 const MethodChannel platform = const MethodChannel("samples.flutter.io/flutterCallNative");


void main() {
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  void _onEvent(Object event)
  {
    if(event is Map){
      String name = event['name'];
      if(callbakcs[name] != null){
        callbakcs[name](event);
      }
    }

  }

  void _onError(Object error)
  {
    setState(() {
     // _changingStatus = "${error}";
    });
  }
  @override
  void initState() {
    // 接收Native调用
    eventChannel.receiveBroadcastStream().listen(_onEvent,onError:_onError);
    super.initState();

    FlutterBoost.singleton.registerPageBuilders({
      'first': (pageName, params, _) => FirstRouteWidget(),
      'second': (pageName, params, _) => SecondRouteWidget(),
      'tab': (pageName, params, _) => TabRouteWidget(),
      'flutterFragment': (pageName, params, _) => FragmentRouteWidget(params),

      ///可以在native层通过 getContainerParams 来传递参数
      'flutterPage': (pageName, params, _) {
        print("flutterPage params:$params");

        return FlutterRouteWidget();
      },
    });
    FlutterBoost.handleOnStartPage();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Boost example',
        builder: FlutterBoost.init(postPush: _onRoutePushed),
        home: Container());
  }

  void _onRoutePushed(
      String pageName, String uniqueId, Map params, Route route, Future _) {
//    List<OverlayEntry> newEntries = route.overlayEntries
//        .map((OverlayEntry entry) => OverlayEntry(
//            builder: (BuildContext context) {
//              final pageWidget = entry.builder(context);
//              return Stack(
//                children: <Widget>[
//                  pageWidget,
//                  Positioned(
//                    child: Text(
//                      "pageName:$pageName\npageWidget:${pageWidget.toStringShort()}",
//                      style: TextStyle(fontSize: 12.0, color: Colors.red),
//                    ),
//                    left: 8.0,
//                    top: 8.0,
//                  )
//                ],
//              );
//            },
//            opaque: entry.opaque,
//            maintainState: entry.maintainState))
//        .toList(growable: true);
//
//    route.overlayEntries.clear();
//    route.overlayEntries.addAll(newEntries);
  }
}

import 'dart:ui' as ui; // 调用window拿到route判断跳转哪个界面
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_module/RandomWords.dart';
//
//
// void main() => runApp(_widgetForRoute(ui.window.defaultRouteName));
//
// // 根据iOS端传来的route跳转不同界面
// Widget _widgetForRoute(String route) {
//   switch (route) {
//     case 'myApp':
//       return new MyApp();
//     case 'home':
//       return new HomePage();
//     default:
//       return Center(
//         child: Text('Unknown route: $route', textDirection: TextDirection.ltr),
//       );
//   }
// }
//
// class MyApp extends StatelessWidget {
//
//   Widget _home(BuildContext context) {
//     return new MyHomePage(title: 'Flutter 3Demo Home Page2');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'Flutter Demo',
//       theme: new ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       routes: <String, WidgetBuilder>{
//         "/home":(BuildContext context) => new HomePage(),
//       },
//       home: _home(context),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => new _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   // 创建一个给native的channel (类似iOS的通知）
//   static const methodChannel = const MethodChannel('com.pages.your/native_get');
//
//
//   _iOSPushToVC() async {
//     await methodChannel.invokeMethod('iOSFlutter', '参数');
//   }
//
//   _iOSPushToVC1() async {
//     Map<String, dynamic> map = {"code": "200", "data":[1,2,3]};
//     await methodChannel.invokeMethod('iOSFlutter1', map);
//   }
//
//   _iOSPushToVC2() async {
//     dynamic result;
//     try {
//       result = await methodChannel.invokeMethod('iOSFlutter2');
//     } on PlatformException {
//       result = "error";
//     }
//     if (result is String) {
//       print(result);
//       showModalBottomSheet(context: context, builder: (BuildContext context) {
//         return new Container(
//           child: new Center(
//             child: new Text(result, style: new TextStyle(color: Colors.brown), textAlign: TextAlign.center,),
//           ),
//           height: 40.0,
//         );
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: new Center(
//         child: new Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             new FlatButton(onPressed: () {
//               _iOSPushToVC();
//             }, child: new Text("跳转ios新界面，参数是字符串")),
//             new FlatButton(onPressed: () {
//               _iOSPushToVC1();
//             }, child: new Text("传参，参数是map，看log")),
//             new FlatButton(onPressed: () {
//               _iOSPushToVC2();
//             }, child: new Text("接收客户端相关内容")),
//           ],
//         ),
//       ),
//     );
//   }
// }
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    ///register page widget builders,the key is pageName
    FlutterBoost.singleton.registerPageBuilders({
      'sample://firstPage': (pageName, params, _) => HomePage(),
      'sample://secondPage': (pageName, params, _) => SecondRouteWidget(),
    });

    ///query current top page and load it
    FlutterBoost.handleOnStartPage();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'Flutter Boost example',
      builder: FlutterBoost.init(), ///init container manager
    //  home: Container());
     home: new Scaffold(
      appBar: new AppBar(
        title: new Text('Welcome to Flutter'),
      ),
      body: new Center(
        //child: new Text('Hello World'),
        child: new RandomWords(),
      ),
    ));
}

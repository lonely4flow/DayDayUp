import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'main.dart';
import 'package:flutter/services.dart';

class FirstRouteWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new _FirstRouteWidgetState();
  }
}
class _FirstRouteWidgetState extends State<FirstRouteWidget>{

  String _changingStatus = "init...";
 String _batteryLevel = "leve";
 String _userInfo = "";
 bool _isShowingNav = false;

  @override
  void initState() {
    // 接收Native调用
    //callbakcs["isShowNavBar"]= _responseNative;

    super.initState();
//    _getIsNavShow();
  }
//  void _responseNative(Object event){
//      setState(() {
//        _changingStatus  = "${event}";
//      });
//  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
        leading: IconButton(icon: Icon(Icons.arrow_back),
          onPressed:(){
            FlutterBoost.singleton.closePageForContext(context);
          } ,
        ),
      ),
      body: Column(
        children: [
          new RaisedButton(
          child: Text('Flutter call Native'),
          onPressed: _getBatteryLevel
        ),
        new Text(_batteryLevel),
        new RaisedButton(
        child: Text('Flutter call updateUserInfo'),
        onPressed: _updateUserInfo
      ),
          new Text(_userInfo),
          new RaisedButton(
              child: Text(_isShowingNav ? 'hideNav222' : "showNav222"),
              onPressed: _showOrHideNav
          ),
          new RaisedButton(
              child: Text('hideNav'),
              onPressed: (){
                platform.invokeMethod("hideNav");
              }
          ),

          new RaisedButton(
          child: Text('Open second 3333'),
          onPressed: () {
            FlutterBoost.singleton.openPage("second", {}, animated: true);
          },
        ),
        new Text(_changingStatus)
      ]
      ),
    );
  }


  Future<Null> _getIsNavShow() async
  {

    bool result = false;
    try{
      result = await platform.invokeMethod("isShowNav");
    } on PlatformException catch(e) {
      result = false;
    }
//    Scaffold
//        .of(context)
//        .showSnackBar(new SnackBar(content: new Text("$result")));
    setState(() {
      _isShowingNav = result;
    });
  }
  Future<Null> _showOrHideNav() async
  {

    bool result = _isShowingNav;
    try{
      String name = _isShowingNav ? "hideNav" : "showNav";
      result = await platform.invokeMethod(name,false);
    } on PlatformException catch(e) {

    }

    setState(() {
      _isShowingNav = result;
    });
  }

  Future<Null> _getBatteryLevel() async
  {
    String batteryLevel;
    try{
      final String result = await platform.invokeMethod("getBatteryLevel");
      batteryLevel = "Battery level at $result % .";
    } on PlatformException catch(e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  Future<Null>  _updateUserInfo() async
  {
    String msg;
    try{
      final Map result = await platform.invokeMethod("updateUserInfo",{"id":10,"name":"Kusina"});
      msg = "Battery level at $result % .";
    } on PlatformException catch(e) {
      msg = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _userInfo = msg;
    });
  }
}

class SecondRouteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
            FlutterBoost.singleton.closePageForContext(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

class TabRouteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tab Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            FlutterBoost.singleton.openPage("second", {}, animated: true);
          },
          child: Text('Open second route'),
        ),
      ),
    );
  }
}

class FlutterRouteWidget extends StatelessWidget {
  final String message;

  FlutterRouteWidget({this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter_boost_example'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 80.0),
            child: Text(
              message ?? "This is a flutter activity",
              style: TextStyle(fontSize: 28.0, color: Colors.blue),
            ),
            alignment: AlignmentDirectional.center,
          ),
          Expanded(child: Container()),
          InkWell(
            child: Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(8.0),
                color: Colors.yellow,
                child: Text(
                  'open native page',
                  style: TextStyle(fontSize: 22.0, color: Colors.black),
                )),

            ///后面的参数会在native的IPlatform.startActivity方法回调中拼接到url的query部分。
            ///例如：sample://nativePage?aaa=bbb
            onTap: () =>
                FlutterBoost.singleton.openPage("sample://nativePage", {
                  "query": {"aaa": "bbb"}
                }),
          ),
          InkWell(
            child: Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(8.0),
                color: Colors.yellow,
                child: Text(
                  'open flutter page',
                  style: TextStyle(fontSize: 22.0, color: Colors.black),
                )),

            ///后面的参数会在native的IPlatform.startActivity方法回调中拼接到url的query部分。
            ///例如：sample://nativePage?aaa=bbb
            onTap: () =>
                FlutterBoost.singleton.openPage("sample://flutterPage", {
                  "query": {"aaa": "bbb"}
                }),
          ),
          InkWell(
            child: Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(8.0),
                color: Colors.yellow,
                child: Text(
                  'push flutter widget',
                  style: TextStyle(fontSize: 22.0, color: Colors.black),
                )),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => PushWidget()));
            },
          ),
          InkWell(
            child: Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 80.0),
                color: Colors.yellow,
                child: Text(
                  'open flutter fragment page',
                  style: TextStyle(fontSize: 22.0, color: Colors.black),
                )),
            onTap: () => FlutterBoost.singleton
                .openPage("sample://flutterFragmentPage", {}),
          )
        ],
      ),
    );
  }
}

class FragmentRouteWidget extends StatelessWidget {
  final Map params;

  FragmentRouteWidget(this.params);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter_boost_example'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 80.0),
            child: Text(
              "This is a flutter fragment",
              style: TextStyle(fontSize: 28.0, color: Colors.blue),
            ),
            alignment: AlignmentDirectional.center,
          ),
          Container(
            margin: const EdgeInsets.only(top: 32.0),
            child: Text(
              params['tag'] ?? '',
              style: TextStyle(fontSize: 28.0, color: Colors.red),
            ),
            alignment: AlignmentDirectional.center,
          ),
          Expanded(child: Container()),
          InkWell(
            child: Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(8.0),
                color: Colors.yellow,
                child: Text(
                  'open native page',
                  style: TextStyle(fontSize: 22.0, color: Colors.black),
                )),
            onTap: () =>
                FlutterBoost.singleton.openPage("sample://nativePage", {}),
          ),
          InkWell(
            child: Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(8.0),
                color: Colors.yellow,
                child: Text(
                  'open flutter page',
                  style: TextStyle(fontSize: 22.0, color: Colors.black),
                )),
            onTap: () =>
                FlutterBoost.singleton.openPage("sample://flutterPage", {}),
          ),
          InkWell(
            child: Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 80.0),
                color: Colors.yellow,
                child: Text(
                  'open flutter fragment page',
                  style: TextStyle(fontSize: 22.0, color: Colors.black),
                )),
            onTap: () => FlutterBoost.singleton
                .openPage("sample://flutterFragmentPage", {}),
          )
        ],
      ),
    );
  }
}

class PushWidget extends StatefulWidget {
  @override
  _PushWidgetState createState() => _PushWidgetState();
}

class _PushWidgetState extends State<PushWidget> {
  VoidCallback _backPressedListenerUnsub;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

//    if (_backPressedListenerUnsub == null) {
//      _backPressedListenerUnsub =
//          BoostContainer.of(context).addBackPressedListener(() {
//        if (BoostContainer.of(context).onstage &&
//            ModalRoute.of(context).isCurrent) {
//          Navigator.pop(context);
//        }
//      });
//    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _backPressedListenerUnsub?.call();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterRouteWidget(message:"Pushed Widget");
  }
}

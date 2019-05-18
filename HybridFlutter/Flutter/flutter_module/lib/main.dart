
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_boost/flutter_boost.dart';

import 'chaoyue.dart';
void main() => runApp(_BoostWidget());

class _BoostWidget extends StatefulWidget{

  @override
  _BoostState createState() => _BoostState();

}

class _BoostState extends State<_BoostWidget>{

  @override
  void initState() {
    super.initState();
    FlutterBoost.singleton.registerPageBuilders({
      'jingyi':(pageName, params, _) => JingyiWidget(),
      'route1':(pageName, params, _){
        print("myroute1 params:$params");

        return MyFirstWidget();
      }

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

}

void _onRoutePushed(
    String pageName, String uniqueId, Map params, Route route, Future _) {
}


Widget _widgetForRoute(String route) {
  switch (route) {
    case 'route1':
      return MyApp();
    default:
      return MyApp();
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              "超越小妹妹",
            ),
            centerTitle: true,
          ),
          body: ListItemPage()
      ),
    );
  }
}



class ListItemPage extends StatelessWidget {
  List<String> items = new List<String>.generate(5, (i) => "item = $i");

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _buildRow();
        });
  }

  Widget _buildRow() {
    return Container(
      padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0),
      child: Column(
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Image.network(
            'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1552992489576&di=d328372c559f27061eec1b61b53884e2&imgtype='
                '0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201810%2F05%2F20181005012624_hkfqf.jpg',
            height: 220,
            fit: BoxFit.fitWidth,
          ),
          new Text(
            "这是超越小妹妹，有人说她是锦鲤，确实是个漂亮的小姑娘，其实她是我的女朋友你们都不知道",
          )
        ],
      ),
    );
  }
}





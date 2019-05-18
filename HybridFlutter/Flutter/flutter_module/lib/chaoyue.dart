
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
class MyFirstWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
          return _buildRow(context);
        });
  }

  Widget _buildRow(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0),
      child: Column(
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          new GestureDetector(
            onTap: (){
              print("IMAGE_ON_TAP");
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => JingyiWidget()));
            },
            child: Image.network(
              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1552992489576&di=d328372c559f27061eec1b61b53884e2&imgtype='
                  '0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201810%2F05%2F20181005012624_hkfqf.jpg',
              height: 220,
              fit: BoxFit.fitWidth,
            ),
          ),

          new Text(
            "这是超越小妹妹，可爱的妹子，我的前任女友",
          )
        ],
      ),
    );
  }

}

class JingyiWidget extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "JINGYI",
      theme: ThemeData(
        primarySwatch: Colors.red
      ),

      home: Scaffold(
        appBar: AppBar(
          title: Text('我的婧祎'),
          centerTitle: true,
        ),
        
        body: _buildJingyi(),
      ),
    );
  }

  Widget _buildJingyi(){
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_'
              '10000&sec=1555859441074&di=76839e0b265d78823775f282d6e93f42&imgtype=0&'
              'src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201801%2F26%2F20180126005333_T835x.jpeg',
          height: 300),
        ],
      ),
    );
  }



}




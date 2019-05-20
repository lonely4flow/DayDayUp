import 'package:flutter/material.dart';

import 'AnimatedListSample.dart';
import 'BasicAppBarSample.dart';
import 'BigListViewSample.dart';
import 'GridListSample.dart';
import 'DiffItemListSample.dart';
import 'ExpansionTileSample.dart';

import 'HorizontalListSample.dart';
import 'MinePage.dart';
import 'PrefferedSizeListSample.dart';
import 'TabbedAppBarSample.dart';
import 'main.dart';


const List<ItemModel> dataList = const <ItemModel>[
  const ItemModel(title:"基本Basic-BasicAppBarSample",nextVC: "BasicAppBarSample"),
  const ItemModel(title: "PrefferedSizeListSample",nextVC: "PrefferedSizeListSample"),
  const ItemModel(title: "AnimatedListSample",nextVC: "AnimatedListSample"),
  const ItemModel(title: "ExpansionTileSample",nextVC: "ExpansionTileSample"),
  const ItemModel(title: "TabbedAppBarSample",nextVC: "TabbedAppBarSample"),
  const ItemModel(title: "BigListViewSample",nextVC: "BigListViewSample"),
  const ItemModel(title: "DiffItemListSample",nextVC: "DiffItemListSample"),
  const ItemModel(title: "HorizontalListSample",nextVC: "HorizontalListSample"),
  const ItemModel(title: "GridListSample",nextVC: "GridListSample"),
  const ItemModel(title: "MinePage",nextVC: "MinePage"),



];

class ItemModel {
  final String title;
  final String nextVC;

  const ItemModel({this.title,this.nextVC});

}

class TestFlutterJumpFlutter extends StatelessWidget {


  void _pushToNext(BuildContext context,ItemModel item) async {

    platform.invokeMethod("disEnableGesture");
    final dynamic result = await Navigator.of(context).push(new MaterialPageRoute(builder:(_){
      if("BasicAppBarSample" == item.nextVC){
        return new BasicAppBarSample();
      }else if("PrefferedSizeListSample" == item.nextVC){
        return new PrefferedSizeListSample();
      }else if("AnimatedListSample" == item.nextVC){
        return new AnimatedListSample();
      }else if("ExpansionTileSample" == item.nextVC){
        return new ExpansionTileSample();
      }else if("TabbedAppBarSample" == item.nextVC){
        return new TabbedAppBarSample();
      }else if("BigListViewSample" == item.nextVC){
        return new BigListViewSample();
      }else if("DiffItemListSample" == item.nextVC){
        return new DiffItemListSample();
      }else if("HorizontalListSample" == item.nextVC){
        return new HorizontalListSample();
      }else if("GridListSample" == item.nextVC){
        return new GridListSample();
      }else if("MinePage" == item.nextVC){
        return new MinePage();
      }


    }));
    platform.invokeMethod("enableGesture");


  }
  @override
  Widget build(BuildContext context) {


    final tiles = dataList.map((item){
      return new ListTile(
        title: new Text(item.title),
        onTap: (){
          _pushToNext(context, item);
        },
      );
    }).toList();

    final divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();

    final listView = new ListView(
        children:divided
    );

    final listView2 = new ListView(
        children: <Widget>[
          new ListTile(
              title: new Text(dataList.first.title)
          )
        ]
    );
    return new Scaffold(
        appBar: new AppBar(title: new Text("功能列表")),
        body: listView
    );

  }
}
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

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

class TestListView extends StatelessWidget {


  void _pushToNext(BuildContext context,ItemModel item){

    FlutterBoost.singleton.openPage(item.nextVC, {}, animated: true);
  }
  @override
  Widget build(BuildContext context) {

    FlutterBoost.singleton.registerPageBuilders({
      'BasicAppBarSample':(pageName,params,_) => BasicAppBarSample(),
      'PrefferedSizeListSample':(pageName,params,_) => PrefferedSizeListSample(),
      'AnimatedListSample':(pageName,params,_) => AnimatedListSample(),
      'ExpansionTileSample':(pageName,params,_) => ExpansionTileSample(),
      'TabbedAppBarSample':(pageName,params,_) => TabbedAppBarSample(),
      'BigListViewSample':(pageName,params,_) => BigListViewSample(),
      'DiffItemListSample':(pageName,params,_) => DiffItemListSample(),
      'HorizontalListSample':(pageName,params,_) => HorizontalListSample(),
      'GridListSample':(pageName,params,_) => GridListSample(),
      'MinePage':(pageName,params,_) => MinePage(),
    });

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


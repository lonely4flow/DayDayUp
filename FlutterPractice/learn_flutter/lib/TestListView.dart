import 'package:flutter/material.dart';
import 'package:learn_flutter/BasicAppBarSample.dart';
import 'package:learn_flutter/SecondPage.dart';
import 'package:learn_flutter/PrefferedSizeListSample.dart';
import 'package:learn_flutter/AnimatedListSample.dart';

import 'BigListViewSample.dart';
import 'CridListSample.dart';
import 'DiffItemListSample.dart';
import 'ExpansionTileSample.dart';
import 'FlutterCallNative.dart';
import 'HorizontalListSample.dart';
import 'MinePage.dart';
import 'NativeCallFlutter.dart';
import 'TabbedAppBarSample.dart';


const List<ItemModel> dataList = const <ItemModel>[
const ItemModel(title:"SecondPage",nextVC: "/aa"),
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
const ItemModel(title: "FlutterCallNative",nextVC: "FlutterCallNative"),
const ItemModel(title: "NativeCallFlutter",nextVC: "NativeCallFlutter"),


];

class ItemModel {
  final String title;
  final String nextVC;

  const ItemModel({this.title,this.nextVC});

}

class TestListView extends StatelessWidget {



  void _pushToNext(BuildContext context,ItemModel item){
    Navigator.of(context).push(new MaterialPageRoute(builder:(_){
      if('/aa' == item.nextVC){
        return new SecondPage();
      }else if("BasicAppBarSample" == item.nextVC){
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
      }else if("FlutterCallNative" == item.nextVC){
        return new FlutterCallNative();
      }else if("NativeCallFlutter" == item.nextVC){
        return new NativeCallFlutter();
      }


    }));
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


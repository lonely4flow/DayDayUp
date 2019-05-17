import 'package:flutter/material.dart';
import 'package:fultter/foundation.dart';

class TestAnimatedList extends StatefulWidget {
  @override
  _TestAnimatedListState createState() => new _TestAnimatedListState();
}

class _TestAnimatedListState extends State<TestAnimatedList> {
  final GlobalKey<AnimatedListState> _listKey = new GlobalKey<AnimatedListState>();
  ListModel<int> _list;
  int _selectedItem;
  int _nextItem;

  @override
  void initState() {
    super.initState();
    _list = new ListModel<int>(
      listKey: _listKey,
      initialItems: <int>[0,1,2],
      removedItemBuilder: _buildRemoveedItem
    );
    _nextItem = 3;
  }

  Widget _buildItem(BuildContext context,int index, Animation<double> animation){
    return CardItem(
      animation: animation,
      item:_list[index],
      selected: _selectedItem == _list[index],
      onTap: (){
        setState((){
          _selectedItem = _selectedItem == _list[index] ? null : _list[index];
        });
      }
    );
  }
}

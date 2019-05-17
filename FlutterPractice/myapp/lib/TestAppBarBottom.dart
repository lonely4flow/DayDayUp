import 'package:flutter/material.dart';

class TestAppBarBottom extends StatefulWidget {
  @override
  _AppBarBottomSampleState createState() => _AppBarBottomSampleState();
}

class _AppBarBottomSampleState extends State<TestAppBarBottom>  with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = new TabController(vsync: this, length: choices.length);
  }

  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }

  void _nextPage(int delta){
    final int newIndex = _tabController.index + delta;
    if(newIndex < 0 || newIndex >= _tabController.length){
      return ;
    }
    _tabController.animateTo(newIndex);
  }

  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('AppBar Bottom Widget'),
          leading: new IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: (){_nextPage(-1);}
          ),
          actions: <Widget>[
            new IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: (){_nextPage(1);}
            )
          ],
          bottom: new PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            child: new Theme(
              data: Theme.of(context).copyWith(accentColor: Colors.white),
              child: new Container(
                height: 48.0,
                alignment: Alignment.center,
                child: new TabPageSelector(controller: _tabController)
              )
            )
          )
        ),
        body: new TabBarView(
          controller: _tabController,
          children: choices.map((Choice choice){
            return new Padding(
              padding: const EdgeInsets.all(16.0),
              child: new ChoiceCard(choice: choice)
            );
          }).toList()
        )
      )
    );
  }
}

class Choice {
  const Choice({this.title,this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title:'car',icon: Icons.directions_car),
  const Choice(title:'bicycle', icon:Icons.directions_bike),
  const Choice(title:'boad',icon: Icons.directions_boat),
  const Choice(title:'bus',icon: Icons.directions_bus),
  const Choice(title:'walk',icon: Icons.directions_walk)
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key,this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context){
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Card(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(choice.icon, size: 128.0, color: textStyle.color),
            new Text(choice.title,style: textStyle)
          ]
        )
      )
    );
  }
}

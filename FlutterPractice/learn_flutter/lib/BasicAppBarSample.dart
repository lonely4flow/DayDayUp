import 'package:flutter/material.dart';

class BasicAppBarSample extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new _BasicAppBarSampleState();
  }
}

class _BasicAppBarSampleState extends State<BasicAppBarSample> {
  Choice _selectedChoice = choices.first;

  void _select(Choice choice){
    setState(() {
      _selectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {

    final titleItems = choices.map((choice){
      return new IconButton(
          icon: new Icon(choice.icon),
          onPressed: (){
            setState(() {
              _selectedChoice = choice;
            });
          });
    }).toList();
    final titleItems2 = <Widget>[
      new IconButton(
        icon: new Icon(choices[0].icon),
        onPressed: (){
          setState(() {
            _selectedChoice = choices.first;
          });
        },
      ),
      new IconButton(
        icon: new Icon(choices[1].icon),
        onPressed: (){
          setState(() {
            _selectedChoice = choices[1];
          });
        },
      ),
      new PopupMenuButton<Choice>(
        onSelected: _select,
        itemBuilder: (BuildContext context){
          return choices.skip(2).map((Choice choice){
            return PopupMenuItem<Choice>(
              value: choice,
              child: new Text(choice.title),
//              child: new Icon(choice.icon),
            );
          }).toList();
        },
      )
    ];

//    return new MaterialApp(
//      home: new Scaffold(
//        appBar: new AppBar(
//            title: const Text('Basic AppBar'),
//            actions: titleItems2
//        ),
//        body: new Padding(
//          padding: const EdgeInsets.all(16.0),
//          child: new ChoiceCard(choice: _selectedChoice)
//        ),
//      )
//    );
    return new Scaffold(
      appBar: new AppBar(
          title: const Text('Basic AppBar'),
          actions: titleItems2
      ),
      body: new Padding(
          padding: const EdgeInsets.all(16.0),
          child: new ChoiceCard(choice: _selectedChoice)
      ),
    );
  }
}


class ChoiceCard extends StatelessWidget
{
    final Choice choice;
    const ChoiceCard({Key key,this.choice}) : super(key: key);

    @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Card(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(choice.icon,size: 128.0,color: textStyle.color),
            new Text(choice.title,style: textStyle,)
          ],
        )
      ),
    );
  }
}

class Choice {
  final String title;
  final IconData icon;

  const Choice({this.title,this.icon});
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car',icon: Icons.directions_car),
  const Choice(title: 'Bicycle',icon: Icons.directions_bike),
  const Choice(title: 'Boad',icon: Icons.directions_boat),
  const Choice(title: 'Bus',icon: Icons.directions_bus),
  const Choice(title: 'Train',icon: Icons.directions_railway),
  const Choice(title: 'Walk',icon: Icons.directions_walk),
];
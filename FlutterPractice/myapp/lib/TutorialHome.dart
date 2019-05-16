import 'package:flutter/material.dart';

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: new Text('HHHH title'),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.search),
              tooltip: 'Search',
              onPressed: null
            )
        ]
      ),
      body: new Center(
        child: new Text('hello body')
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Add',
        child: new Icon(Icons.add),
        onPressed: null
      )
    );
  }
}


//
// class MyButton extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context){
//     onTap: (){
//       print('MyButton was tapped!');
//     },
//     child: new Container(
//       height: 36.0,
//       padding: const EdgeInsets.all(8.0),
//       margin: const EdgeInsets.symmetric(horizontal: 8.0),
//       decoration: new BoxDecoration(
//         borderRadius: new BorderRadius.circular(5.0),
//         color: Colors.lightGreen[500],
//       ),
//       child: new Center(
//         child: new Text('Engage')
//       )
//     )
//   }
// }
//
// class Counter extends StatefulWidget {
//   @override
//   _CounterState createState() => new _CounterState();
// }
//
// class _CounterState extends State<Counter> {
//     int _counter = 0;
//
//     void _increment(){
//       setState((){
//         _counter++;
//       });
//
//       @override
//       Widget build(BuildContext context){
//         return new Row(
//           children: <Widget>[
//             new CounterIncrementor(
//               onPressed: _increment,
//             ),
//             new CounterDisplay(count: _counter)
//           ]
//         );
//       }
//     }
// }
//
// class CounterDisplay extends StatelessWidget {
//   CounterDisplay({this.count});
//   final int count;
//
//   @override
//   Widget build(BuildContext context){
//     return new Text('Count: $count');
//   }
// }
//
// class CounterIncrementor extends StatelessWidget {
//   CounterIncrementor({this.onPressed});
//   final VoidCallback onPressed;
//
//   @override
//   Widget build(BuildContext context){
//     return new RaisedButton(
//       onPressed: onPressed,
//       child: new Text('Increment')
//     )
//   }
// }

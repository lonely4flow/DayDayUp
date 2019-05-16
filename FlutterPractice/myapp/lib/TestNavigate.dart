import 'package:flutter/material.dart';

class TestNavigateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: "navigate",
      home: new FirstScreen()
    );
  }
}

class FirstScreen extends StatelessWidget {

final todos = new List<Todo>.generate(10 ,(i) => new Todo('todo $i','A descripiton whate to do $i'));
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: new Text("First page")),
      // body: new Center(
      //   child: new RaisedButton(
      //     child: new Text('Launch new screen'),
      //     onPressed: (){
      //       Navigator.push(context,new MaterialPageRoute(
      //         builder: (context) => new SecondScreen()));
      //     }
      //   )
      // )
      body: new ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context,index){
          return ListTile(
            title: new Text(todos[index].title),
            onTap: (){
            _navigateAndshow(context,todos[index]);
            }
          );
        }
      )
    );
  }

  _navigateAndshow(BuildContext context,Todo todo) async {
    final result = await Navigator.push(context,new MaterialPageRoute(
      builder: (context) => new TodoDetail(todo:todo )
    ));
    Scaffold
       .of(context)
       .showSnackBar(new SnackBar(content: new Text("pop---$result")));
    print("pop--"+result);
  }
}


class SecondScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: new Text("Second page")),
      body: new Center(
        child: new RaisedButton(
          child: new Text("go back"),
          onPressed: (){
            Navigator.pop(context);
          }
        )
      )
    );
  }
}

class TodoDetail extends StatelessWidget {
  final Todo todo;
  TodoDetail({Key key, this.todo}): super(key: key);

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("${todo.title}"),
        actions: <Widget>[new IconButton(
          icon: new Icon(Icons.menu),
          onPressed:(){
            Navigator.pop(context,'hhhhh');
          }
        )]
    ),
      body: new Padding(
        padding: new EdgeInsets.all(16.0),
        child: new Text('${todo.description}')
      )
    );
  }
}

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

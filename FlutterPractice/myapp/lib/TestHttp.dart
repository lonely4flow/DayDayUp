import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;



class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return new Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class TestHttpApp extends  StatelessWidget {

  Future<Post> fetchPost() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/posts/1');
    final responseJson = json.decode(response.body);

    return new Post.fromJson(responseJson);
  }

  @override
 Widget build(BuildContext context) {
   return new MaterialApp(
     title: 'Fetch Data Example',
     theme: new ThemeData(
       primarySwatch: Colors.blue,
     ),
     home: new Scaffold(
       appBar: new AppBar(
         title: new Text('Fetch Data Example'),
       ),
       body: new Center(
         child: new FutureBuilder<Post>(
           future: fetchPost(),
           builder: (context, snapshot) {
             if (snapshot.hasData) {
               return new Text(snapshot.data.body);
             } else if (snapshot.hasError) {
               return new Text("${snapshot.error}");
             }

             // By default, show a loading spinner
             return new CircularProgressIndicator();
           },
         ),
       ),
     ),
   );
 }
}

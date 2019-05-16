import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class SavedWords extends StatefulWidget{
    @override
    createState() => new SavedWordsState();
}

class SavedWordsState extends State<SavedWords>{
    final _biggerFont = const TextStyle(fontSize: 18.0);
    final _saved = <WordPair>[];
  @override
  Widget build(BuildContext context){
    final tiles = _saved.map(
      (pair){
       return new ListTile(
         title: new Text(pair.asPascalCase,style: _biggerFont)
       );
     }
   );

   final divided = ListTile.divideTiles(
     context: context,
         tiles: tiles,
       ).toList();

       return new Scaffold(
         appBar: new AppBar(title: new Text('Save Suggestions')),
         body: new ListView(children: divided)
       );
  }
}

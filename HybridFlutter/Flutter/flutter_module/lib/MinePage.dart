import 'package:flutter/material.dart';

class MinePage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {

    
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          new Image.asset("images/lake.jpg",
            //height: 240.0,
            fit: BoxFit.fill,
          ),
          _titleSection(),
          _buildButtonsSection(context),
          _buildTextSection()
        ],
      ),
    );
  }

  /**
   *  标题行
   */
  Widget _titleSection()
  {
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text("Oeschinen Lake Campground",style: new TextStyle(fontWeight: FontWeight.bold),),
                ),
                new Text("Kandersteg, Switzerland",style: new TextStyle(color: Colors.grey[500]),)
              ],
            ),

          ),
          new FavoriteWidget(),
        ],
      ),
    );
    
    return titleSection;
  }

  /**
   * 创建按钮行
   */
  Widget _buildButtonsSection(BuildContext context)
  {
    return new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildColumn(context, Icons.call, "Call"),
          _buildColumn(context, Icons.near_me, "Route"),
          _buildColumn(context, Icons.share, "Share")
        ],
      ),
    );
  }
  /**
  *  创建竖直的列
  */
  Column  _buildColumn(BuildContext context,IconData icon,String label)
  {
    Color color = Theme.of(context).primaryColor;
    
    return new Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        new Icon(icon,color: color,),
        new Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: new Text(label,style: new TextStyle(fontSize: 12.0,fontWeight: FontWeight.w400,color: color),),
        )
      ]
    );
  }


  Widget _buildTextSection(){
    return new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text('''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return new _FavoriteWidgetState();
  }
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite(){
    setState(() {
      _isFavorited = !_isFavorited;
      if(_isFavorited){
        _favoriteCount ++;
      }else{
        _favoriteCount --;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.all(0.0),
          child: new IconButton(
            icon: _isFavorited ? new Icon(Icons.star) : new Icon(Icons.star_border),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        new SizedBox(
          width: 18.0,
          child: new Container(
            child: new Text("$_favoriteCount"),
          ),
        )
      ],

    );
  }
}
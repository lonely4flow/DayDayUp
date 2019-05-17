import 'package:flutter/material.dart';
import 'package:myapp/RandomWords.dart';
import 'package:myapp/MyAppBar.dart';
import 'package:myapp/TutorialHome.dart';
import 'package:myapp/Shopping.dart';
import 'package:myapp/CachedNetworkImageDemo.dart';
import 'package:myapp/TransparentImageDemo.dart';
import 'package:myapp/ImageNetworkDemo.dart';
import 'package:myapp/TestListView.dart';
import 'package:myapp/TestListView2.dart';
import 'package:myapp/TestGridList.dart';
import 'package:myapp/TestDismissible.dart';
import 'package:myapp/TestNavigate.dart';
import 'package:myapp/TestHttp.dart';
import 'package:myapp/TestAppBarBottom.dart';


// void main() => runApp(new MyApp());
// void main() {
//    runApp(
//      new Center(
//        child: new Text('Hello word!',textDirection: TextDirection.ltr )
//      )
//    );
// }
// void main() => runApp(new MyAppBar(title: new Text('hhhhhh')));

// void main() {
//     runApp(new MaterialApp(
//       title: 'My app',
//       home: new MyScaffold()
//     ));
// }
// void main() {
//     runApp(new MaterialApp(
//       title: 'My app',
//       home:   new MyAppBar(
//           title: new Text(
//             'Example title',
//             style: Theme.of(context).primaryTextTheme.title,
//           ),
//         )
//     ));
// }
// void main() {
//   runApp(new MaterialApp(
//     title: 'My app', // used by the OS task switcher
//     home: new MyScaffold(),
//   ));
// }
// void main() => runApp(new MaterialApp(
//   title: 'Flutter Tutorial',
//   home: new TutorialHome()
// ));
// void main() {
//   runApp(new MaterialApp(
//     title: 'Shopping App',
//     home: new ShoppingList(
//       products: <Product>[
//         new Product(name: 'Egges'),
//         new Product(name: 'Apple'),
//         new Product(name: 'Vegetable'),
//       ]
//     )
//   ));
// }
// void main() => runApp(new CachedNetworkImageDemo());
// void main() => runApp(new TransparentImageDemo());
// void main() => runApp(new ImageNetworkDemo());
// void main() => runApp(new TestListView());
// void main() => runApp(new TestListView2());
// void main() => runApp(new TestGridList());
// void main() => runApp(new TestDismissible());
// void main() => runApp(new TestNavigateApp());
// void main() => runApp(new TestHttpApp());
void main() => runApp(new TestAppBarBottom());


class MyApp extends StatelessWidget {
  // @override
  // Widget build(BuildContext context) {
  //   return new MaterialApp(
  //     title: 'Welcome to Flutter',
  //     home: new Scaffold(
  //       appBar: new AppBar(
  //         title: new Text('Welcome to Flutter'),
  //       ),
  //       body: new Center(
  //         //child: new Text('Hello World'),
  //         child: new RandomWords(),
  //       ),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'Startup Name Generator',
      theme: new ThemeData(
        primaryColor: Colors.red,
      ),
      home: new RandomWords(),
    );
  }
}

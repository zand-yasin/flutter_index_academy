import 'package:dartlearning/home.dart';
import 'package:flutter/material.dart';

main() {
  // return runApp(MaterialApp(
  //   home: Home(),
  // ));

  String box = "";
  for (int i = 0; i < 10; i++) {
    if (i % 2 == 0) box += i.toString();
  }
  print(box);
//02468

  String box2 = "";
  List list = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  for (int i = 0; i < list.length; i++) {
    if (list[i] % 2 == 0) {
      box2 += list[i].toString();
    }
  }
  print(box2);

  // homework convert string to list

//   #variable
  var harshtek = "hello welcome to the Flutter course!";
  print(harshtek);

  List<int> list2 = <int>[1, 4, 6];

  print(list2);

  Map<String, dynamic> person = {
    "id": "a21",
    "name": "dianna",
    "class": <String>[
      "flutter",
      "mcna",
    ],
  };

  print(person);
  print(person['class'][0]);

//   #ist of map
  List<Map<String, int>> person2 = [
    {'id': 1, 'age': 12},
    {'id': 2, 'age': 30},
    {'id': 3, 'age': 27},
  ];
  print("-----");
  // print(person2[0]['age']);

// //   #traditonal for
  for (var i = 0; i < person2.length; i++) {
    print("person of ${person2[i]['id']} ids age is ${person2[i]['age']}");
  }

// //   #forEach new way
  person2.forEach((item) {
    print("person of ${item['id']} ids age is ${item['age']}");
  });

// //   #Conditional operator with function
  String data;
  data = ageCheck(24);
  print("here------");
  print(data);
//   data = ageCheck(23);
//   print(data);
//   data = ageCheck(24);
//   print(data);
}

ageCheck(int age) => age == 22 ? "bale 22 salla" : "$age salla 22 sall nia";

// 1 line function to return a value..

// ageCheck(final age) => age == 22 ? " 22 salla" : "am kasa 22 sall nia!";

// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

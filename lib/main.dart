import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    // home: ,
    builder: (context, wid) {
      return Dashboard();
    },
  ));

  // runApp(MaterialApp(
  //   builder: (_, a) {
  //     return Dashboard();
  //   },
  // ));
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Dashboard',
          style: TextStyle(
              fontSize: 20,
              letterSpacing: 5,
              color: Colors.black,
              fontWeight: FontWeight.w900),
        ),
      ),
      body: Icon(Icons.ac_unit),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.check),
      ),
    );
  }
}

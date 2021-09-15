import 'package:dartlearning/ColorChanger.dart';
import 'package:dartlearning/complexUI.dart';
import 'package:dartlearning/dashboard.dart';
import 'package:dartlearning/home.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Card(
              child: ListTile(
                trailing: Text('Home'),
                leading: Icon(Icons.arrow_back_ios),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return Home();
                  }));
                },
              ),
            ),
            Card(
              child: ListTile(
                trailing: Text('Dashboard'),
                leading: Icon(Icons.arrow_back_ios),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return Dashboard();
                  }));
                },
              ),
            ),
            Card(
              child: ListTile(
                trailing: Text('Color Changer'),
                leading: Icon(Icons.arrow_back_ios),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return ColorChanger();
                  }));
                },
              ),
            ),
            Card(
              child: ListTile(
                trailing: Text('Homework complex ui'),
                leading: Icon(Icons.arrow_back_ios),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return ComplexUI();
                  }));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

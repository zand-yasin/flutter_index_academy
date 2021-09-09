import 'package:flutter/material.dart';

class ColorChanger extends StatefulWidget {
  @override
  _ColorChangerState createState() => _ColorChangerState();
}

class _ColorChangerState extends State<ColorChanger> {
  Color color = Colors.yellow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: color,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.color_lens,
            color: Colors.lightBlue,
            size: 40,
          ),
          onPressed: () {
            setState(() {
              if (color == Colors.yellow)
                color = Colors.red;
              else
                color = Colors.yellow;
            });
            print('clicked!');
          }),
    );
  }
}

import 'package:flutter/material.dart';

class ComplexUI extends StatelessWidget {
  Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                top: 0,
                child: Container(
                  color: Colors.amber,
                  width: size!.width,
                  height: size!.height * .3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.arrow_back),
                              Text('Transaction'),
                            ],
                          ),
                          Icon(Icons.alarm)
                        ],
                      ),
                      Container(
                        width: size!.width,
                        height: 100,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (_, index) {
                              return Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    'data $index',
                                    style: TextStyle(fontSize: 20),
                                  ));
                            }),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

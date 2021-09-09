import 'package:dartlearning/ColorChanger.dart';
import 'package:dartlearning/complexUI.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, home: ComplexUI(),
    // },
  ));
}

class Dashboard extends StatelessWidget {
  Size? size; //= MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                width: size!.width,
                height: size!.height * .48,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/cover.png'),
                        fit: BoxFit.fitHeight),
                    color: Colors.purple[900],
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(40))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 12),
                          child: Icon(Icons.list, color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 12),
                          child: Icon(Icons.warning, color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Trandin",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.blue[300], fontSize: 25),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 200,
                      margin: EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Ariana Grande",
                        // textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 45),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: size!.height * .5,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .48,
                color: Colors.white,
                child: Column(
                  children: [
                    getHeader(),
                    GetRow(
                      left: "1 title",
                      right: "second title",
                      height: 10,
                    ),
                    getLine(),
                    GetRow(
                      left: "2 title",
                      right: "third title",
                      height: 10,
                    ),
                    getLine(),
                    GetRow(
                      left: null,
                      right: "fourth title",
                      height: 10,
                    ),
                    getLine(),
                    GetRow(
                      left: "4 title",
                      right: "fifth title",
                      height: 10,
                    ),
                    getLine(),
                  ],
                ),
              ),
            ),
            Positioned(
              top: size!.height * .4,
              right: 30,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

// fixing line breaks, changing divider to container
  Container getLine() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 1,
      color: Colors.grey[300],
    );
  }

  Widget getHeader() {
    return Padding(
      padding:
          // const EdgeInsets.only(left: 20, top: 60, right: 20),
          const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Popular",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text(
            "Show All",
            overflow: TextOverflow.clip,
            style: TextStyle(
                color: Colors.purple,
                // fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class GetRow extends StatelessWidget {
  GetRow({this.left, this.right, this.height});
  double? height;
  String? left;
  String? right;
  var data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          // const EdgeInsets.symmetric(horizontal: 20, vertical: height ?? 10.0),
          // if you  put const  you lose the chance to null check like the line above
          EdgeInsets.symmetric(horizontal: 20, vertical: height ?? 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(left ?? "ama datay nully bo"),
          Container(
            alignment: Alignment.centerLeft,
            // color: Colors.amber,
            width: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // add expanded widget to make sure the text widget takes all of the needed spaces
                Expanded(
                  child: Text(
                    right!,
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                  ),
                ),
                Text(
                  "...",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
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
  Size? size; //= MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: size!.width,
              height: size!.height * .48,

              // 1. double null safety
              // 2. overflow on text
              // 3. using stack or image memory

              decoration: BoxDecoration(
// image: DecorationImage(image: ),
                  color: Colors.purple[900],
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(40))),
              child: Column(
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
                  SizedBox(
                    height: 0,
                  ),
                  Container(
                    width: 200,
                    margin: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Ariana Grande",
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white, fontSize: 55),
                    ),
                  ),
                ],
              ),
            ),
            Container(
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
                  Divider(
                    endIndent: 20,
                    indent: 20,
                  ),
                  GetRow(
                    left: "4 title",
                    right: "fifth title",
                    height: 10,
                  ),
                  // getLine(),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Divider getLine() {
    return Divider(
      color: Colors.black,
      endIndent: 20,
      indent: 20,
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
                    // softWrap: true,
                  ),
                ),
                Text(
                  "...",
                  overflow: TextOverflow.clip,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

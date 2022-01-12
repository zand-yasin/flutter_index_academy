// import 'package:dartlearning/providers/user.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:provider/provider.dart';
// import 'package:easy_localization/easy_localization.dart';

// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
// // color: Colors.,
//         height: MediaQuery.of(context).size.height,
//         child: Stack(
//           alignment: AlignmentDirectional.topCenter,
//           children: [
//             Positioned(
//               child: Container(
//                 height: MediaQuery.of(context).size.height,
//                 decoration: BoxDecoration(color: Colors.grey[200]),
//               ),
//             ),
//             Positioned(
//               child: Container(
//                 height: MediaQuery.of(context).size.height * .3,
//                 decoration: BoxDecoration(
//                     color: Colors.black,
//                     borderRadius:
//                         BorderRadius.only(bottomLeft: Radius.circular(50))),
//                 child: Container(
//                   // width: 100,
//                   // height: 100,

//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       SizedBox(height: 10),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Icon(
//                             Icons.keyboard_backspace,
//                             size: 30,
//                             color: Colors.white,
//                           ),
//                           Text(
//                             "title".tr(),
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           Consumer<User>(
//                               builder: (_, User userprovider, child) {
//                             return Text(
//                               userprovider.getemail(),
//                               // userprovider ,
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 25),
//                             );
//                           }),
//                           InkWell(
//                               onTap: () {
//                                 if (EasyLocalization.of(context)!.locale ==
//                                     Locale('ar', 'SA'))
//                                   EasyLocalization.of(context)!
//                                       .setLocale(Locale('ar', 'IQ'));
//                                 else
//                                   EasyLocalization.of(context)!
//                                       .setLocale(Locale('ar', 'SA'));
//                               },
//                               child:
//                                   Icon(Icons.lock_clock, color: Colors.white)),
//                         ],
//                       ),
//                       Container(
//                         // width: 30,
//                         height: 80,
//                         child: ListView.builder(
//                           scrollDirection: Axis.horizontal,
//                           itemBuilder: (_, index) {
//                             return Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 10),
//                               child: Text(
//                                 'data $index',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 20),
//                               ),
//                             );
//                           },
//                           itemCount: 18,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               top: MediaQuery.of(context).size.height * .23,
//               child: Container(
//                 // height: 100,
//                 height: MediaQuery.of(context).size.height * .63,
//                 width: MediaQuery.of(context).size.width,
//                 child: ListView.builder(
//                   itemCount: 10,
//                   itemBuilder: (_, index) {
//                     return Container(
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(30),
//                           )),
//                       height: MediaQuery.of(context).size.height * .11,
//                       margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
//                       // width: MediaQuery.of(context).size.width * .8,
//                       alignment: Alignment.center,
//                       child: Row(
//                         children: [
//                           Icon(Icons.ac_unit),
//                           Text('spotify'),
//                           Text('-23')
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//             Positioned(
//                 bottom: 20,
//                 child: Container(
//                   alignment: Alignment.center,
//                   width: MediaQuery.of(context).size.width * .9,
//                   // margin: EdgeInsets.symmetric(horizontal: 50),
//                   height: 60,
//                   decoration: BoxDecoration(
//                       color: Colors.black,
//                       borderRadius: BorderRadius.all(Radius.circular(40))),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Icon(
//                         Icons.ac_unit,
//                         size: 30,
//                         color: Colors.white,
//                       ),
//                       Icon(
//                         Icons.ac_unit,
//                         size: 30,
//                         color: Colors.white,
//                       ),
//                       Icon(
//                         Icons.ac_unit,
//                         size: 30,
//                         color: Colors.white,
//                       ),
//                       Icon(
//                         Icons.ac_unit,
//                         size: 30,
//                         color: Colors.white,
//                       ),
//                     ],
//                   ),
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }

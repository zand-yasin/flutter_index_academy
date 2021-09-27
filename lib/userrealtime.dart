import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartlearning/getuser.dart';
import 'package:flutter/material.dart';

class UserRealtime extends StatelessWidget {
  final Stream<QuerySnapshot> listStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: listStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            return ListView(
              children: snapshot.data!.docs.map((e) {
                Map<String, dynamic> data = e.data() as Map<String, dynamic>;
                return Card(
                  child: ListTile(
                    title: Text(data['company']),
                    subtitle: Text(data['age'].toString()),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return GetUserName(e.id);
                      }));
                    },
                  ),
                );
              }).toList(),
            );
          }),
    );
  }
}

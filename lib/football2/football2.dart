import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartlearning/football2/EditFootball.dart';
import 'package:flutter/material.dart';

class Football2 extends StatelessWidget {
  final list = FirebaseFirestore.instance.collection('Football').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
          stream: list,
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
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return EditFootball2(docId: e.id);
                  }));
                },
                title: Text(data['won']),
                subtitle: Text(data['lost']),
                trailing: Text(data['match'].toString()),
              ));
            }).toList());
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return EditFootball2();
          }));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

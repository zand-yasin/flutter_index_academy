import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartlearning/football/EditFootball.dart';
import 'package:flutter/material.dart';

class Football extends StatelessWidget {
  final Stream<QuerySnapshot> football = FirebaseFirestore.instance
      .collection('Football')
      // .where('match', isGreaterThan: 4)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<QuerySnapshot>(
          stream: football,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot doc) {
                Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;

                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  EditFootball(documentId: doc.id)));
                    },
                    trailing: InkWell(
                        onTap: () {
                          FirebaseFirestore.instance
                              .collection('Football')
                              .doc(doc.id)
                              .delete();
                        },
                        child: Icon(Icons.delete)),
                    title: Text(data['won']),
                    leading: Text(data['lost']),
                    subtitle: Text(data['match'].toString()),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => EditFootball()));
          }),
    );
  }
}

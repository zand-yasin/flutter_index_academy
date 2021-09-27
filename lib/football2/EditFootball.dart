import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditFootball2 extends StatelessWidget {
  TextEditingController won = TextEditingController();
  TextEditingController lost = TextEditingController();
  TextEditingController match = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

  String? docId;

  EditFootball2({this.docId});

  getData() async {
    final firestoreData =
        FirebaseFirestore.instance.collection('Football').doc(docId).get();

    final data = await firestoreData;

    won.text = data['won'];
    lost.text = data['lost'];
    match.text = data['match'].toString();
  }

  @override
  Widget build(BuildContext context) {
    if (docId != null) getData();
    return Scaffold(
      appBar: AppBar(),
      body: Form(
          key: formGlobalKey,
          child: Column(
            children: [
              TextFormField(
                controller: won,
                decoration: InputDecoration(labelText: "leage won"),
                validator: (leagewon) {
                  if (leagewon!.isNotEmpty)
                    return null;
                  else
                    return 'Enter leaguewon ';
                },
              ),
              TextFormField(
                controller: lost,
                decoration: InputDecoration(labelText: "leage lost"),
                validator: (leagelost) {
                  if (leagelost!.isNotEmpty)
                    return null;
                  else
                    return 'Enter leagelost ';
                },
              ),
              TextFormField(
                controller: match,
                decoration: InputDecoration(labelText: "match goal"),
                validator: (match) {
                  if (match!.isNotEmpty)
                    return null;
                  else
                    return 'Enter company ';
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        if (formGlobalKey.currentState!.validate()) {
                          if (docId == null)
                            FirebaseFirestore.instance
                                .collection('Football')
                                .add({
                              'won': won.text,
                              'lost': lost.text,
                              'match': int.parse(match.text),
                            });
                          else
                            FirebaseFirestore.instance
                                .collection('Football')
                                .doc(docId)
                                .update({
                              'won': won.text,
                              'lost': lost.text,
                              'match': int.parse(match.text),
                            });
                          Navigator.pop(context);
                        }
                      },
                      child: Text(docId != null ? "Update Data" : 'Add data')),
                  docId == null
                      ? SizedBox()
                      : ElevatedButton(
                          onPressed: () {
                            FirebaseFirestore.instance
                                .collection('Football')
                                .doc(docId)
                                .delete();
                            Navigator.pop(context);
                          },
                          child: Text('Delete data')),
                ],
              )
            ],
          )),
    );
  }
}

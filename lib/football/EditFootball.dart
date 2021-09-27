import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditFootball extends StatelessWidget {
  TextEditingController won = TextEditingController();
  TextEditingController lost = TextEditingController();
  TextEditingController match = TextEditingController();

  final formGlobalKey = GlobalKey<FormState>();

  final documentId;

  EditFootball({this.documentId});

  @override
  Widget build(BuildContext context) {
    if (documentId != null) getData();

    return Scaffold(
      body: Form(
          key: formGlobalKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        addFootball(context);
                      }
                    },
                    child: Text(
                      documentId == null ? "Add User" : "Update User",
                    ),
                  ),
                  documentId != null
                      ? ElevatedButton(
                          onPressed: () {
                            if (formGlobalKey.currentState!.validate()) {
                              deleteFootball(context);
                            }
                          },
                          child: Text(
                            "Delete User",
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ],
          )),
    );
  }

  deleteFootball(BuildContext context) {
    FirebaseFirestore.instance.collection('Football').doc(documentId).delete();
    Navigator.pop(context);
  }

  getData() async {
    final football =
        FirebaseFirestore.instance.collection('Football').doc(documentId).get();

    final data = await football;

    won.text = data['won'];
    lost.text = data['lost'];
    match.text = data['match'].toString();
  }

  addFootball(BuildContext context) {
    final football = FirebaseFirestore.instance.collection('Football');
    if (documentId == null)
      football.add(
          {'won': won.text, 'lost': lost.text, 'match': int.parse(match.text)});
    else
      football.doc(documentId).update(
          {'won': won.text, 'lost': lost.text, 'match': int.parse(match.text)});
    Navigator.pop(context);
  }
}

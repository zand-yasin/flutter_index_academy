import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddUser extends StatelessWidget {
  TextEditingController fullname = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController company = TextEditingController();

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final formGlobalKey = GlobalKey<FormState>();

  addUser() {
    // Call the user's CollectionReference to add a new user
    users
        .add({
          'full_name': fullname.text, // John Doe
          'company': company.text, // Stokes and Sons
          'age': age.text // 42
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection

    return Scaffold(
      body: Center(
        child: Form(
            key: formGlobalKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  controller: fullname,
                  decoration: InputDecoration(labelText: "full name"),
                  validator: (fullname) {
                    if (fullname!.isNotEmpty)
                      return null;
                    else
                      return 'Enter fullname ';
                  },
                ),
                TextFormField(
                  controller: age,
                  decoration: InputDecoration(labelText: "age"),
                  validator: (age) {
                    if (age!.isNotEmpty)
                      return null;
                    else
                      return 'Enter age ';
                  },
                ),
                TextFormField(
                  controller: company,
                  decoration: InputDecoration(labelText: "company"),
                  validator: (company) {
                    if (company!.isNotEmpty)
                      return null;
                    else
                      return 'Enter company ';
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formGlobalKey.currentState!.validate()) {
                      addUser();
                    }
                  },
                  child: Text(
                    "Add User",
                  ),
                )
              ],
            )),
      ),
    );
  }
}

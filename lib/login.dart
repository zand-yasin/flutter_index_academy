import 'package:dartlearning/myapp.dart';
import 'package:dartlearning/providers/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login'),
      ),
      body: Form(
        key: formGlobalKey,
        child: Column(
          children: [
            TextFormField(
              controller: email,
              decoration: InputDecoration(labelText: "Email"),
              validator: (email) {
                if (email != "" && isEmailValid(email!))
                  return null;
                else
                  return 'Enter a valid email address';
              },
            ),
            TextFormField(
              controller: password,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
              validator: (password) {
                if (password != "" && isPasswordValid(password!))
                  return null;
                else
                  return 'Enter a valid password ';
              },
            ),
            // InkWell(
            //     onTap: () {},
            //     child: Container(
            //         padding: EdgeInsets.all(20),
            //         color: Colors.blue,
            //         child: Text('submit'))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      if (formGlobalKey.currentState!.validate()) {
                        if (await login()) {
                          final userPrvider =
                              Provider.of<UserPrv>(context, listen: false);

                          userPrvider.addEmail(email.text);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => MyApp()));
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (_) => MyApp()));
                        }
                      } else
                        print('unsuccssull');
                    },
                    child: Text("Sign in")),
                ElevatedButton(
                    onPressed: () async {
                      if (formGlobalKey.currentState!.validate()) {
                        if (await register()) {
                          final userPrvider =
                              Provider.of<UserPrv>(context, listen: false);

                          userPrvider.addEmail(email.text);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => MyApp()));
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (_) => MyApp()));
                        }
                      } else
                        print('unsuccssull');
                    },
                    child: Text("Sign up")),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<bool> register() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.text, password: password.text);

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.text, password: password.text);

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return false;
    }
  }

  bool isPasswordValid(String password) => password.length >= 6;

  bool isEmailValid(String email) => email.contains("@") && email.length >= 6;
}

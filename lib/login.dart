import 'package:dartlearning/myapp.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final formGlobalKey = GlobalKey<FormState>();

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
              decoration: InputDecoration(labelText: "Email"),
              validator: (email) {
                if (email != "" && isEmailValid(email!))
                  return null;
                else
                  return 'Enter a valid email address';
              },
            ),
            TextFormField(
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
            ElevatedButton(
                onPressed: () {
                  if (formGlobalKey.currentState!.validate())
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => MyApp()));
                  else
                    print('unsuccssull');
                },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }

  bool isPasswordValid(String password) => password.length >= 6;

  bool isEmailValid(String email) => email.contains("@") && email.length >= 6;
}

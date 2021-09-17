import 'package:dartlearning/myapp.dart';
import 'package:dartlearning/providers/user.dart';
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
            ElevatedButton(
                onPressed: () {
                  if (formGlobalKey.currentState!.validate()) {
                    final userPrvider =
                        Provider.of<User>(context, listen: false);

                    userPrvider.addEmail(email.text);

                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => MyApp()));
                  } else
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

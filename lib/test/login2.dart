// import 'package:dartlearning/home.dart';
// import 'package:dartlearning/providers/user.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:easy_localization/easy_localization.dart';

// class Login extends StatelessWidget {
//   final formGlobalKey = GlobalKey<FormState>();

//   TextEditingController email = TextEditingController();
//   TextEditingController password = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//             title: Text(
//           "title".tr(),
//         )),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: Form(
//               key: formGlobalKey,
//               child: Column(
//                 children: [
//                   const SizedBox(height: 50),
//                   TextFormField(
//                     decoration: InputDecoration(labelText: "Email"),
//                     controller: email,
//                     validator: (email) {
//                       if (email != "" && isEmailValid(email!))
//                         return null;
//                       else
//                         return 'Enter a valid email address';
//                     },
//                   ),
//                   const SizedBox(height: 24),
//                   TextFormField(
//                     decoration: InputDecoration(
//                       labelText: "Password",
//                     ),
//                     maxLength: 6,
//                     obscureText: true,
//                     validator: (password) {
//                       if (password != "" && isPasswordValid(password!))
//                         return null;
//                       else
//                         return 'Enter a valid password';
//                     },
//                   ),
//                   const SizedBox(height: 50),
//                   ElevatedButton(
//                       onPressed: () {
//                         if (formGlobalKey.currentState!.validate()) {
//                           // use the email provided here

//                           final userPrvider =
//                               Provider.of<User>(context, listen: false);

//                           userPrvider.addEmail(email.text);
//                           Navigator.push(context,
//                               MaterialPageRoute(builder: (_) => Home()));
//                         }
//                       },
//                       child: Text("Submit"))
//                 ],
//               ),
//             ),
//           ),
//         ));
//   }

//   bool isPasswordValid(String password) => password.length >= 6;

//   bool isEmailValid(String email) => email.contains("@") && email.length >= 6;
// }

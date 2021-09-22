import 'package:dartlearning/login.dart';
import 'package:dartlearning/myapp.dart';
import 'package:dartlearning/providers/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();

  runApp(EasyLocalization(
      saveLocale: true,
      path: 'assets/langs',
      supportedLocales: [
        Locale("ar", "IQ"),
        Locale("ar", "SA"),
      ],
      child: ChangeNotifierProvider(
        create: (context) => UserPrv(),
        child: App(),
      )));
}

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  isUser() {
    var currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) return false;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        home: isUser() ? MyApp() : Login());
  }
}

import 'package:dartlearning/login.dart';
import 'package:dartlearning/providers/user.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      saveLocale: true,
      path: 'assets/langs',
      supportedLocales: [
        Locale("ar", "IQ"),
        Locale("ar", "SA"),
      ],
      child: ChangeNotifierProvider(
        create: (context) => User(),
        child: App(),
      )));
}

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        home: Login());
  }
}

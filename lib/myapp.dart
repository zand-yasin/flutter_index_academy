import 'package:dartlearning/ColorChanger.dart';
import 'package:dartlearning/adduser.dart';
import 'package:dartlearning/api/api.dart';
import 'package:dartlearning/complexUI.dart';
import 'package:dartlearning/currencyapi/apicurrency.dart';
import 'package:dartlearning/dashboard.dart';
import 'package:dartlearning/getrealtime.dart';
import 'package:dartlearning/getuser.dart';
import 'package:dartlearning/home.dart';
import 'package:dartlearning/login.dart';
import 'package:dartlearning/providers/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<UserPrv>(builder: (_, useprv, abc) {
          return Text(useprv.getemail());
        }),
        leading: InkWell(
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Login()));

              // Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: Icon(Icons.logout)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: ListTile(
                  trailing: Text('Home'),
                  leading: Icon(Icons.arrow_back_ios),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return Home();
                    }));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  trailing: Text('Login'),
                  leading: Icon(Icons.arrow_back_ios),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return Login();
                    }));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  trailing: Text('Dashboard'),
                  leading: Icon(Icons.arrow_back_ios),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return Dashboard();
                    }));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  trailing: Text('Color Changer'),
                  leading: Icon(Icons.arrow_back_ios),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return ColorChanger();
                    }));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  trailing: Text('Homework complex ui'),
                  leading: Icon(Icons.arrow_back_ios),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return ComplexUI();
                    }));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  trailing: Text('Test API'),
                  leading: Icon(Icons.arrow_back_ios),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return Api();
                    }));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  trailing: Text('Currency API'),
                  leading: Icon(Icons.arrow_back_ios),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return CurrencyApi();
                    }));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:homeautomationapp/screens/passwordRecovery.dart';
import 'package:homeautomationapp/screens/serverList/serverList.dart';

import 'screens/loginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'HomeAutomationApp',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        secondaryHeaderColor: Colors.grey[600],
      ),
      initialRoute: '/loginPage',
      routes: {
        'loginPage': (context) => LoginPage(),
        'recoveryPage': (context) => RecoveryPage(),
        // 'serverList': (context) => ServerListItem(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:homeautomationapp/screens/passwordRecovery.dart';

import 'screens/loginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GetMaterialApp(
      title: 'HomeAutomationApp',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        secondaryHeaderColor: Colors.grey[600],
      ),
      home: LoginPage(),
      routes: {
        'loginPage': (context) => LoginPage(),
        'recoveryPage': (context) => RecoveryPage(),
        // 'serversList': (context) => ServerListItem(),
      },
    );
  }
}

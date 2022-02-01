import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:homeautomationapp/pages/home/home.dart';
import 'package:homeautomationapp/pages/menu/menu.dart';

import 'pages/init.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Home Automation App',
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.grey[850],
      ),
      home: const Login(),
      getPages: [
        GetPage(name: '/', page: () => const Login()),
        GetPage(name: '/home', page: () => Home()),
        GetPage(name: '/rmenu', page: () => const MenuWidget()),
      ],
    );
  }
}

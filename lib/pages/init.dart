
import 'package:flutter/material.dart';
import 'initForms/loginForm.dart';

import '../components/pages/body.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Body(),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0),
        color: Colors.grey[850],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xfffacb0bd),
        onPressed: () {
          loginForm(context);
        },
        child: const Text(
          'Iniciar',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

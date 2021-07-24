import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeautomationapp/screens/passwordRecovery.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  GlobalKey<NavigatorState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          if (_key.currentState.canPop()) {
            _key.currentState.pop();
            return false;
          }
          return true;
        },

        child: Container(
          color: Color(0x74747474),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[300],
                      blurRadius: 4.0,
                      spreadRadius: 8.0),
                ],
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.6,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.20,
                        width: MediaQuery.of(context).size.height * 0.4,
                        child: Container(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28.0),
                          ),
                          labelText: 'E-mail'),
                      onSaved: (String input) {},
                      validator: (String input) {
                        return input == ''
                            ? 'Este campo não pode estar vázio'
                            : null;
                      },
                    ),
                    SizedBox(height: 15.0),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28.0),
                          ),
                          labelText: 'Senha'),
                      onSaved: (String input) {},
                      validator: (String input) {
                        return input == ''
                            ? 'Este campo não pode estar vázio'
                            : null;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 14),
                          ),
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, 'recoveryPage');
                            Get.to(() => RecoveryPage());
                          },
                          child: const Text('Recuperar senha'),
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.green,
                              ),
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.only(
                                  top: 4.0,
                                  bottom: 4.0,
                                  left: 80.0,
                                  right: 80.0),
                              primary: Colors.white,
                              textStyle: const TextStyle(fontSize: 16),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Conectar',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ), // Th
      ),
    );
  }
}

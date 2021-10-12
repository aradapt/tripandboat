import 'package:flutter/material.dart';
import 'package:tbmfm/screens/login/register_screen.dart';
import 'package:tbmfm/screens/main/main_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 10, top: 20, left: 10),
          child: Card(
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Column(
                children: [
                  Card(
                    child: SizedBox(
                      child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return MainScreen();
                            }));
                          },
                          icon: Icon(Icons.login),
                          label: Text(
                            'Login',
                            style: TextStyle(fontSize: 20),
                          )),
                    ),
                  ),
                  SizedBox(
                    child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return RegisterScreen();
                          }));
                        },
                        icon: Icon(Icons.group_add),
                        label: Text('Register')),
                  )
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

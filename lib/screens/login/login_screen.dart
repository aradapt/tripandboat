import 'package:flutter/material.dart';
import 'package:tbmfm/models/profile.dart';
import 'package:tbmfm/screens/login/register_screen.dart';
import 'package:tbmfm/screens/main/main_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();
  Profile profile = Profile();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Card(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      SizedBox(
                        child: Text('TBM & FM Login'),
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (String? email) {
                          profile.email = email;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: true,
                        onSaved: (String? password) {
                          profile.password = password;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Login'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            formkey.currentState!.save();
                            formkey.currentState!.reset();
                          },
                          child: Text('Register')),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      )),
    );
  }
}

import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = "Login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Login view")));
  }
}

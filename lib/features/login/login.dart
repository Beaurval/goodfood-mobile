import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    String appTitle = 'Se connecter $email';
    return Scaffold(
      appBar: AppBar(title: Text(appTitle)),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:goodfood_mobile/forms/login_form.dart';

class Login extends StatelessWidget {
  final String email;

  const Login({super.key, this.email = ""});

  @override
  Widget build(BuildContext context) {
    String appTitle = 'Se connecter $email';
    return Scaffold(
      appBar: AppBar(title: Text(appTitle)),
      body: LoginForm(
        email: email,
      ),
    );
  }
}

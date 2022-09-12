import 'package:flutter/material.dart';
import 'package:goodfood_mobile/forms/registration_form.dart';

class Register extends StatelessWidget {
  const Register({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    String appTitle = 'Inscription';
    return MaterialApp(
        title: "Inscription",
        home: Scaffold(
          appBar: AppBar(title: Text(appTitle)),
          body: const RegistrationForm(),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:goodfood_mobile/forms/registration_form.dart';

class Register extends StatelessWidget {
  const Register({super.key, required this.email, this.errorMessage});

  final String email;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    String appTitle = 'Inscription';

    return MaterialApp(
        title: "Inscription",
        home: Scaffold(
          appBar: AppBar(title: Text(appTitle)),
          body: RegistrationForm(email: email, errorMessage: errorMessage),
        ));
  }
}

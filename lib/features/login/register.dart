import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    String appTitle = 'S\'inscrire';
    return Scaffold(
      appBar: AppBar(title: Text(appTitle)),
    );
  }
}

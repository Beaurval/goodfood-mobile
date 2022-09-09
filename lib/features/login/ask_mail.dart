import 'package:flutter/material.dart';

import '../../forms/ask_mail_form.dart';

void main() => runApp(const AskMail());

class AskMail extends StatelessWidget {
  const AskMail({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Connexion \\ inscription à l\'application';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const AskMailForm(),
      ),
    );
  }
}

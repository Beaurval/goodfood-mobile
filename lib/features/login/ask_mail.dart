import 'package:firebase_core/firebase_core.dart';
import '../../firebase_options.dart';
import 'package:flutter/material.dart';

import '../../forms/ask_mail_form.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const AskMail());
}

class AskMail extends StatelessWidget {
  const AskMail({super.key});

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

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

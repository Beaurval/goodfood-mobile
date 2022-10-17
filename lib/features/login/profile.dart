import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  Widget userIsConnected() {
    Widget state = const Text('error');

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        state = const Text('User is currently signed out!');
      } else {
        state = const Text('User is signed in!');
      }
    });
    return state;
  }

  @override
  Widget build(BuildContext context) {
    String appTitle = 'Profil';
    return Scaffold(
      appBar: AppBar(title: Text(appTitle)),
      body: userIsConnected(),
    );
  }
}

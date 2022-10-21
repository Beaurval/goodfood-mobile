import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../home/screens/home_screen.dart';

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Compte'),
        ),
        body: Card(
              color: const Color.fromARGB(255, 198, 220, 226),
              child: ListView(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      _signOut().then((value) {
                        Navigator.popUntil(context, (route) => route.isFirst);
                      });
                    },
                    visualDensity: VisualDensity.compact,
                    leading: const Icon(Icons.highlight_off),
                    title: const Text('Se déconnecter'),
                  ),
                ],
              ),
            ));
  }

  Future <void> _signOut()  async{
    await FirebaseAuth.instance.signOut();
  }
}

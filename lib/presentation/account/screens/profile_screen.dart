import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../home/screens/home_screen.dart';

class ProfileScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Compte'),
        ),
        body: SizedBox(
            height: 160,
            child: Card(
              color: const Color.fromARGB(255, 198, 220, 226),
              child: ListView(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => HomeScreen()));
                    },
                    visualDensity: VisualDensity.compact,
                    leading: Icon(Icons.person),
                    title: Text('Informations du compte'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.photo_album),
                    title: Text('Album'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('Phone'),
                  ),
                ],
              ),
            )));
  }
}

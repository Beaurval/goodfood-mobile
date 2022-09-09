import 'package:flutter/material.dart';

import '../../models/user/user.dart';

class Connected extends StatefulWidget {
  const Connected({super.key});

  @override
  State<Connected> createState() => _Connected();
}

class _Connected extends State<Connected> {
  late Future<User> futureAlbum;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Compte'),
        ),
        body: Center(
          child: FutureBuilder<User>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.email.toString());
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

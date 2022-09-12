import 'package:flutter/material.dart';

import '../../models/User/create_user_model/create_user_model.dart';

class Connected extends StatefulWidget {
  const Connected({super.key});

  @override
  State<Connected> createState() => _Connected();
}

class _Connected extends State<Connected> {
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
          child: FutureBuilder<CreateUserModel>(
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

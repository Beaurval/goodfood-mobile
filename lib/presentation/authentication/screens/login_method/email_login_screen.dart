import 'package:flutter/material.dart';
import 'package:goodfood_mobile/presentation/authentication/viewmodels/sign_in.dart/sign_in_view_model.dart';
import 'package:goodfood_mobile/presentation/home/screens/home_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EmailLoginScreen extends HookConsumerWidget {
  final String? email;
  final emailcon = TextEditingController();
  final passwordcon = TextEditingController();

  EmailLoginScreen({this.email, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.watch(signInViewModelProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Connexion à l'application"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: SizedBox(
                    width: 200,
                    height: 150,
                    child: Image.asset('lib/src/images/good-food-logo.jpg')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                controller: emailcon,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextFormField(
                controller: passwordcon,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mot de passe',
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Mot de passe oublié',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  viewModel
                      .signIn(emailcon.text, passwordcon.text)
                      .then((signInResult) {
                    if (!signInResult.isLeft) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => HomeScreen()));
                    } else {
                      viewModel.showSnackBar(
                          signInResult.left.message, context);
                    }
                  });
                },
                child: const Text(
                  'Se connecter',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            const SizedBox(
              height: 130,
            )
          ],
        ),
      ),
    );
  }
}

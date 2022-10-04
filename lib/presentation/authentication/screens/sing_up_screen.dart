import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:goodfood_mobile/data/models/request/create_user_request.dart';
import 'package:goodfood_mobile/domain/use_cases/sign_up_usecase.dart';
import 'package:goodfood_mobile/presentation/authentication/screens/login_method/email_login_screen.dart';
import 'package:goodfood_mobile/presentation/authentication/viewmodels/sign_up/sign_up_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SingUpScreen extends HookConsumerWidget {
  final emailcon = TextEditingController();
  final passwordcon = TextEditingController();

  SingUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SignUpViewModel viewModel =
        SignUpViewModel(ref.watch(signUpUserUseCaseProvider));

    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var passwordConfirmController = TextEditingController();
    var firstNameController = TextEditingController();
    var lastNameController = TextEditingController();
    var phoneController = TextEditingController();

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
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mot de passe',
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextFormField(
                controller: passwordConfirmController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirmer mot de passe',
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextFormField(
                controller: lastNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nom',
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextFormField(
                controller: firstNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Prénom',
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Téléphone',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () async {
                  var userRequest = CreateUserRequest(
                      email: emailController.text,
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                      phoneNumber: phoneController.text,
                      password: passwordController.text,
                      passwordConfirmation: passwordConfirmController.text);

                  viewModel.signUp(userRequest).then((signUpResult) {
                    if (signUpResult.isLeft) {
                      viewModel.showSnackBar(
                          signUpResult.left.message, context);
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  EmailLoginScreen(email: userRequest.email)));
                    }
                  });
                },
                child: const Text(
                  'S\'inscrire',
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

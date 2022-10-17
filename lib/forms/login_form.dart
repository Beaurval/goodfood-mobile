// Create a Form widget.
import 'package:flutter/material.dart';
import 'package:goodfood_mobile/features/login/login.dart';
import 'package:goodfood_mobile/features/login/profile.dart';
import 'package:goodfood_mobile/models/user/get_user_model/get_user_model.dart';
import 'package:goodfood_mobile/services/user_service.dart';

class LoginForm extends StatefulWidget {
  final String email;

  const LoginForm({super.key, this.email = ""});

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController =
        TextEditingController(text: widget.email);
    TextEditingController passwordController =
        TextEditingController(text: "MdpSecure");
    var userService = UserService();

    return Form(
      key: _formKey,
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un mail valide';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Adresse mail',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez remplir ce champ';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Mot de passe',
                  ),
                ),
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: ElevatedButton(
                      child: const Text("Continuer"),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Widget route;
                          Future<GetUserModel?> awaitLoginResponse =
                              userService.signInUser(emailController.text,
                                  passwordController.text);

                          awaitLoginResponse.then((userModel) {
                            if (userModel != null) {
                              route = const Profile();
                            } else {
                              route = Login(email: emailController.text);
                            }

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => route,
                              ),
                            );
                          });
                        }
                      })),
            ],
          )),
    );
  }
}

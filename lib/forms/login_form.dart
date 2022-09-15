// Create a Form widget.
import 'package:flutter/material.dart';
import 'package:goodfood_mobile/features/login/login.dart';
import 'package:goodfood_mobile/features/login/register.dart';
import 'package:goodfood_mobile/services/user_service.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
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
                  controller: nameController,
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
                          Future<bool?> awaitResponse = userService
                              .userExistWithMail(nameController.text);
                          awaitResponse.then((userExist) {
                            if (userExist ?? true) {
                              route = Login(email: nameController.text);
                            } else {
                              route = Register(email: nameController.text);
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

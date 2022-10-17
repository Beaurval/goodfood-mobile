// Create a Form widget.
import 'package:flutter/material.dart';
import 'package:goodfood_mobile/features/login/login.dart';
import 'package:goodfood_mobile/features/login/register.dart';
import 'package:goodfood_mobile/models/User/create_user_model/create_user_model.dart';
import 'package:goodfood_mobile/models/user/get_user_model/get_user_model.dart';
import 'package:goodfood_mobile/services/user_service.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key, this.email = "", this.errorMessage});
  final String email;
  final String? errorMessage;

  @override
  RegistrationFormState createState() {
    return RegistrationFormState();
  }
}

class RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController =
        TextEditingController(text: widget.email);
    TextEditingController passwordController = TextEditingController();
    TextEditingController passwordConfirmController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();

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
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
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
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: passwordConfirmController,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez remplir ce champ';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirmez le mot de passe',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: lastNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez remplir ce champ';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nom',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: firstNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez remplir ce champ';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Prénom',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez remplir ce champ';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Téléphone',
                  ),
                ),
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: ElevatedButton(
                      child: const Text("Confirmer"),
                      onPressed: () {
                        Widget route = Login(email: emailController.text);
                        if (_formKey.currentState!.validate()) {
                          var userModel = CreateUserModel();

                          userModel.email = emailController.text;
                          userModel.firstName = firstNameController.text;
                          userModel.lastName = lastNameController.text;
                          userModel.phoneNumber = phoneController.text;
                          userModel.password = passwordController.text;
                          userModel.passwordConfirmation =
                              passwordConfirmController.text;

                          Future<GetUserModel?> awaitResponse =
                              userService.signUpUser(userModel);

                          awaitResponse.then((getUserModel) {
                            if (getUserModel?.id == 0 || getUserModel == null) {
                              route = Register(email: emailController.text);
                              final snackBar = SnackBar(
                                content: const Text(
                                    "Les mot de passes ne sont pas identiques"),
                                action: SnackBarAction(
                                  label: 'Fermer',
                                  onPressed: () {},
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => route,
                                ),
                              );
                            }
                          });
                        }
                      })),
            ],
          )),
    );
  }
}

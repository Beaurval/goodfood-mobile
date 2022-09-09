// Create a Form widget.
import 'package:flutter/material.dart';
import 'package:goodfood_mobile/features/login/login.dart';
import 'package:goodfood_mobile/features/login/register.dart';
import 'package:goodfood_mobile/services/user_service.dart';

class AskMailForm extends StatefulWidget {
  const AskMailForm({super.key});

  @override
  AskMailFormState createState() {
    return AskMailFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class AskMailFormState extends State<AskMailForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<AskMailFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    var userService = UserService();

    // Build a Form widget using the _formKey created above.
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

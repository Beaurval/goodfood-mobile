import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:goodfood_mobile/data/api/user_api.dart';
import 'package:goodfood_mobile/data/models/request/create_user_with_role_request.dart';
import 'package:goodfood_mobile/data/models/response/create_user__with_role_response.dart';
import 'package:goodfood_mobile/data/models/request/create_user_request.dart';
import 'package:goodfood_mobile/data/repository/auth_repository_impl.dart';
import 'package:goodfood_mobile/domain/repository/auth_repository.dart';
import 'package:goodfood_mobile/domain/use_cases/sign_up_usecase.dart';
import 'package:goodfood_mobile/presentation/authentication/screens/login_method/email_login_screen.dart';
import 'package:goodfood_mobile/presentation/authentication/viewmodels/sign_up/sign_up_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddUserScreen extends HookConsumerWidget {
  final emailcon = TextEditingController();
  final passwordcon = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  AddUserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AuthRepository _repository = ref.watch(authRepositoryProvider);
    var user = auth.currentUser;

    const List<String> list = <String>[
      'Livreur',
      'Administrateur',
      'Restaurateur'
    ];
    var selectedValue = useState<String>('Livreur');
    var emailController = useTextEditingController(text: '');
    var firstNameController = useTextEditingController(text: '');
    var lastNameController = useTextEditingController(text: '');
    var phoneController = useTextEditingController(text: '');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Création de compte utilisateur"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 60.0),
              child: Center(
                child: SizedBox(
                    width: double.infinity,
                    height: 70,
                    child: Text(
                        style: TextStyle(fontSize: 22),
                        textAlign: TextAlign.center,
                        'Créer un compte pour...')),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              margin: const EdgeInsets.all(15.0),
              padding: EdgeInsets.only(left: 15),
              width: double.infinity,
              child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                focusColor: Colors.black,
                items: list.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(style: TextStyle(color: Colors.black), value),
                  );
                }).toList(),
                onChanged: (value) {
                  selectedValue.value = value ?? 'One';
                },
                value: selectedValue.value,
              )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                controller: emailController,
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
                controller: lastNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nom',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextFormField(
                controller: firstNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Prénom',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
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
                  _repository.createUserWithRole(CreateUserWithRoleRequest(
                      email: emailController.text,
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                      phoneNumber: phoneController.text,
                      roleId:
                          (list.indexOf(selectedValue.value) + 1).toString()));
                },
                child: const Text(
                  'Confirmer',
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

import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:goodfood_mobile/presentation/authentication/screens/login_method/email_login_screen.dart';
import 'package:goodfood_mobile/presentation/authentication/screens/sing_up_screen.dart';
import 'package:goodfood_mobile/presentation/home/screens/home_screen.dart';
import 'package:goodfood_mobile/presentation/restaurant/screens/restaurant_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:morphable_shape/morphable_shape.dart';

class LoginMethodScreen extends HookConsumerWidget {
  LoginMethodScreen({super.key});
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ShapeBorder rectangle = RectangleShapeBorder.fromJson(jsonDecode(
        '{"type":"Rectangle","border":{"color":"0064bc","width":0,"style":"none","strokeCap":"butt","strokeJoin":"miter"},"borderRadius":{"topLeft":{"x":"0px","y":"0px"},"topRight":{"x":"0px","y":"0px"},"bottomLeft":{"x":"0px","y":"0px"},"bottomRight":{"x":"100%","y":"18.47014925373115%"}},"cornerStyles":{"topLeft":"rounded","bottomLeft":"rounded","topRight":"rounded","bottomRight":"straight"}}'));
    Decoration decoration = ShapeDecoration(
        shape: rectangle, color: const Color.fromARGB(255, 0, 100, 188));
    return Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(children: [
              Container(
                height: 300.00,
                padding: const EdgeInsets.only(top: 100),
                width: double.infinity,
                decoration: decoration,
                child: const Text(
                  'The good food',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.00,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Wrap(runSpacing: -25, children: <Widget>[
                Container(
                    padding: const EdgeInsets.only(top: 50.00),
                    child: SignInButton(
                      Buttons.Google,
                      onPressed: () => {},
                      text: 'Continuer avec Google',
                    )),
                Container(
                    padding: const EdgeInsets.only(top: 50.00),
                    child: SignInButton(
                      Buttons.Facebook,
                      onPressed: () => {},
                      text: 'Continuer avec Facebook',
                    )),
                Container(
                    padding: const EdgeInsets.only(top: 50.00),
                    child: SignInButton(
                      Buttons.Email,
                      onPressed: () => {
                        if (auth.currentUser != null)
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EmailLoginScreen()))
                          }
                        else
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RestaurantScreen()))
                          }
                      },
                      text: 'Se connecter par email',
                    )),
              ]),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: const Divider(
                  color: Colors.black,
                  height: 10,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SingUpScreen()));
                  },
                  highlightColor: const Color.fromARGB(255, 188, 0, 91),
                  child: const Text('Pas de compte utlisateur ?',
                      style:
                          TextStyle(color: Color.fromARGB(255, 0, 100, 188))),
                ),
              )
            ])));
  }
}

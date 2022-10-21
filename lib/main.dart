import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:goodfood_mobile/firebase_options.dart';
import 'package:goodfood_mobile/presentation/admin/screens/add_user_screen.dart';
import 'package:goodfood_mobile/presentation/admin/screens/admin_home_screen.dart';
import 'package:goodfood_mobile/presentation/authentication/screens/login_method_screen.dart';
import 'package:goodfood_mobile/presentation/home/screens/home_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoodFood',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          bottomSheetTheme:
              const BottomSheetThemeData(backgroundColor: Colors.transparent)),
      home: LoginMethodScreen(),
      // home: AdminHomeScreen(),
    );
  }
}

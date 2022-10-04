import 'dart:io';

import 'package:flutter/material.dart';
import 'package:goodfood_mobile/presentation/authentication/screens/login_method_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(ProviderScope(child: MyApp()));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoodFood',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          bottomSheetTheme:
              const BottomSheetThemeData(backgroundColor: Colors.transparent)),
      home: LoginMethodScreen(),
    );
  }
}

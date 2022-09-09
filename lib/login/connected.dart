// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() {
  runApp(const Connected());
}

class Connected extends StatelessWidget {
  const Connected({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connected',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bonjour'),
        ),
        body: const Center(
          child: Text('Valentin, vous êtes connecté à l\'application'),
        ),
      ),
    );
  }
}

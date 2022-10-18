import 'package:flutter/material.dart';

class ProduitScreen extends StatelessWidget {
  const ProduitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("GoodFood"),
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 0, 100, 188),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close)
            )
          ],
        ),
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              pinned: true,
              expandedHeight: 200.0,
              centerTitle: true,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Nom du produit'),
                background: FlutterLogo(),
              ),
            ),
          ],
        ));
  }
}

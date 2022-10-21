import 'package:flutter/material.dart';

class DetailCommandeScreen extends StatefulWidget {

  DetailCommandeScreen();

  @override
  State<DetailCommandeScreen> createState() =>
      _DetailCommandeScreenState();
}

class _DetailCommandeScreenState extends State<DetailCommandeScreen> {

  _DetailCommandeScreenState();

  @override
  void initState() {
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("GoodFood : Vos Commande"),
          backgroundColor: const Color.fromARGB(255, 0, 100, 188),
          automaticallyImplyLeading: true,
        ),
        body: ListView(
          children: [
            Text("sldjkhjkdfhjkdhf")
          ],
        ));
  }
}

import 'package:flutter/material.dart';

class ListCommandeScreen extends StatefulWidget {

  ListCommandeScreen();

  @override
  State<ListCommandeScreen> createState() =>
      _ListCommandeScreenState();
}

class _ListCommandeScreenState extends State<ListCommandeScreen> {

  _ListCommandeScreenState();

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

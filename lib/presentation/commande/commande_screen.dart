import 'package:flutter/material.dart';
import 'package:goodfood_mobile/presentation/restaurant/screens/produit_screen.dart';

class CommandeScreen extends StatelessWidget {
  const CommandeScreen({super.key});

  // List<>generateListCategory(){
  //
  // }

  @override
  Widget build(BuildContext context) {

    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
        appBar: AppBar(
          title: Text("GoodFood : Commande"),
          backgroundColor: const Color.fromARGB(255, 0, 100, 188),
          automaticallyImplyLeading: true,
        ),
      bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height * 0.08,
          width: MediaQuery.of(context).size.width,
          child: Center(child: ElevatedButton(
            style: style,
            onPressed: () {

            },
            child: const Text('Valider la Commande'),
          ))),
      body: Column(
        children: [
          Expanded(child: Container(
            child: ListView(
              children: [
                ListTile(title: Text("kdjflkdjklfjlkdf"),),
                ListTile(title: Text("kdjflkdjklfjlkdf"),),
                ListTile(title: Text("kdjflkdjklfjlkdf"),),
                ListTile(title: Text("kdjflkdjklfjlkdf"),),
                ListTile(title: Text("kdjflkdjklfjlkdf"),),
                ListTile(title: Text("kdjflkdjklfjlkdf"),),
                ListTile(title: Text("kdjflkdjklfjlkdf"),),
                ListTile(title: Text("kdjflkdjklfjlkdf"),),
                ListTile(title: Text("kdjflkdjklfjlkdf"),),
                ListTile(title: Text("kdjflkdjklfjlkdf"),),
                ListTile(title: Text("kdjflkdjklfjlkdf"),),
                ListTile(title: Text("kdjflkdjklfjlkdf"),),
                ListTile(title: Text("kdjflkdjklfjlkdf"),),
                ListTile(title: Text("kdjflkdjklfjlkdf"),),
                ListTile(title: Text("kdjflkdjklfjlkdf"),),
                ListTile(title: Text("kdjflkdjklfjlkdf"),),
                ListTile(title: Text("kdjflkdjklfjlkdf"),),
                ListTile(title: Text("kdjflkdjklfjlkdf"),),
                ListTile(title: Text("kdjflkdjklfjlkdf"),),
                ListTile(title: Text("kdjflkdjklfjlkdf"),),
                ListTile(title: Text("kdjflkdjklfjlkdf"),),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

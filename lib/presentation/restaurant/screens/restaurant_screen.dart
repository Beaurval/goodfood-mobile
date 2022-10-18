import 'package:flutter/material.dart';
import 'package:goodfood_mobile/presentation/restaurant/screens/produit_screen.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

   // List<>generateListCategory(){
   //
   // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("GoodFood"),
          backgroundColor: const Color.fromARGB(255, 0, 100, 188),
          automaticallyImplyLeading: true,
        ),
        // display si la commande est pas vide
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                    const CommandeScreen()));
          },
          icon: const Icon(Icons.shopping_bag),
          label: const Text('Valider la commande : 13€40'),
          backgroundColor: Colors.green,
        ),
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              pinned: true,
              expandedHeight: 200.0,
              centerTitle: true,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Nom du restaurant'),
                background: FlutterLogo(),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              const ProduitScreen()));
                    },
                  );
                },
                childCount: 10, // 1000 list items
              ),
            ),
          ],
        ));
  }
}

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:goodfood_mobile/data/api/config_api.dart';
import 'package:goodfood_mobile/data/commandeController.dart';
import 'package:goodfood_mobile/domain/entities/user/restaurant.dart';
import 'package:goodfood_mobile/presentation/commande/commande_screen.dart';
import 'package:goodfood_mobile/presentation/common/widgets/product_list_tile.dart';



class RestaurantScreen extends StatefulWidget {
  final data;

  RestaurantScreen(this.data);

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState(this.data);
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  final Restaurant data;
  double price = 0.0;
  var dataRestaurant;
  _RestaurantScreenState(this.data);

  Future<List<Map<String, dynamic>>> getProduitRestaurant() async {
    final response =
        await Dio().get("${ConfigApi.baseUrl+ConfigApi.productsEndpoint+ConfigApi.providerEndpoint}/" + this.data.id.toString());
    //récupère la réponse
    if (response.statusCode == 200) {
      final results = List<Map<String, dynamic>>.from(response.data);
      if (results.isNotEmpty) {
        return results;
      }
    }
    return [];
  }

  updatePanier(int index, counter){
    setState(() {
      CommandeController.panier[index] = counter;
    });
    calculatePrice();
  }

  calculatePrice(){
    double new_price = 0.0;

    CommandeController.panier.asMap().forEach((key, value) {
      new_price += (double.parse(value.toString()) * CommandeController.produit[key]['price']);
    });
    setState(() {
      price = new_price;
    });
  }

  @override
  void initState() {
    super.initState();
    dataRestaurant = getProduitRestaurant();
    price = 0.0;
    CommandeController.restaurantId = data.id;
  }

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
            if(price != 0.0) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CommandeScreen(CommandeController.produit, updatePanier)));
            }
          },
          icon: const Icon(Icons.shopping_bag),
          label: Text("$price €"),
          backgroundColor: price != 0.0 ? Colors.green : Colors.grey
        ),
        body: FutureBuilder<List<Map<String, dynamic>>>(
            future: dataRestaurant,
            builder: (BuildContext context,
                AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
              CommandeController.produit = snapshot.connectionState != ConnectionState.waiting
                  ? snapshot.data!
                  : [];
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    expandedHeight: MediaQuery.of(context).size.height * 0.35,
                    collapsedHeight: MediaQuery.of(context).size.height * 0.10,
                    automaticallyImplyLeading: false,
                    flexibleSpace: FlexibleSpaceBar(
                      title: ClipRRect(
                          borderRadius: BorderRadius.circular(4.0),
                          child: Container(
                              padding: const EdgeInsets.all(10),
                              color: Colors.blue,
                              child: Text(data!.name!))),
                      background: data!.providerImage!,
                    ),
                  ),
                  const SliverAppBar(
                    automaticallyImplyLeading: false,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text('Liste des produits disponible'),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        if (snapshot.connectionState !=
                            ConnectionState.waiting) {
                          CommandeController.produit = snapshot.connectionState != ConnectionState.waiting
                              ? snapshot.data!
                              : [];
                          if(!CommandeController.panier.asMap().containsKey(index)){
                            CommandeController.panier.insert(index, 0);
                          }
                          return ProductListTile(CommandeController.produit![index], CommandeController.panier[index], index, updatePanier);
                        }
                      },
                      childCount: CommandeController.produit!.length, // 1000 list items
                    ),
                  ),
                ],
              );
            }));
  }
}

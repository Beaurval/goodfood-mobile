import 'package:flutter/material.dart';
import 'package:goodfood_mobile/presentation/common/widgets/product_list_tile.dart';



class CommandeScreen extends StatefulWidget {
  final produits;
  final panier;
  final callback;

  CommandeScreen(this.panier, this.produits, this.callback);

  @override
  State<CommandeScreen> createState() => _CommandeScreenState(this.panier, this.produits, this.callback);
}

class _CommandeScreenState extends State<CommandeScreen> {
  final produits;
  final panier;
  final callback;
  var price = 0.0;

  _CommandeScreenState(this.panier, this.produits, this.callback);

  updatePanier(int index, counter){
    setState(() {
      this.panier[index] = counter;
    });
    calculatePrice();
  }

  calculatePrice(){
    double new_price = 0.0;

    panier.asMap().forEach((key, value) {
      new_price += (double.parse(value.toString()) * produits[key]['price']);
    });
    setState(() {
      price = new_price;
    });
  }

  List<Widget> buildPanier(){
    List<Widget> list = [];
    panier.asMap().forEach((key, value) {
      if(panier[key] > 0){
        list.add(ProductListTile(produits[key], panier[key], key, updatePanier));
      }
    });
    return list;
  }

  @override
  void initState() {
    calculatePrice();
  }

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
                ListTile(title: Text("Récap de la commande")),
                ...buildPanier(),
                ListTile(
                  title: Text("Prix total : $price €"),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}

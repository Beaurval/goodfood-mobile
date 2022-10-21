import 'package:flutter/material.dart';
import 'package:goodfood_mobile/data/commandeController.dart';
import 'package:goodfood_mobile/presentation/common/widgets/product_list_tile.dart';
import 'package:goodfood_mobile/presentation/home/screens/home_screen.dart';

class CommandeScreen extends StatefulWidget {
  final produits;
  final callback;

  CommandeScreen(this.produits, this.callback);

  @override
  State<CommandeScreen> createState() =>
      _CommandeScreenState(this.produits, this.callback);
}

class _CommandeScreenState extends State<CommandeScreen> {
  final produits;
  final callback;
  var price = 0.0;
  var tips = 0.0;
  int address = 0;

  _CommandeScreenState(this.produits, this.callback);

  updatePanier(int index, counter) {
    setState(() {
      CommandeController.panier[index] = counter;
    });
    calculatePrice();
  }

  calculatePrice() {
    double new_price = 0.0;

    CommandeController.panier.asMap().forEach((key, value) {
      new_price += (double.parse(value.toString()) * produits[key]['price']);
    });
    setState(() {
      price = new_price;
    });
  }

  List<Widget> buildPanier() {
    List<Widget> list = [];
    CommandeController.panier.asMap().forEach((key, value) {
      if (CommandeController.panier[key] > 0) {
        list.add(ProductListTile(
            produits[key], CommandeController.panier[key], key, updatePanier));
      }
    });
    return list;
  }

  List<DropdownMenuItem<dynamic>> buildDropDownButton() {
    List<DropdownMenuItem<dynamic>> list = [];
    CommandeController.panier.asMap().forEach((key, value) {});
    list.add(DropdownMenuItem(value: 0, child: Text("Option 1")));
    list.add(DropdownMenuItem(value: 1, child: Text("Option 2")));
    list.add(DropdownMenuItem(value: 2, child: Text("Option 3")));
    list.add(DropdownMenuItem(value: 3, child: Text("Option 4")));
    list.add(DropdownMenuItem(value: 4, child: Text("Option 5")));
    return list;
  }

  showAlertDialog(BuildContext context, String message, callback) {
    Widget continueButton = TextButton(
      child: Text("Retour"),
      onPressed: callback,
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(message),
      actions: [
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
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
          title: Text("GoodFood : Récap Commande"),
          backgroundColor: const Color.fromARGB(255, 0, 100, 188),
          automaticallyImplyLeading: true,
        ),
        bottomNavigationBar: Container(
            height: MediaQuery.of(context).size.height * 0.16,
            width: MediaQuery.of(context).size.height * 0.5 > 400.0
                ? MediaQuery.of(context).size.height * 0.5
                : 400.0,
            child: Column(
              children: [
                Container(
                  // alignment: Alignment.centerRight,
                  child: Text("HT : $price €"),
                ),
                Container(
                  // alignment: Alignment.centerRight,
                  child: Text(
                      "TVA : ${double.parse((price * 0.1).toStringAsFixed(2))} €"),
                ),

                // Container(
                //     width: 50,
                //     alignment: Alignment.centerRight,
                //     child: Row(
                //       children: [
                //         Text("Tips : "),
                //         Container(
                //           width: 50,
                //           child: TextField(
                //             maxLines: 1,
                //             onChanged: (value) {
                //               setState(() {
                //                 tips = double.parse(value);
                //               });
                //             },
                //             keyboardType: TextInputType.number,
                //             inputFormatters: <TextInputFormatter>[
                //               FilteringTextInputFormatter.allow(
                //                   RegExp(r'[0-9]')),
                //             ],
                //           ),
                //         )
                //       ],
                //     )),
                Container(
                  // alignment: Alignment.centerRight,
                  child: Text(
                      "Prix total des produits : ${double.parse((price * 1.1).toStringAsFixed(2))} €"),
                ),
                Center(
                    child: ElevatedButton(
                  style: style,
                  onPressed: () {
                    CommandeController.createCommande().then((e) {
                      if (e == 200) {
                        showAlertDialog(
                            context, "La commande a bien été payé", () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        });
                      } else {
                        showAlertDialog(context,
                            "Erreur lors du paiement de la commande", () {});
                      }
                    });
                  },
                  child: const Text('Payer la Commande'),
                ))
              ],
            )),
        body: Center(
            child: Container(
          // width: MediaQuery.of(context).size.height * 0.5 > 400.0
          //     ? MediaQuery.of(context).size.height * 0.5
          //     : 400.0,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                margin: EdgeInsets.all(10),
                child: Text("Selection d'adresse de livraison",
                    style: TextStyle(fontSize: 18))),
            Container(
                height: 50,
                width: MediaQuery.of(context).size.height * 0.5 > 400.0
                    ? MediaQuery.of(context).size.height * 0.5
                    : 400.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: DropdownButton(
                            isExpanded: true,
                            value: address,
                            hint: Text("Veuillez choisir une adresse"),
                            alignment: Alignment.centerRight,
                            items: buildDropDownButton(),
                            onChanged: (value) {
                              setState(() {
                                address = value;
                              });
                            })),
                    ElevatedButton(
                      child: Icon(Icons.add),
                      onPressed: () {},
                    )
                  ],
                )),
            const Divider(
              color: Colors.grey,
              height: 25,
            ),
            Container(
                height: MediaQuery.of(context).size.height - 350,
                width: MediaQuery.of(context).size.height * 0.5 > 400.0
                    ? MediaQuery.of(context).size.height * 0.5
                    : 400.0,
                child: ListView(
                  children: [
                    ListTile(title: Text("Récap du panier")),
                    ...buildPanier(),
                  ],
                ))
          ]),
        )));
  }
}

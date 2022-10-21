import 'package:flutter/material.dart';
import 'package:goodfood_mobile/presentation/restaurant/screens/produit_screen.dart';

class ProductListTile extends StatefulWidget {
  final produit;
  var counter;
  final index;
  final callback;

  ProductListTile(this.produit, this.counter, this.index, this.callback);

  @override
  State<ProductListTile> createState() => _ProductListTileState(
      this.produit, this.counter, this.index, this.callback);
}

class _ProductListTileState extends State<ProductListTile> {
  final produit;
  var counter;
  final index;
  final callback;

  _ProductListTileState(this.produit, this.counter, this.index, this.callback);

  initState() {}

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(produit['name']!),
      subtitle: Text(produit['price'].toString() + "€"),
      trailing: Container(
        alignment: Alignment.centerRight,
        width: MediaQuery.of(context).size.width * 0.5,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      if (counter > 0) {
                        counter--;
                        callback(index, counter);
                      }
                    });
                  },
                  icon: Icon(Icons.remove)),
              Text(counter.toString()),
              IconButton(
                  onPressed: () {
                    setState(() {
                      counter++;
                      callback(index, counter);
                    });
                  },
                  icon: Icon(Icons.add))
            ],
          )),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProduitScreen(produit!)));
      },
    );
  }
}

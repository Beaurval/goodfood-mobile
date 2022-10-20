import 'package:flutter/material.dart';
import 'dart:convert';

class ProduitScreen extends StatelessWidget {
  var data;

  ProduitScreen(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("GoodFood : Detail Produit"),
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
            SliverAppBar(
              pinned: true,
              expandedHeight: 200.0,
              centerTitle: true,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                title: ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        color: Colors.blue,
                        child: Text(data!['name']))),
                background:  Image.memory(
                  base64.decode(data['productImage']),
                  height: 70,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ));
  }
}

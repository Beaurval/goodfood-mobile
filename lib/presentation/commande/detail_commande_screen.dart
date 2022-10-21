import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DetailCommandeScreen extends StatefulWidget {
 final data;
 final restaurant;

  DetailCommandeScreen(this.data, this.restaurant);

  @override
  State<DetailCommandeScreen> createState() =>
      _DetailCommandeScreenState(this.data, this.restaurant);
}

class _DetailCommandeScreenState extends State<DetailCommandeScreen> {
  final data;
  final restaurant;

  _DetailCommandeScreenState(this.data, this.restaurant);

  @override
  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("GoodFood : Commande"),
          backgroundColor: const Color.fromARGB(255, 0, 100, 188),
          automaticallyImplyLeading: true,
        ),
        body: ListView(
          children: [
            Text(data["created"]),
            Text(data["id"].toString()),
            Text(restaurant["name"]),
          ],
        ));
  }
}

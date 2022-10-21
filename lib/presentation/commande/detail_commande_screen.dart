import 'package:dio/dio.dart';
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

  void getLivraisonData() async {
    try {
      final response = await Dio().get("http://20.124.42.95/api/livraison/init");
      if (response.statusCode == 200) {
      } else {
      }
    } on DioError catch (err) {
      debugPrint(err.response?.statusMessage ?? 'Something went wrong');
    }
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
            Text("sldjkhjkdfhjkdhf")
          ],
        ));
  }
}

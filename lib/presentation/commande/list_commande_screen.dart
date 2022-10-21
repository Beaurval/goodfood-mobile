import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:goodfood_mobile/data/api/config_api.dart';
import 'package:goodfood_mobile/data/api/restaurant_api.dart';
import 'package:goodfood_mobile/presentation/commande/detail_commande_screen.dart';

class ListCommandeScreen extends StatefulWidget {
  ListCommandeScreen();

  @override
  State<ListCommandeScreen> createState() => _ListCommandeScreenState();
}

class _ListCommandeScreenState extends State<ListCommandeScreen> {
  List<ListTile> new_list = [];

  _ListCommandeScreenState();

  @override
  void initState() {
    new_list = [];
    getListCommandeUser().then((list) {
      buildListCommandeUser(list);
    });
  }

  Future<List<dynamic>> getListCommandeUser() async {
    try {
      final response = await Dio().get("${ConfigApi.baseUrl}/orders/users/1");
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return [];
      }
    } on DioError catch (err) {
      debugPrint(err.response?.statusMessage ?? 'Something went wrong');
      return [];
    }
  }

  List<ListTile> buildListCommandeUser(List<dynamic> list) {
    list.forEach((value) {
      debugPrint(value.toString());
      RestaurantApi()
          .getDetailRestaurant(value['restaurantId'])
          .then((restaurant) {
        setState(() {
          new_list.add(ListTile(
            title: Text(restaurant['name']),
            subtitle: Text(value["created"].toString()),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => DetailCommandeScreen(value, restaurant)));
            },
          ));
        });
      });
    });
    return new_list;
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
          children: [...new_list],
        ));
  }
}

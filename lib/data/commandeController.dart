import 'dart:io';

import 'package:dio/dio.dart';
import 'package:goodfood_mobile/data/api/config_api.dart';

class CommandeController {
  static List panier = [];
  static List produit = [];
  static Object? adresse;
  static int? restaurantId;
  static int? userId;
  static double? tips = 0;

  static Future<int> createCommande() async {
    Map data = {
      "tip": tips,
      "lines": [],
      "restaurantId": restaurantId,
      "userId": userId
    };
    final response = await Dio().post("${ConfigApi.baseUrl + ConfigApi.ordersEndpoint}",
        data: data,
        options: Options(
            headers: {HttpHeaders.contentTypeHeader: "application/json"}));

    return response.statusCode!;
  }

  static List getLines(){
    panier.asMap().forEach((key, value) {

    });
    return [];
  }
}

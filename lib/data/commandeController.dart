import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:goodfood_mobile/core/failure.dart';
import 'package:goodfood_mobile/data/api/config_api.dart';

class CommandeController {
  static List panier = [];
  static List produit = [];
  static Object? adresse;
  static int? restaurantId;
  static int? userId;
  static double? tips = 0;

  static Future<int> createLivraison(int commandeId) async {
    try {
      Map data = {
        "commande_id": commandeId,
        "livreur_id": null,
        "restaurant_id": restaurantId,
        "adresse_id": adresse,
        "client_id": userId
      };
      final response = await Dio().post(
          "http://20.124.42.95/api/livraison/init",
          data: data,
          options: Options(
              headers: {HttpHeaders.contentTypeHeader: "application/json"}));
      debugPrint(response.statusCode.toString());
      return response.statusCode!;
    } on DioError catch (err) {
      debugPrint(err.response?.statusMessage ?? 'Something went wrong');
      return -1;
    }
  }

  static Future<dynamic> createCommande() async {
    try {
      debugPrint(tips.toString());
      debugPrint(restaurantId.toString());
      Map data = {
        'tip': tips,
        "lines": [],
        'restaurantId': restaurantId,
        'userId': 1
      };
      final response = await Dio().post(
          "${ConfigApi.baseUrl + ConfigApi.ordersEndpoint}",
          data: data,
          options: Options(
              headers: {HttpHeaders.contentTypeHeader: "application/json"}));
      return response.data!;
    } on DioError catch (err) {
      debugPrint(err.response?.statusMessage ?? 'Something went wrong');
      return 500;
    }
  }

  static List getLines() {
    panier.asMap().forEach((key, value) {});
    return [];
  }
}

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:goodfood_mobile/core/failure.dart';
import 'package:goodfood_mobile/data/api/config_api.dart';
import 'package:goodfood_mobile/data/models/response/restaurant_response.dart';
import 'package:riverpod/riverpod.dart';

final restaurantApiProvider = Provider<RestaurantApi>((ref) => RestaurantApi());

class RestaurantApi {
  static const String baseUrl = ConfigApi.baseUrl;
  static const String providerEndpoint = ConfigApi.providerEndpoint;

  Future<Either<Failure, List<RestaurantResponse>>> getRestaurants() async {
    final response = await Dio().get("$baseUrl$providerEndpoint");
    //récupère la réponse
    if (response.statusCode == 200) {
      final results = List<Map<String, dynamic>>.from(response.data);
      if (results.isNotEmpty) {
        return Right(
            results.map((e) => RestaurantResponse.fromMap(e)).toList());
      }
    }

    return const Right([]);
  }

  Future<Either<Failure, List<RestaurantResponse>>> getDetailRestaurant(id) async {
    final response = await Dio().get("$baseUrl$providerEndpoint/${id}");
    //récupère la réponse
    if (response.statusCode == 200) {
      final results = List<Map<String, dynamic>>.from(response.data);
      if (results.isNotEmpty) {
        return Right(
            results.map((e) => RestaurantResponse.fromMap(e)).toList());
      }
    }

    return const Right([]);
  }
}

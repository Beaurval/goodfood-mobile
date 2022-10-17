import 'dart:io';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:goodfood_mobile/core/failure.dart';
import 'package:goodfood_mobile/data/models/response/restaurant_response.dart';
import 'package:riverpod/riverpod.dart';

final restaurantApiProvider = Provider<RestaurantApi>((ref) => RestaurantApi());

class RestaurantApi {
  static const String baseUrl = "https://10.0.2.2:7186/api";
  static const String userEndpoint = "/provider";

  Future<Either<Failure, List<RestaurantResponse>>> getUsers() async {
    try {
      final response = await Dio().get("$baseUrl$userEndpoint");
      //récupère la réponse
      if (response.statusCode == 200) {
        final results = List<Map<String, dynamic>>.from(response.data);
        if (results.isNotEmpty) {
          return Right(
              results.map((e) => RestaurantResponse.fromMap(e)).toList());
        }
      }
    } on DioError catch (err) {
      Left(Failure(
          message: err.response?.statusMessage ?? 'Une erreur est survenue.'));
    } on SocketException catch (err) {
      const Left(Failure(message: 'Veuillez vérifier votre connexion.'));
    }

    return const Right([]);
  }
}

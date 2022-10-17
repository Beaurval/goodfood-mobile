import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:goodfood_mobile/core/failure.dart';
import 'package:goodfood_mobile/domain/entities/user/restaurant.dart';

abstract class RestaurantRepository {
  Future<Either<Failure, List<Restaurant>>> getRestaurants();

  Future<Either<Failure, Restaurant>> createRestaurant() {
    throw UnimplementedError();
  }
}

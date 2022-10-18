import 'package:either_dart/src/either.dart';
import 'package:goodfood_mobile/domain/entities/user/restaurant.dart';
import 'package:riverpod/riverpod.dart';

import 'package:goodfood_mobile/core/failure.dart';
import 'package:goodfood_mobile/data/api/restaurant_api.dart';
import 'package:goodfood_mobile/domain/repository/restaurant_repository.dart';

final restaurantRepositoryProvider = Provider<RestaurantRepositoryImpl>(
    (ref) => RestaurantRepositoryImpl(ref.read(restaurantApiProvider)));

class RestaurantRepositoryImpl extends RestaurantRepository {
  final RestaurantApi _restaurantApi;

  RestaurantRepositoryImpl(this._restaurantApi);

  @override
  Future<Either<Failure, List<Restaurant>>> getRestaurants() async {
    var repositoryResult = await _restaurantApi.getRestaurants();
    if (repositoryResult.isLeft) {
      return Left(repositoryResult.left);
    }

    return Right(repositoryResult.right
        .map((restaurant) => restaurant.toEntity())
        .toList());
  }
}

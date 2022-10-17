import 'package:either_dart/either.dart';
import 'package:goodfood_mobile/core/failure.dart';
import 'package:goodfood_mobile/data/repository/restaurant_repository_impl.dart';
import 'package:goodfood_mobile/domain/repository/restaurant_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../entities/user/restaurant.dart';

final getRestaurantsUseCaseProvider = Provider<GetRestaurantsUseCase>(
    (ref) => GetRestaurantsUseCase(ref.watch(restaurantRepositoryProvider)));

class GetRestaurantsUseCase {
  final RestaurantRepository _restaurantRepository;

  GetRestaurantsUseCase(this._restaurantRepository);

  Future<Either<Failure, List<Restaurant>>> execute() async {
    return await _restaurantRepository.getRestaurants();
  }
}

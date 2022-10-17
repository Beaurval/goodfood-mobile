import 'package:either_dart/either.dart';
import 'package:flutter/widgets.dart';
import 'package:goodfood_mobile/core/failure.dart';
import 'package:goodfood_mobile/domain/entities/user/restaurant.dart';
import 'package:goodfood_mobile/domain/use_cases/get_restaurants_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeScreenViewModelProvider = ChangeNotifierProvider.autoDispose(((ref) {
  final getRestaurantUseCase = ref.watch(getRestaurantsUseCaseProvider);
  return HomeScreenViewModel(getRestaurantUseCase);
}));

class HomeScreenViewModel extends ChangeNotifier {
  final GetRestaurantsUseCase _restaurantUseCase;

  HomeScreenViewModel(this._restaurantUseCase);

  Future<Either<Failure, List<Restaurant>>> getRestaurants() async {
    return await _restaurantUseCase.execute();
  }
}
